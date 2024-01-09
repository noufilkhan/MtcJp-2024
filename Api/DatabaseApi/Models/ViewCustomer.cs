using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class ViewCustomer
{
    public string EntityName { get; set; }

    public bool IsHeadOffice { get; set; }

    public string Username { get; set; }

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

    public string CreatedBy { get; set; }

    public DateTime CreatedDate { get; set; }

    public string LastModifiedBy { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string Guid { get; set; }

    public int CustomerId { get; set; }

    public int Entity { get; set; }
}
