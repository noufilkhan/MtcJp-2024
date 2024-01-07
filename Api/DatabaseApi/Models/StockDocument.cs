﻿using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class StockDocument
{
    public int StockDocumentId { get; set; }

    public int StockId { get; set; }

    public string DocumentType { get; set; } = null!;

    public string DocumentUrl { get; set; } = null!;

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string? LastModifiedBy { get; set; }

    public string Guid { get; set; } = null!;

    public virtual Stock Stock { get; set; } = null!;
}