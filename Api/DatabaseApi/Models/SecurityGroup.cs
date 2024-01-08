using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class SecurityGroup
{
    public int SecurityId { get; set; }

    public string Description { get; set; }

    public string CreatedBy { get; set; }

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string LastModifiedBy { get; set; }

    public string Guid { get; set; }

    public virtual ICollection<UserSecurityGroup> UserSecurityGroups { get; set; } = new List<UserSecurityGroup>();
}
