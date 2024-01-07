using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class Sale
{
    public int SalesId { get; set; }

    public int StockId { get; set; }

    public int ConsigneeId { get; set; }

    public int UserId { get; set; }

    public decimal PurchasingPrice { get; set; }

    public string PurchasingPriceCurrency { get; set; } = null!;

    public decimal SellingPrice { get; set; }

    public string SellingPriceCurrency { get; set; } = null!;

    public decimal ExchangeRate { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string? LastModifiedBy { get; set; }

    public string Guid { get; set; } = null!;

    public virtual Consignee Consignee { get; set; } = null!;

    public virtual Stock Stock { get; set; } = null!;

    public virtual UserInfo User { get; set; } = null!;
}
