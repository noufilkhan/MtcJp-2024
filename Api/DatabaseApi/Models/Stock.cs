using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class Stock
{
    public int StockId { get; set; }

    public int Entity { get; set; }

    public string Make { get; set; }

    public string Model { get; set; }

    public string CreatedBy { get; set; }

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string LastModifiedBy { get; set; }

    public string Guid { get; set; }

    public virtual Entity EntityNavigation { get; set; }

    public virtual ICollection<Sale> Sales { get; set; } = new List<Sale>();

    public virtual ICollection<StockAddtionalCost> StockAddtionalCosts { get; set; } = new List<StockAddtionalCost>();

    public virtual ICollection<StockDocument> StockDocuments { get; set; } = new List<StockDocument>();

    public virtual ICollection<StockImage> StockImages { get; set; } = new List<StockImage>();
}
