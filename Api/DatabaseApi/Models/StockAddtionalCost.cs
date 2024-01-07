using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class StockAddtionalCost
{
    public int StockCostId { get; set; }

    public int StockId { get; set; }

    public string CostType { get; set; } = null!;

    public string AmountCurency { get; set; } = null!;

    public decimal Amount { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string? LastModifiedBy { get; set; }

    public string Guid { get; set; } = null!;

    public virtual Stock Stock { get; set; } = null!;
}
