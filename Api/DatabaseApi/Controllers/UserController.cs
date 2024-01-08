using DatabaseApi.Dtos;
using DatabaseApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DatabaseApi.Controllers;

public class UserController : BaseApiController
{
    private VehiclesContext _context;   

    public UserController(VehiclesContext context)
    {
        _context = context;
    }

    //https://localhost:5001/api/User
    [HttpGet]
    public async Task<ActionResult<IEnumerable<UserInfo>>> GetUsers(){
        return await _context.UserInfos
            .Include(p=> p.UserSecurityGroups)
            .ToListAsync();
    }

    //https://localhost:5001/api/User/1
    [HttpGet("{username}")]
    public async Task<ActionResult<UserInfo>> GetById(string username){
        return await _context.UserInfos
            .Include(p=> p.UserSecurityGroups)            
            .FirstOrDefaultAsync(x=> x.Username == username);
    }
}
