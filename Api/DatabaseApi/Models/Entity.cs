using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class Entity
{
    public int Entity1 { get; set; }

    public string EntityName { get; set; }

    public bool IsHeadOffice { get; set; }

    public string CreatedBy { get; set; }

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string LastModifiedBy { get; set; }

    public string Guid { get; set; }

    public virtual ICollection<Consignee> Consignees { get; set; } = new List<Consignee>();

    public virtual ICollection<Customer> Customers { get; set; } = new List<Customer>();

    public virtual ICollection<Stock> Stocks { get; set; } = new List<Stock>();

    public virtual ICollection<UserInfo> UserInfos { get; set; } = new List<UserInfo>();
}
