using System.ComponentModel.DataAnnotations;

namespace DatabaseApi;

public class CustomerDto
{
    [Required(ErrorMessage = "Company Entity is Required")]
    public int Entity { get; set; }

    [Required(ErrorMessage = "User is Required")]
    public int UserId { get; set; }

    [Required(ErrorMessage = "User is Required")]
    public string UserName { get; set; }

    [Required(ErrorMessage = "Company Name is Required")]
    public string CompanyName { get; set; }

    [Required(ErrorMessage = "Company Owner is Required")]
    public string CompanyOwner { get; set; }

    [Required(ErrorMessage = "Customer Name is Required")]
    public string CustomerName { get; set; }

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

    public int CustomerId { get; set; }

}
