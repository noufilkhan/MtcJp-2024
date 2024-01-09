using DatabaseApi.Controllers;
using DatabaseApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DatabaseApi;

public class CustomerController : BaseApiController
{
    private VehiclesContext _context;

    public CustomerController(VehiclesContext context) { _context = context; }


    // https://localhost:5001/api/Customer/GetAll/1
    [HttpGet("{entity}")]
    public async Task<ActionResult<IEnumerable<ViewCustomer>>> GetAll(int entity){
        return await _context.ViewCustomers
                .Where(x=> x.Entity == entity)
                .ToListAsync();
    }

    // https://localhost:5001/api/Customer/GetByGuid/1/B2962CEA-FFDD-4707-B6C9-AC166AE99281
    [HttpGet("GetByGuid/{entity}/{guid}")]
    public async Task<ActionResult<ViewCustomer>> GetByGuid(int entity, string guid){
        return await _context.ViewCustomers
                .FirstOrDefaultAsync(x=> x.Guid == guid && x.Entity == entity);
    }

    // https://localhost:5001/api/Customer
    [HttpPost]
    public async Task<ActionResult<ViewCustomer>> Add(){
        return await _context.ViewCustomers
                .FirstOrDefaultAsync();
    }


    // https://localhost:5001/api/Customer
    [HttpPut]
    public async Task<ActionResult<ViewCustomer>> Update(){
        return await _context.ViewCustomers
                .FirstOrDefaultAsync();
    }

}
