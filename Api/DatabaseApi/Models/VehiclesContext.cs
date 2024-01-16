using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DatabaseApi.Models;

public partial class VehiclesContext : DbContext
{
    public VehiclesContext()
    {
    }

    public VehiclesContext(DbContextOptions<VehiclesContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Consignee> Consignees { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Entity> Entities { get; set; }

    public virtual DbSet<PromptValue> PromptValues { get; set; }

    public virtual DbSet<Sale> Sales { get; set; }

    public virtual DbSet<SecurityGroup> SecurityGroups { get; set; }

    public virtual DbSet<Stock> Stocks { get; set; }

    public virtual DbSet<StockAddtionalCost> StockAddtionalCosts { get; set; }

    public virtual DbSet<StockCost> StockCosts { get; set; }

    public virtual DbSet<StockDocument> StockDocuments { get; set; }

    public virtual DbSet<StockImage> StockImages { get; set; }

    public virtual DbSet<UserInfo> UserInfos { get; set; }

    public virtual DbSet<UserSecurityGroup> UserSecurityGroups { get; set; }

    public virtual DbSet<UserSession> UserSessions { get; set; }

    public virtual DbSet<ViewCustomer> ViewCustomers { get; set; }

//     protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
// #warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
//         => optionsBuilder.UseSqlServer("Data Source=DESKTOP-0UJ8JH8\\SQLEXPRESS;Initial Catalog=Vehicles;Integrated Security=True;Encrypt=False;Trust Server Certificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Consignee>(entity =>
        {
            entity.ToTable("Consignee");

            entity.Property(e => e.ConsigneeId).HasColumnName("Consignee Id");
            entity.Property(e => e.Address).HasMaxLength(250);
            entity.Property(e => e.BuyingLimit)
                .HasColumnType("numeric(18, 3)")
                .HasColumnName("Buying Limit");
            entity.Property(e => e.BuyingLimitCurrency)
                .HasMaxLength(10)
                .HasColumnName("Buying Limit Currency");
            entity.Property(e => e.Category)
                .IsRequired()
                .HasMaxLength(250);
            entity.Property(e => e.CompanyName)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Company Name");
            entity.Property(e => e.CompanyOwner)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Company Owner");
            entity.Property(e => e.CompanyRegistrationUrl)
                .HasMaxLength(500)
                .HasColumnName("Company Registration Url");
            entity.Property(e => e.ConsigneeName)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Consignee Name");
            entity.Property(e => e.Country)
                .IsRequired()
                .HasMaxLength(250);
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.CustomerId).HasColumnName("Customer Id");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.ImportLicenseUrl)
                .HasMaxLength(500)
                .HasColumnName("Import License Url");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.Phone).HasMaxLength(250);
            entity.Property(e => e.Source).HasMaxLength(250);
            entity.Property(e => e.TaxId)
                .HasMaxLength(250)
                .HasColumnName("Tax Id");

            entity.HasOne(d => d.Customer).WithMany(p => p.Consignees)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Consignee_Customers");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.Property(e => e.CustomerId).HasColumnName("Customer Id");
            entity.Property(e => e.Address).HasMaxLength(250);
            entity.Property(e => e.BuyingLimit)
                .HasColumnType("numeric(18, 3)")
                .HasColumnName("Buying Limit");
            entity.Property(e => e.BuyingLimitCurrency)
                .HasMaxLength(10)
                .HasColumnName("Buying Limit Currency");
            entity.Property(e => e.Category)
                .IsRequired()
                .HasMaxLength(250);
            entity.Property(e => e.CompanyName)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Company Name");
            entity.Property(e => e.CompanyOwner)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Company Owner");
            entity.Property(e => e.CompanyRegistrationUrl)
                .HasMaxLength(500)
                .HasColumnName("Company Registration Url");
            entity.Property(e => e.Country)
                .IsRequired()
                .HasMaxLength(250);
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.CustomerName)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Customer Name");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.ImportLicenseUrl)
                .HasMaxLength(500)
                .HasColumnName("Import License Url");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.Phone).HasMaxLength(250);
            entity.Property(e => e.Source).HasMaxLength(250);
            entity.Property(e => e.TaxId)
                .HasMaxLength(250)
                .HasColumnName("Tax Id");
            entity.Property(e => e.UserId).HasColumnName("User Id");

            entity.HasOne(d => d.EntityNavigation).WithMany(p => p.Customers)
                .HasForeignKey(d => d.Entity)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Customers_Entity");

            entity.HasOne(d => d.User).WithMany(p => p.Customers)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Customers_User Info");
        });

        modelBuilder.Entity<Entity>(entity =>
        {
            entity.HasKey(e => e.Entity1);

            entity.ToTable("Entity");

            entity.Property(e => e.Entity1).HasColumnName("Entity");
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.EntityName)
                .IsRequired()
                .HasMaxLength(300)
                .HasColumnName("Entity Name");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.IsHeadOffice).HasColumnName("Is Head Office");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
        });

        modelBuilder.Entity<PromptValue>(entity =>
        {
            entity.HasKey(e => e.PromptId);

            entity.ToTable("Prompt Values");

            entity.Property(e => e.PromptId).HasColumnName("Prompt Id");
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.PromptDescription)
                .IsRequired()
                .HasMaxLength(500)
                .HasColumnName("Prompt Description");
            entity.Property(e => e.PromptName)
                .IsRequired()
                .HasMaxLength(500)
                .HasColumnName("Prompt Name");
            entity.Property(e => e.PromptSubCategory)
                .IsRequired()
                .HasMaxLength(500)
                .HasColumnName("Prompt Sub Category");
            entity.Property(e => e.PromptValue1)
                .IsRequired()
                .HasMaxLength(500)
                .HasColumnName("Prompt Value");
        });

        modelBuilder.Entity<Sale>(entity =>
        {
            entity.HasKey(e => e.SalesId);

            entity.Property(e => e.SalesId)
                .ValueGeneratedNever()
                .HasColumnName("Sales Id");
            entity.Property(e => e.ConsigneeId).HasColumnName("Consignee Id");
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.ExchangeRate)
                .HasColumnType("numeric(18, 10)")
                .HasColumnName("Exchange Rate");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.PurchasingPrice)
                .HasColumnType("numeric(18, 3)")
                .HasColumnName("Purchasing Price");
            entity.Property(e => e.PurchasingPriceCurrency)
                .IsRequired()
                .HasMaxLength(10)
                .HasColumnName("Purchasing Price Currency");
            entity.Property(e => e.SellingPrice)
                .HasColumnType("numeric(18, 3)")
                .HasColumnName("Selling Price");
            entity.Property(e => e.SellingPriceCurrency)
                .IsRequired()
                .HasMaxLength(10)
                .HasColumnName("Selling Price Currency");
            entity.Property(e => e.StockId).HasColumnName("Stock Id");
            entity.Property(e => e.UserId).HasColumnName("User Id");

            entity.HasOne(d => d.Consignee).WithMany(p => p.Sales)
                .HasForeignKey(d => d.ConsigneeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Sales_Consignee");

            entity.HasOne(d => d.Stock).WithMany(p => p.Sales)
                .HasForeignKey(d => d.StockId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Sales_Stock");

            entity.HasOne(d => d.User).WithMany(p => p.Sales)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Sales_User Info");
        });

        modelBuilder.Entity<SecurityGroup>(entity =>
        {
            entity.HasKey(e => e.SecurityId);

            entity.ToTable("Security Group");

            entity.Property(e => e.SecurityId).HasColumnName("Security Id");
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Description)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
        });

        modelBuilder.Entity<Stock>(entity =>
        {
            entity.ToTable("Stock");

            entity.Property(e => e.StockId).HasColumnName("Stock Id");
            entity.Property(e => e.ApjComments)
                .HasMaxLength(300)
                .HasColumnName("APJ Comments");
            entity.Property(e => e.Area).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.AuctionShipNo)
                .HasMaxLength(300)
                .HasColumnName("Auction Ship No");
            entity.Property(e => e.Body).HasMaxLength(300);
            entity.Property(e => e.Cc)
                .HasMaxLength(300)
                .HasColumnName("CC");
            entity.Property(e => e.ChasisModel)
                .HasMaxLength(300)
                .HasColumnName("Chasis Model");
            entity.Property(e => e.Color).HasMaxLength(300);
            entity.Property(e => e.Comments).HasMaxLength(300);
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.EngineNumber)
                .HasMaxLength(300)
                .HasColumnName("Engine Number");
            entity.Property(e => e.EngineType)
                .HasMaxLength(300)
                .HasColumnName("Engine Type");
            entity.Property(e => e.FuelType)
                .HasMaxLength(300)
                .HasColumnName("Fuel Type");
            entity.Property(e => e.GrossWeight)
                .HasColumnType("numeric(18, 0)")
                .HasColumnName("Gross Weight");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.Height).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.IchiMasho)
                .HasMaxLength(300)
                .HasColumnName("Ichi Masho");
            entity.Property(e => e.InteriorColor)
                .HasMaxLength(300)
                .HasColumnName("Interior Color");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.Length).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.Make).HasMaxLength(300);
            entity.Property(e => e.ManufactureDate)
                .HasColumnType("datetime")
                .HasColumnName("Manufacture Date");
            entity.Property(e => e.Mileage).HasMaxLength(300);
            entity.Property(e => e.Model).HasMaxLength(300);
            entity.Property(e => e.ModelCode)
                .HasMaxLength(300)
                .HasColumnName("Model Code");
            entity.Property(e => e.N1).HasMaxLength(300);
            entity.Property(e => e.N2).HasMaxLength(300);
            entity.Property(e => e.N3).HasMaxLength(300);
            entity.Property(e => e.N4).HasMaxLength(300);
            entity.Property(e => e.NetWeight)
                .HasColumnType("numeric(18, 0)")
                .HasColumnName("Net Weight");
            entity.Property(e => e.OtherInformation)
                .HasMaxLength(300)
                .HasColumnName("Other Information");
            entity.Property(e => e.PurchaseDate)
                .HasColumnType("datetime")
                .HasColumnName("Purchase Date");
            entity.Property(e => e.Repaired).HasMaxLength(300);
            entity.Property(e => e.SerialNo)
                .HasMaxLength(300)
                .HasColumnName("Serial No");
            entity.Property(e => e.Status).HasMaxLength(300);
            entity.Property(e => e.Traction).HasMaxLength(300);
            entity.Property(e => e.Transmission).HasMaxLength(300);
            entity.Property(e => e.VehicleGrade)
                .HasMaxLength(300)
                .HasColumnName("Vehicle Grade");
            entity.Property(e => e.Weight).HasColumnType("numeric(18, 0)");
            entity.Property(e => e.Width).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.Year).HasColumnType("date");

            entity.HasOne(d => d.EntityNavigation).WithMany(p => p.Stocks)
                .HasForeignKey(d => d.Entity)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stock_Entity");
        });

        modelBuilder.Entity<StockAddtionalCost>(entity =>
        {
            entity.HasKey(e => e.StockCostId);

            entity.ToTable("Stock Addtional Cost");

            entity.Property(e => e.StockCostId).HasColumnName("Stock Cost Id");
            entity.Property(e => e.Amount).HasColumnType("numeric(18, 3)");
            entity.Property(e => e.AmountCurency)
                .IsRequired()
                .HasMaxLength(10)
                .HasColumnName("Amount Curency");
            entity.Property(e => e.CostType)
                .IsRequired()
                .HasMaxLength(300)
                .HasColumnName("Cost Type");
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.StockId).HasColumnName("Stock Id");

            entity.HasOne(d => d.Stock).WithMany(p => p.StockAddtionalCosts)
                .HasForeignKey(d => d.StockId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stock Addtional Cost_Stock");
        });

        modelBuilder.Entity<StockCost>(entity =>
        {
            entity.ToTable("Stock Cost");

            entity.Property(e => e.StockCostId).HasColumnName("Stock Cost Id");
            entity.Property(e => e.AgentStock)
                .HasMaxLength(50)
                .HasColumnName("Agent Stock");
            entity.Property(e => e.AuctionFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Auction Fee");
            entity.Property(e => e.AuctionFeeSelling)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Auction Fee Selling");
            entity.Property(e => e.AuctionVisitFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Auction Visit Fee");
            entity.Property(e => e.AutoquestFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Autoquest Fee");
            entity.Property(e => e.BuyingCost)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Buying Cost");
            entity.Property(e => e.Commission).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.CustomPrice)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Custom Price");
            entity.Property(e => e.CuttingFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Cutting Fee");
            entity.Property(e => e.ExchangeRate)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Exchange Rate");
            entity.Property(e => e.ForwardingPrice)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Forwarding Price");
            entity.Property(e => e.Freight).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.InspectionFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Inspection Fee");
            entity.Property(e => e.InsuranceFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Insurance Fee");
            entity.Property(e => e.InvoicePriceUsd)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Invoice Price USD");
            entity.Property(e => e.Jizel).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.LinkedPart)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Linked Part");
            entity.Property(e => e.Misc).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.Penalty).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.PhotoFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Photo Fee");
            entity.Property(e => e.Profit).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.ProfitPercentage)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Profit Percentage");
            entity.Property(e => e.RadioactiveInspection)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Radioactive Inspection");
            entity.Property(e => e.RecycleCost)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Recycle Cost");
            entity.Property(e => e.RecycleFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Recycle Fee");
            entity.Property(e => e.RecycleFeeRefunded)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Recycle Fee Refunded");
            entity.Property(e => e.Repairs).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.Rikso).HasColumnType("numeric(18, 5)");
            entity.Property(e => e.SalePrice)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Sale Price");
            entity.Property(e => e.SendaFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Senda Fee");
            entity.Property(e => e.SmokeFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Smoke Fee");
            entity.Property(e => e.StockId).HasColumnName("Stock Id");
            entity.Property(e => e.StorageFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Storage Fee");
            entity.Property(e => e.SurrenderFee)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Surrender Fee");
            entity.Property(e => e.Thc)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("THC");
            entity.Property(e => e.TotalCost)
                .HasColumnType("numeric(18, 5)")
                .HasColumnName("Total Cost");

            entity.HasOne(d => d.Stock).WithMany(p => p.StockCosts)
                .HasForeignKey(d => d.StockId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stock Cost_Stock");
        });

        modelBuilder.Entity<StockDocument>(entity =>
        {
            entity.ToTable("Stock Documents");

            entity.Property(e => e.StockDocumentId).HasColumnName("Stock Document Id");
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.DocumentType)
                .IsRequired()
                .HasMaxLength(500)
                .HasColumnName("Document Type");
            entity.Property(e => e.DocumentUrl)
                .IsRequired()
                .HasMaxLength(500)
                .HasColumnName("Document Url");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.StockId).HasColumnName("Stock Id");

            entity.HasOne(d => d.Stock).WithMany(p => p.StockDocuments)
                .HasForeignKey(d => d.StockId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stock Documents_Stock");
        });

        modelBuilder.Entity<StockImage>(entity =>
        {
            entity.ToTable("Stock Images");

            entity.Property(e => e.StockImageId).HasColumnName("Stock Image Id");
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.IsCover).HasColumnName("Is Cover");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.PhotoUrl)
                .IsRequired()
                .HasMaxLength(500)
                .HasColumnName("Photo Url");
            entity.Property(e => e.StockId).HasColumnName("Stock Id");

            entity.HasOne(d => d.Stock).WithMany(p => p.StockImages)
                .HasForeignKey(d => d.StockId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Stock Images_Stock");
        });

        modelBuilder.Entity<UserInfo>(entity =>
        {
            entity.HasKey(e => e.UserId);

            entity.ToTable("User Info");

            entity.Property(e => e.UserId).HasColumnName("User Id");
            entity.Property(e => e.City)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.ContactInfo)
                .IsRequired()
                .HasMaxLength(100)
                .HasColumnName("Contact Info");
            entity.Property(e => e.Country)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.EmailAddress)
                .IsRequired()
                .HasMaxLength(100)
                .HasColumnName("Email Address");
            entity.Property(e => e.FirstName)
                .IsRequired()
                .HasMaxLength(100)
                .HasColumnName("First Name");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.Language)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.LastName)
                .IsRequired()
                .HasMaxLength(100)
                .HasColumnName("Last Name");
            entity.Property(e => e.MiddleName)
                .HasMaxLength(100)
                .HasColumnName("Middle Name");
            entity.Property(e => e.PasswordHalt)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Password Halt");
            entity.Property(e => e.PasswordSalt)
                .HasMaxLength(250)
                .HasColumnName("Password Salt");
            entity.Property(e => e.Username)
                .IsRequired()
                .HasMaxLength(100);

            entity.HasOne(d => d.EntityNavigation).WithMany(p => p.UserInfos)
                .HasForeignKey(d => d.Entity)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_User Info_Entity");
        });

        modelBuilder.Entity<UserSecurityGroup>(entity =>
        {
            entity.HasKey(e => e.UserSecurityId);

            entity.ToTable("User Security Group");

            entity.Property(e => e.UserSecurityId).HasColumnName("User Security Id");
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.SecurityId).HasColumnName("Security Id");
            entity.Property(e => e.UserId).HasColumnName("User Id");

            entity.HasOne(d => d.Security).WithMany(p => p.UserSecurityGroups)
                .HasForeignKey(d => d.SecurityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_User Security Group_Security Group");

            entity.HasOne(d => d.User).WithMany(p => p.UserSecurityGroups)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_User Security Group_User Info");
        });

        modelBuilder.Entity<UserSession>(entity =>
        {
            entity.HasKey(e => e.SessionId);

            entity.ToTable("User Session");

            entity.Property(e => e.SessionId).HasColumnName("Session Id");
            entity.Property(e => e.Expiry).HasColumnType("datetime");
            entity.Property(e => e.Session)
                .IsRequired()
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.UserGuid)
                .IsRequired()
                .HasMaxLength(100)
                .HasColumnName("User Guid");
        });

        modelBuilder.Entity<ViewCustomer>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("View_Customers");

            entity.Property(e => e.Address).HasMaxLength(250);
            entity.Property(e => e.BuyingLimit)
                .HasColumnType("numeric(18, 3)")
                .HasColumnName("Buying Limit");
            entity.Property(e => e.BuyingLimitCurrency)
                .HasMaxLength(10)
                .HasColumnName("Buying Limit Currency");
            entity.Property(e => e.Category)
                .IsRequired()
                .HasMaxLength(250);
            entity.Property(e => e.CompanyName)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Company Name");
            entity.Property(e => e.CompanyOwner)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Company Owner");
            entity.Property(e => e.Country)
                .IsRequired()
                .HasMaxLength(250);
            entity.Property(e => e.CreatedBy)
                .IsRequired()
                .HasMaxLength(100)
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.CustomerId).HasColumnName("Customer Id");
            entity.Property(e => e.CustomerName)
                .IsRequired()
                .HasMaxLength(250)
                .HasColumnName("Customer Name");
            entity.Property(e => e.EntityName)
                .IsRequired()
                .HasMaxLength(300)
                .HasColumnName("Entity Name");
            entity.Property(e => e.Guid)
                .IsRequired()
                .HasMaxLength(100);
            entity.Property(e => e.ImportLicenseUrl)
                .HasMaxLength(500)
                .HasColumnName("Import License Url");
            entity.Property(e => e.IsHeadOffice).HasColumnName("Is Head Office");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.Phone).HasMaxLength(250);
            entity.Property(e => e.Source).HasMaxLength(250);
            entity.Property(e => e.TaxId)
                .HasMaxLength(250)
                .HasColumnName("Tax Id");
            entity.Property(e => e.UserId).HasColumnName("User Id");
            entity.Property(e => e.Username)
                .IsRequired()
                .HasMaxLength(100);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
