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
    public async Task<ActionResult<IEnumerable<CustomerDto>>> GetAll(int entity)
    {
        List<ViewCustomer> listcustomer = await _context.ViewCustomers
                .Where(x => x.Entity == entity)
                .ToListAsync();

        List<CustomerDto> customerDtos = new List<CustomerDto>();
        foreach (ViewCustomer cust in listcustomer)
        {
            customerDtos.Add(new CustomerDto()
            {
                Entity = cust.Entity,
                UserId = cust.UserId,
                CompanyName = cust.CustomerName,
                CompanyOwner = cust.CompanyOwner,
                CustomerName = cust.CustomerName,
                Country = cust.Country,
                Source = cust.Source,
                Category = cust.Category,
                Address = cust.Address,
                Phone = cust.Phone,
                BuyingLimitCurrency = cust.BuyingLimitCurrency,
                BuyingLimit = cust.BuyingLimit,
                TaxId = cust.TaxId,
                ImportLicenseUrl = cust.ImportLicenseUrl,
                Guid = cust.Guid,
                CustomerId = cust.CustomerId
            });
        }

        return customerDtos;

    }

    // https://localhost:5001/api/Customer/GetByGuid/1/B2962CEA-FFDD-4707-B6C9-AC166AE99281
    [HttpGet("GetByGuid/{entity}/{guid}")]
    public async Task<ActionResult<ViewCustomer>> GetByGuid(int entity, string guid)
    {
        return await _context.ViewCustomers
                .FirstOrDefaultAsync(x => x.Guid == guid && x.Entity == entity);
    }

    // https://localhost:5001/api/Customer
    [HttpPost("{entity}")]
    public async void Add(CustomerDto customerDto)
    {
        Customer customer = new()
        {
            Entity = customerDto.Entity,
            UserId = customerDto.UserId,
            CompanyName = customerDto.CustomerName,
            CompanyOwner = customerDto.CompanyOwner,
            CustomerName = customerDto.CustomerName,
            Country = customerDto.Country,
            Source = customerDto.Source,
            Category = customerDto.Category,
            Address = customerDto.Address,
            Phone = customerDto.Phone,
            BuyingLimitCurrency = customerDto.BuyingLimitCurrency,
            BuyingLimit = customerDto.BuyingLimit,
            TaxId = customerDto.TaxId,
            ImportLicenseUrl = customerDto.ImportLicenseUrl,
            Guid = Guid.NewGuid().ToString()
        };

        _context.Customers.Add(customer);
        await _context.SaveChangesAsync();
    }


    // https://localhost:5001/api/Customer
    [HttpPut("{entity}")]
    public async void Update(CustomerDto customerDto)
    {
        // Customer customer = new()
        // {
        //     CustomerId = customerDto.CustomerId,
        //     Entity = customerDto.Entity,
        //     UserId = customerDto.UserId,
        //     CompanyName = customerDto.CustomerName,
        //     CompanyOwner = customerDto.CompanyOwner,
        //     CustomerName = customerDto.CustomerName,
        //     Country = customerDto.Country,
        //     Source = customerDto.Source,
        //     Category = customerDto.Category,
        //     Address = customerDto.Address,
        //     Phone = customerDto.Phone,
        //     BuyingLimitCurrency = customerDto.BuyingLimitCurrency,
        //     BuyingLimit = customerDto.BuyingLimit,
        //     TaxId = customerDto.TaxId,
        //     ImportLicenseUrl = customerDto.ImportLicenseUrl,
        //     Guid = Guid.NewGuid().ToString()
        // };

        // _context.Customers.Add(customer);
        // await _context.SaveChangesAsync();
    }

}
