using DatabaseApi.Controllers;
using DatabaseApi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DatabaseApi;

[Authorize]
public class ConsigneeController : BaseApiController
{
    private VehiclesContext _context;

    public ConsigneeController(VehiclesContext context) { _context = context; }

    // https://localhost:5001/api/Consignee/ByEntity/1
    [HttpGet("ByEntity/{entity}")]
    public async Task<ActionResult<IEnumerable<ConsigneeDto>>> GetAllByEntity(int entity)
    {
        if (entity < 1) return BadRequest();

        var _list = await _context.Consignees
            .Include(p => p.Customer)
            .Where(p=> p.Customer.Entity == entity)
            .Select(
                p => new ConsigneeDto
                {
                    ConsigneeId = p.ConsigneeId,
                    CustomerId = p.CustomerId,
                    ConsigneeName = p.ConsigneeName,
                    CompanyName = p.CompanyName,
                    CompanyOwner = p.CompanyOwner,
                    Country = p.Country,
                    Source = p.Source,
                    Category = p.Category,
                    Address = p.Address,
                    Phone = p.Phone,
                    BuyingLimitCurrency = p.BuyingLimitCurrency,
                    BuyingLimit = p.BuyingLimit,
                    TaxId = p.TaxId,
                    ImportLicenseUrl = p.ImportLicenseUrl,
                    Guid = p.Guid,

                    CustomerDetails = new Consignee_CustomerDto
                    {
                        CustomerName = p.Customer.CustomerName,
                        CompanyName = p.Customer.CompanyName,
                        CompanyOwner = p.Customer.CompanyOwner,
                        Guid = p.Customer.Guid
                    }
                }
            )
            .ToListAsync();

        return _list;
    }

// https://localhost:5001/api/Consignee/ByCustomerGuid/B2962CEA-FFDD-4707-B6C9-AC166AE99281
    [HttpGet("ByCustomerGuid/{customerguid}")]
    public async Task<ActionResult<IEnumerable<ConsigneeDto>>> GetAllByCustomerGuid(string customerguid)
    {
        if (string.IsNullOrEmpty(customerguid)) return BadRequest();

        var _list = await _context.Consignees
            .Include(p => p.Customer)
            .Where(p=> p.Customer.Guid == customerguid)
            .Select(
                p => new ConsigneeDto
                {
                    ConsigneeId = p.ConsigneeId,
                    CustomerId = p.CustomerId,
                    ConsigneeName = p.ConsigneeName,
                    CompanyName = p.CompanyName,
                    CompanyOwner = p.CompanyOwner,
                    Country = p.Country,
                    Source = p.Source,
                    Category = p.Category,
                    Address = p.Address,
                    Phone = p.Phone,
                    BuyingLimitCurrency = p.BuyingLimitCurrency,
                    BuyingLimit = p.BuyingLimit,
                    TaxId = p.TaxId,
                    ImportLicenseUrl = p.ImportLicenseUrl,
                    Guid = p.Guid,

                    CustomerDetails = new Consignee_CustomerDto
                    {
                        CustomerName = p.Customer.CustomerName,
                        CompanyName = p.Customer.CompanyName,
                        CompanyOwner = p.Customer.CompanyOwner,
                        Guid = p.Customer.Guid
                    }
                }
            )
            .ToListAsync();

        return _list;
    }


    // https://localhost:5001/api/Customer/1/B2962CEA-FFDD-4707-B6C9-AC166AE99281
    [HttpGet("{entity}/{guid}")]
    public async Task<ActionResult<ConsigneeDto>> GetByGuid(int entity, string guid)
    {
        if (entity < 1) return BadRequest();
        if (string.IsNullOrEmpty(guid)) return BadRequest();

        var _list = await _context.Consignees
            .Include(p => p.Customer)
            .Where( p=> p.Guid == guid)
            .Select(
                p => new ConsigneeDto
                {
                    ConsigneeId = p.ConsigneeId,
                    CustomerId = p.CustomerId,
                    ConsigneeName = p.ConsigneeName,
                    CompanyName = p.CompanyName,
                    CompanyOwner = p.CompanyOwner,
                    Country = p.Country,
                    Source = p.Source,
                    Category = p.Category,
                    Address = p.Address,
                    Phone = p.Phone,
                    BuyingLimitCurrency = p.BuyingLimitCurrency,
                    BuyingLimit = p.BuyingLimit,
                    TaxId = p.TaxId,
                    ImportLicenseUrl = p.ImportLicenseUrl,
                    Guid = p.Guid,
                    
                    CustomerDetails = new Consignee_CustomerDto
                    {                        
                        CustomerName = p.Customer.CustomerName,
                        CompanyName = p.Customer.CompanyName,
                        CompanyOwner = p.Customer.CompanyOwner,
                        Guid = p.Customer.Guid
                    }
                }
            )
            .FirstAsync();

        return _list;
    }


    // https://localhost:5001/api/Consignee/1
    /*
        {            
            "customerId": 3,
            "companyName": "Second Cosignee Company",
            "companyOwner": "Second Cosignee Owner",
            "consigneeName": "Second Cosignee Name",
            "country": "Second Cosignee  Country",
            "source": "Second Cosignee  Source",
            "category": "Second Cosignee Category",
            "address": "Second Cosignee Address",
            "phone": "Second Cosignee Phone",
            "buyingLimitCurrency": "Yen",
            "buyingLimit": 1000.000,
            "taxId": null,
            "importLicenseUrl": null,
            "guid": null
        }
    */
    [HttpPost("{entity}")]
    public async Task<IActionResult> Add(ConsigneeDto consigneeDto)
    {
        Consignee consignee = new()
        {
            CustomerId = consigneeDto.CustomerId,
            CompanyName = consigneeDto.CompanyName,
            CompanyOwner = consigneeDto.CompanyOwner,
            ConsigneeName = consigneeDto.ConsigneeName,
            Country = consigneeDto.Country,
            Source = consigneeDto.Source,
            Category = consigneeDto.Category,
            Address = consigneeDto.Address,
            Phone = consigneeDto.Phone,
            BuyingLimitCurrency = consigneeDto.BuyingLimitCurrency,
            BuyingLimit = consigneeDto.BuyingLimit,
            TaxId = consigneeDto.TaxId,
            ImportLicenseUrl = consigneeDto.ImportLicenseUrl,
            Guid = Guid.NewGuid().ToString()
        };

        _context.Consignees.Add(consignee);
        await _context.SaveChangesAsync();
        return Ok();
    }


    // https://localhost:5001/api/Customer/1/6c11315d-af5a-4fac-8348-65e45826be3d
    /*
        {
    "consigneeId": 3,
    "customerId": 0,
    "companyName": "Second Cosignee Company",
    "companyOwner": "Second Cosignee Owner",
    "consigneeName": "Second Cosignee Name",
    "country": "Second Cosignee  Country",
    "source": "Second Cosignee  Source",
    "category": "Second Cosignee Category",
    "address": "Second Cosignee Address",
    "phone": "Second Cosignee Phone",
    "buyingLimitCurrency": "Yen",
    "buyingLimit": 1000.000,
    "taxId": null,
    "importLicenseUrl": null,
    "guid": "bebe02db-e5d5-4b08-9cdb-12835dd57772",
    "userName": null,
    "customerDetails": {
        "customerId": 3,
        "companyName": "Second Company",
        "companyOwner": "Donald Duck",
        "customerName": "Tom And Jerry",
        "guid": "B2962CEA-FFDD-4707-B6C9-AC166AE99281"
    }
}
    */
    [HttpPut("{entity}/{guid}")]
    public async Task<IActionResult> Update(int entity, string guid, ConsigneeDto consigneeDto)
    {
        Consignee consignee = await _context.Consignees
                .FirstAsync(x => x.Guid == guid);

        if (consignee == null)
            return BadRequest("Consignee details not found");

        consignee.ConsigneeId = consigneeDto.ConsigneeId;
        consignee.CustomerId = consigneeDto.CustomerId;
        consignee.CompanyName = consigneeDto.CompanyName;
        consignee.CompanyOwner = consigneeDto.CompanyOwner;
        consignee.ConsigneeName = consigneeDto.ConsigneeName;
        consignee.Country = consigneeDto.Country;
        consignee.Source = consigneeDto.Source;
        consignee.Category = consigneeDto.Category;
        consignee.Address = consigneeDto.Address;
        consignee.Phone = consigneeDto.Phone;
        consignee.BuyingLimitCurrency = consigneeDto.BuyingLimitCurrency;
        consignee.BuyingLimit = consigneeDto.BuyingLimit;
        consignee.TaxId = consigneeDto.TaxId;
        consignee.ImportLicenseUrl = consigneeDto.ImportLicenseUrl;
        consignee.Guid = guid;
        consignee.LastModifiedDate = DateTime.UtcNow;
        consignee.LastModifiedBy = consigneeDto.UserName;

        await _context.SaveChangesAsync();
        return Ok();
    }

}
