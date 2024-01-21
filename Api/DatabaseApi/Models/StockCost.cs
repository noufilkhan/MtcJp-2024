using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class StockCost
{
    public int StockCostId { get; set; }

    public int StockId { get; set; }

    public decimal BuyingCost { get; set; }

    public decimal? AuctionFee { get; set; }

    public decimal? Penalty { get; set; }

    public decimal? Jizel { get; set; }

    public decimal? Commission { get; set; }

    public decimal? Thc { get; set; }

    public decimal? StorageFee { get; set; }

    public decimal? ForwardingPrice { get; set; }

    public decimal? Repairs { get; set; }

    public decimal? AuctionFeeSelling { get; set; }

    public decimal? Freight { get; set; }

    public decimal? Rikso { get; set; }

    public decimal? Misc { get; set; }

    public decimal? AuctionVisitFee { get; set; }

    public decimal? TotalCost { get; set; }

    public decimal? SendaFee { get; set; }

    public decimal? InspectionFee { get; set; }

    public decimal? SalePrice { get; set; }

    public decimal? Profit { get; set; }

    public decimal? ProfitPercentage { get; set; }

    public decimal? RecycleFeeRefunded { get; set; }

    public decimal? RecycleFee { get; set; }

    public decimal? AutoquestFee { get; set; }

    public decimal? RecycleCost { get; set; }

    public decimal? InsuranceFee { get; set; }

    public decimal? RadioactiveInspection { get; set; }

    public string AgentStock { get; set; }

    public decimal? PhotoFee { get; set; }

    public decimal? CuttingFee { get; set; }

    public decimal? CustomPrice { get; set; }

    public decimal? SmokeFee { get; set; }

    public decimal? ExchangeRate { get; set; }

    public decimal? InvoicePriceUsd { get; set; }

    public decimal? SurrenderFee { get; set; }

    public decimal? LinkedPart { get; set; }

    public string CreatedBy { get; set; }

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string LastModifiedBy { get; set; }

    public string Guid { get; set; }

    public virtual Stock Stock { get; set; }
}
