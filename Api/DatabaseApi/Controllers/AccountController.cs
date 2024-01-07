// using System.Security.Cryptography;
// using System.Text;
// using DatabaseApi.Data;
// using DatabaseApi.Dtos;
// using DatabaseApi.Entities;
// using DatabaseApi.Interfaces;
// using DatabaseApi.Models;
// using Microsoft.AspNetCore.Mvc;
// using Microsoft.EntityFrameworkCore;

// namespace DatabaseApi.Controllers;

// public class AccountController : BaseApiController
// {
//     private VehiclesContext _context;

//     private ITokenService _tokenService;

//     public AccountController(
//         VehiclesContext context, 
//         ITokenService tokenservice
//         )
//     {
//         _context = context;
//         _tokenService = tokenservice;
//     }

//     //http://localhost:5000/api/account/register
//     [HttpPost("register")] //Post : api/account/register
//     public async Task<ActionResult<UserDto>> Register(RegisterDto registerdto){

//         if (await UserExists(registerdto.Username)) 
//             return BadRequest("Username is taken");

//         using var hmac = new HMACSHA512();
//         var user = new UserInfo {
//             Username = registerdto.Username.ToLower(),
//             PasswordHalt = hmac.ComputeHash(Encoding.UTF8.GetBytes(registerdto.Password)),
//             PasswordSalt = hmac.Key
//         };

//         _context.UserInfos.Add(user);
//         await _context.SaveChangesAsync();
//         return new UserDto{
//             Username = user.Username,
//             Token = _tokenService.CreateToken(user)
//         };
//     }

//     // http://localhost:5000/api/account/login
//     [HttpPost("login")]
//     public async Task<ActionResult<UserDto>> Login(LoginDto logindto){
        
//         var user = await _context.UserInfos.SingleOrDefaultAsync(
//             x=> x.Username == logindto.Username
//         );

//         if (user == null) return Unauthorized("Invalid Username");

//         using var hmac = new HMACSHA512(user.PasswordSalt);
//         var computedhash = hmac.ComputeHash(Encoding.UTF8.GetBytes(logindto.Password));

//         for (int i=0; i< computedhash.Length;i++)
//         {
//             if (computedhash[i] != user.PasswordHalt[i]) return Unauthorized("Invalid Password");
//         }

//         return new UserDto{
//             Username = user.Username,
//             Token = _tokenService.CreateToken(user)
//         };  
        
//     }

//     private async Task<bool> UserExists(string username){
//         return await _context.UserInfos
//                 .AnyAsync(x=> x.Username.ToLower() == username.ToLower());
//     }
// }
