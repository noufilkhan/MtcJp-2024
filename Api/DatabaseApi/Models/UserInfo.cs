using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class UserInfo
{
    public int UserId { get; set; }

    public int Entity { get; set; }

    public string Username { get; set; } = null!;

    public string PasswordHalt { get; set; } = null!;

    public string? PasswordSalt { get; set; }

    public string FirstName { get; set; } = null!;

    public string? MiddleName { get; set; }

    public string LastName { get; set; } = null!;

    public string EmailAddress { get; set; } = null!;

    public string ContactInfo { get; set; } = null!;

    public string City { get; set; } = null!;

    public string Country { get; set; } = null!;

    public string Language { get; set; } = null!;

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string? LastModifiedBy { get; set; }

    public string Guid { get; set; } = null!;

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();

    public virtual Entity EntityNavigation { get; set; } = null!;

    public virtual ICollection<Sale> Sales { get; set; } = new List<Sale>();

    public virtual ICollection<UserSecurityGroup> UserSecurityGroups { get; set; } = new List<UserSecurityGroup>();
}
