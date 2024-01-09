namespace DatabaseApi;

public class CustomerDto
{
    public int Entity { get; set; }
    
    public int UserId { get; set; }

    public string CompanyName { get; set; }

    public string CompanyOwner { get; set; }

    public string CustomerName { get; set; }

    public string Country { get; set; }

    public string Source { get; set; }

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
