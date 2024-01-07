using DatabaseApi.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseApi;

public class test2
{
    VehiclesContext _context;

    public void hello()
    {
        _context.Customers.ToListAsync();
    }

}
