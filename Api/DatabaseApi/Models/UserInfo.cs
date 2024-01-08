using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class UserInfo
{
    public int UserId { get; set; }

    public int Entity { get; set; }

    public string Username { get; set; }

    public byte[] PasswordHalt { get; set; }

    public byte[] PasswordSalt { get; set; }

    public string FirstName { get; set; }

    public string MiddleName { get; set; }

    public string LastName { get; set; }

    public string EmailAddress { get; set; }

    public string ContactInfo { get; set; }

    public string City { get; set; }

    public string Country { get; set; }

    public string Language { get; set; }

    public string CreatedBy { get; set; }

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string LastModifiedBy { get; set; }

    public string Guid { get; set; }

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();

    public virtual Entity EntityNavigation { get; set; }

    public virtual ICollection<Sale> Sales { get; set; } = new List<Sale>();

    public virtual ICollection<UserSecurityGroup> UserSecurityGroups { get; set; } = new List<UserSecurityGroup>();
}
