using System;
using System.Collections.Generic;

namespace DatabaseApi.Models;

public partial class Stock
{
    public int StockId { get; set; }

    public int Entity { get; set; }

    public string SerialNo { get; set; }

    public string Status { get; set; }

    public string ModelCode { get; set; }

    public string Make { get; set; }

    public string Model { get; set; }

    public string ChasisModel { get; set; }

    public string Cc { get; set; }

    public DateTime? Year { get; set; }

    public string Color { get; set; }

    public DateTime? PurchaseDate { get; set; }

    public DateTime? ManufactureDate { get; set; }

    public string AuctionShipNo { get; set; }

    public string Traction { get; set; }

    public string VehicleGrade { get; set; }

    public string FuelType { get; set; }

    public string Transmission { get; set; }

    public string Mileage { get; set; }

    public string InteriorColor { get; set; }

    public decimal? Weight { get; set; }

    public decimal? GrossWeight { get; set; }

    public decimal? NetWeight { get; set; }

    public decimal? Area { get; set; }

    public string EngineType { get; set; }

    public string EngineNumber { get; set; }

    public int? Doors { get; set; }

    public decimal? Length { get; set; }

    public decimal? Width { get; set; }

    public decimal? Height { get; set; }

    public int? Passenger { get; set; }

    public string IchiMasho { get; set; }

    public string N1 { get; set; }

    public string N2 { get; set; }

    public string N3 { get; set; }

    public string N4 { get; set; }

    public string Repaired { get; set; }

    public string OtherInformation { get; set; }

    public string Body { get; set; }

    public string Comments { get; set; }

    public string ApjComments { get; set; }

    public string CreatedBy { get; set; }

    public DateTime CreatedDate { get; set; }

    public DateTime LastModifiedDate { get; set; }

    public string LastModifiedBy { get; set; }

    public string Guid { get; set; }

    public virtual Entity EntityNavigation { get; set; }

    public virtual ICollection<Sale> Sales { get; set; } = new List<Sale>();

    public virtual ICollection<StockAddtionalCost> StockAddtionalCosts { get; set; } = new List<StockAddtionalCost>();

    public virtual ICollection<StockCost> StockCosts { get; set; } = new List<StockCost>();

    public virtual ICollection<StockDocument> StockDocuments { get; set; } = new List<StockDocument>();

    public virtual ICollection<StockImage> StockImages { get; set; } = new List<StockImage>();
}
