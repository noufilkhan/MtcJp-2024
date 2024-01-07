using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class PromptValue
{
    public int PromptId { get; set; }

    public string PromptName { get; set; } = null!;

    public string PromptSubCategory { get; set; } = null!;

    public string PromptDescription { get; set; } = null!;

    public string PromptValue1 { get; set; } = null!;

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string? LastModifiedBy { get; set; }

    public string Guid { get; set; } = null!;
}
