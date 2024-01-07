using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class Customer
{
    public int CustomerId { get; set; }

    public int Entity { get; set; }

    public int UserId { get; set; }

    public string CompanyName { get; set; } = null!;

    public string CompanyOwner { get; set; } = null!;

    public string CustomerName { get; set; } = null!;

    public string Country { get; set; } = null!;

    public string? Source { get; set; }

    public string Category { get; set; } = null!;

    public string? Address { get; set; }

    public string? Phone { get; set; }

    public string? BuyingLimitCurrency { get; set; }

    public decimal? BuyingLimit { get; set; }

    public string? TaxId { get; set; }

    public string? CompanyRegistrationUrl { get; set; }

    public string? ImportLicenseUrl { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string? LastModifiedBy { get; set; }

    public string Guid { get; set; } = null!;

    public virtual Entity EntityNavigation { get; set; } = null!;

    public virtual UserInfo User { get; set; } = null!;
}
