using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class UserSecurityGroup
{
    public int UserSecurityId { get; set; }

    public int UserId { get; set; }

    public int SecurityId { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string? LastModifiedBy { get; set; }

    public string Guid { get; set; } = null!;

    public virtual SecurityGroup Security { get; set; } = null!;

    public virtual UserInfo User { get; set; } = null!;
}
