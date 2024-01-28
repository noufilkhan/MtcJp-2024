using System.Security.Cryptography;
using System.Text;
using DatabaseApi.Dtos;
using DatabaseApi.Interfaces;
using DatabaseApi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DatabaseApi.Controllers;

[Authorize]
public class AccountController : BaseApiController
{
    private VehiclesContext _context;

    private ITokenService _tokenService;

    public AccountController(
        VehiclesContext context,
        ITokenService tokenservice
        )
    {
        _context = context;
        _tokenService = tokenservice;
    }

    // https://localhost:5001/api/account/login
    /*
        {
            "Username": "noufil",
            "Password": "P@$$w0rd"
        }
    */

    private UserDto getUserDto(string _username, int _userid, string _userguid,
        int _entity, string _token, string _result, string _resultmessage)
    {
        return new UserDto
        {
            Username = _username,
            UserId = _userid,
            UserGuid = _userguid,
            Entity = _entity,
            Token = _token,
            Result = _result,
            ResultMessage = _resultmessage
        };
    }

    [HttpPost("login")]
    [AllowAnonymous]
    public async Task<ActionResult<UserDto>> Login(LoginDto logindto)
    {
        var user = await _context.UserInfos.FirstOrDefaultAsync(
            x => x.Username == logindto.Username
        );

        if (user == null)
        {
            return getUserDto(string.Empty, 0, string.Empty, 0,
            string.Empty, "Error", "Username is incorrect");
        }

        List<byte[]> byteList = computeHash(user.PasswordSalt, logindto.Password);
        var computedhash = byteList[0];

        for (int i = 0; i < computedhash.Length; i++)
        {
            if (computedhash[i] != user.PasswordHalt[i])
                return getUserDto(string.Empty, 0, string.Empty, 0,
            string.Empty, "Error", "Username or Password is incorrect");
        }

        return getUserDto(user.Username, user.UserId, user.Guid, user.Entity,
                    _tokenService.CreateToken(user), "Success", string.Empty);
    }


    // https://localhost:5001/api/account/register
    /*
        {
            "Username": "crimepatrol22",
            "Password": "P@$$w0rd",
            "Entity": "1",
            "FirstName": "Crime",
            "MiddleName": "",
            "LastName": "Patrol",
            "EmailAddress": "noufil@aanass.net",
            "ContactInfo": "+97334330829",
            "City": "Karachi",
            "Country": "Pakistan",
            "Language": "English"
        }
    */
    [HttpPost("register")]
    public async Task<ActionResult<UserDto>> Register(RegisterDto registerdto)
    {
        if (await UserExists(registerdto.Username))
            return BadRequest("Username is taken");

        List<byte[]> byteList = computeHash(null, registerdto.Password);

        var user = new UserInfo
        {
            Username = registerdto.Username.ToLower(),
            PasswordHalt = byteList[0],
            PasswordSalt = byteList[1],
            Entity = registerdto.Entity,
            FirstName = registerdto.FirstName,
            MiddleName = registerdto.MiddleName,
            LastName = registerdto.LastName,
            EmailAddress = registerdto.EmailAddress,
            ContactInfo = registerdto.ContactInfo,
            City = registerdto.City,
            Country = registerdto.Country,
            Language = registerdto.Language,
            LastModifiedBy = ""
        };

        _context.UserInfos.Add(user);
        await _context.SaveChangesAsync();

        return new UserDto
        {
            Username = user.Username,
            UserId = user.UserId,
            UserGuid = user.Guid,
            Entity = user.Entity,
            Token = _tokenService.CreateToken(user)
        };
    }





    // https://localhost:5001/api/account/ChangePassword
    /*
        {
           "Username": "noufil",
            "OldPassword": "P@$$w0rd12",
            "NewPassword": "P@$$w0rd"
        }
    */
    [HttpPost("ChangePassword")]
    public async Task<ActionResult<UserDto>> ChangePassword(ChangePasswordDto logindto)
    {
        var user = await _context.UserInfos.FirstOrDefaultAsync(
            x => x.Username == logindto.Username
        );

        if (user == null) return Unauthorized("Invalid Username");

        var oldcomputehash = computeHash(user.PasswordSalt, logindto.OldPassword);
        var computedhash = oldcomputehash[0];

        for (int i = 0; i < computedhash.Length; i++)
        {
            if (computedhash[i] != user.PasswordHalt[i]) return Unauthorized("Invalid Password");
        }

        var newcomputehash = computeHash(null, logindto.NewPassword);
        user.PasswordHalt = newcomputehash[0];
        user.PasswordSalt = newcomputehash[1];
        await _context.SaveChangesAsync();

        return new UserDto
        {
            Username = user.Username,
            UserId = user.UserId,
            UserGuid = user.Guid,
            Entity = user.Entity,
            Token = string.Empty
        };

    }



    private async Task<bool> UserExists(string username)
    {
        return await _context.UserInfos
                .AnyAsync(x => x.Username.ToLower() == username.ToLower());
    }

    private List<byte[]> computeHash(byte[] passwordSalt, string password)
    {
        List<byte[]> returnByte = new();

        using var hmac = passwordSalt == null
                ? new HMACSHA512() : new HMACSHA512(passwordSalt);

        returnByte.Insert(0, hmac.ComputeHash(Encoding.UTF8.GetBytes(password)));
        returnByte.Insert(1, hmac.Key);
        return returnByte;
    }
}
