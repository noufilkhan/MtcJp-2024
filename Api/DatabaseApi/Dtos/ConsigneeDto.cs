using System.ComponentModel.DataAnnotations;
using DatabaseApi.Models;

namespace DatabaseApi;

public class ConsigneeDto
{
    public int ConsigneeId { get; set; }

    public int CustomerId { get; set; }

    public string CompanyName { get; set; }

    public string CompanyOwner { get; set; }

    public string ConsigneeName { get; set; }

    [Required(ErrorMessage = "Country is Required")]
    public string Country { get; set; }

    public string Source { get; set; }

    [Required(ErrorMessage = "Category is Required")]
    public string Category { get; set; }

    public string Address { get; set; }

    public string Phone { get; set; }

    public string BuyingLimitCurrency { get; set; }

    public decimal? BuyingLimit { get; set; }

    public string TaxId { get; set; }

    public string ImportLicenseUrl { get; set; }

    public string Guid { get; set; }

    public string UserName { get; set; }

    public Consignee_CustomerDto CustomerDetails { get; set; }

}
