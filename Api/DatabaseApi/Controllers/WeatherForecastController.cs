using DatabaseApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DatabaseApi.Controllers;

[ApiController]
[Route("[controller]")]
public class WeatherForecastController : ControllerBase
{
    private readonly VehiclesContext _context;

    public WeatherForecastController(VehiclesContext context){
         _context = context;
    }
    
    [HttpGet]
    public async Task<IEnumerable<Customer>> Get()    
    {
        return await _context.Customers.ToListAsync();
        
    }
}
