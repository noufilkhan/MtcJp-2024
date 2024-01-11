using DatabaseApi.Controllers;
using DatabaseApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.EntityFrameworkCore;

namespace DatabaseApi;

public class ConsigneeController:BaseApiController
{
    private VehiclesContext _context;

    public ConsigneeController(VehiclesContext context) { _context = context; }


    // https://localhost:5001/api/Consignee/1
    [HttpGet("{entity}")]    
    public async Task<ActionResult<IEnumerable<CustomerDto>>> GetAll(int entity)
    {
        if (entity < 1) return BadRequest();

        // var allConsignee = await (
        //     from cg in _context.Consignees
        //     join ct in _context.Customers on cg.CustomerId equals ct.CustomerId
        //     where ct.Entity == entity
        //     select cg.
        //     );

        var listcustomer = await _context.Consignees.ToListAsync();

        List<CustomerDto> customerDtos = new List<CustomerDto>();

        // foreach (ViewCustomer cust in listcustomer)
        // {
        //     customerDtos.Add(new CustomerDto()
        //     {
        //         Entity = cust.Entity,
        //         UserId = cust.UserId,                
        //         CompanyName = cust.CustomerName,
        //         CompanyOwner = cust.CompanyOwner,
        //         CustomerName = cust.CustomerName,
        //         Country = cust.Country,
        //         Source = cust.Source,
        //         Category = cust.Category,
        //         Address = cust.Address,
        //         Phone = cust.Phone,
        //         BuyingLimitCurrency = cust.BuyingLimitCurrency,
        //         BuyingLimit = cust.BuyingLimit,
        //         TaxId = cust.TaxId,
        //         ImportLicenseUrl = cust.ImportLicenseUrl,
        //         Guid = cust.Guid,
        //         CustomerId = cust.CustomerId
        //     });
        // }

        return customerDtos;

    }

    // https://localhost:5001/api/Customer/1/B2962CEA-FFDD-4707-B6C9-AC166AE99281
    [HttpGet("{entity}/{guid}")]
    public async Task<ActionResult<ViewCustomer>> GetByGuid(int entity, string guid)
    {
        return await _context.ViewCustomers.FirstOrDefaultAsync(
            x => x.Guid == guid && x.Entity == entity);
    }


    // https://localhost:5001/api/Customer/1
    /*
        {
            "entity": 1,
            "userId": 1,
            "companyName": "Fourth Company",
            "companyOwner": "James Bond",
            "customerName": "The Rock",
            "country": "United States",
            "source": null,
            "category": "First Category",
            "address": "ABC Street",
            "phone": "+12547856",
            "buyingLimitCurrency": "$",
            "buyingLimit": 3000.000,
            "taxId": "12548",
            "importLicenseUrl": "www.google.com"
        }
    */
    [HttpPost("{entity}")]
    public async Task<IActionResult> Add(CustomerDto customerDto)
    {
        Customer customer = new()
        {
            Entity = customerDto.Entity,
            UserId = customerDto.UserId,
            CompanyName = customerDto.CompanyName,
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
        return Ok();
    }


    // https://localhost:5001/api/Customer/1/6c11315d-af5a-4fac-8348-65e45826be3d
    /*
        {
            "customerId": 5,
            "entity": 1,
            "userid": 1,
            "username": "noufil",
            "companyName": "Fourth Company 2",
            "companyOwner": "James Bond",
            "customerName": "The Rock",
            "country": "United States",
            "source": null,
            "category": "First Category",
            "address": "ABC Street",
            "phone": "+12547856",
            "buyingLimitCurrency": "$",
            "buyingLimit": 3000.000,
            "taxId": "12548",
            "importLicenseUrl": "www.google.com"
        }
    */
    [HttpPut("{entity}/{guid}")]
    public async Task<IActionResult> Update(int entity, string guid, CustomerDto customerDto)
    {
        Customer customer = await _context.Customers.FirstAsync(x => x.Guid == guid);

        if (customer == null)
            return BadRequest("Customer details not found");

        customer.CustomerId = customerDto.CustomerId;
        customer.Entity = customerDto.Entity;
        customer.UserId = customerDto.UserId;
        customer.CompanyName = customerDto.CompanyName;
        customer.CompanyOwner = customerDto.CompanyOwner;
        customer.CustomerName = customerDto.CustomerName;
        customer.Country = customerDto.Country;
        customer.Source = customerDto.Source;
        customer.Category = customerDto.Category;
        customer.Address = customerDto.Address;
        customer.Phone = customerDto.Phone;
        customer.BuyingLimitCurrency = customerDto.BuyingLimitCurrency;
        customer.BuyingLimit = customerDto.BuyingLimit;
        customer.TaxId = customerDto.TaxId;
        customer.ImportLicenseUrl = customerDto.ImportLicenseUrl;
        customer.Guid = guid;
        customer.LastModifiedDate = DateTime.UtcNow;
        customer.LastModifiedBy = customerDto.UserName;
        await _context.SaveChangesAsync();
        return Ok();
    }

}
