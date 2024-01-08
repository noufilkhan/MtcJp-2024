using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class PromptValue
{
    public int PromptId { get; set; }

    public string PromptName { get; set; }

    public string PromptSubCategory { get; set; }

    public string PromptDescription { get; set; }

    public string PromptValue1 { get; set; }

    public string CreatedBy { get; set; }

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string LastModifiedBy { get; set; }

    public string Guid { get; set; }
}
