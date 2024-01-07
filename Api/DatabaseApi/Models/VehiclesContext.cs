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

    public virtual DbSet<StockDocument> StockDocuments { get; set; }

    public virtual DbSet<StockImage> StockImages { get; set; }

    public virtual DbSet<UserInfo> UserInfos { get; set; }

    public virtual DbSet<UserSecurityGroup> UserSecurityGroups { get; set; }

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
            entity.Property(e => e.Category).HasMaxLength(250);
            entity.Property(e => e.CompanyName)
                .HasMaxLength(250)
                .HasColumnName("Company Name");
            entity.Property(e => e.CompanyOwner)
                .HasMaxLength(250)
                .HasColumnName("Company Owner");
            entity.Property(e => e.CompanyRegistrationUrl)
                .HasMaxLength(500)
                .HasColumnName("Company Registration Url");
            entity.Property(e => e.Country).HasMaxLength(250);
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.CustomerName)
                .HasMaxLength(250)
                .HasColumnName("Customer Name");
            entity.Property(e => e.Guid)
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

            entity.HasOne(d => d.EntityNavigation).WithMany(p => p.Consignees)
                .HasForeignKey(d => d.Entity)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Consignee_Entity");
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
            entity.Property(e => e.Category).HasMaxLength(250);
            entity.Property(e => e.CompanyName)
                .HasMaxLength(250)
                .HasColumnName("Company Name");
            entity.Property(e => e.CompanyOwner)
                .HasMaxLength(250)
                .HasColumnName("Company Owner");
            entity.Property(e => e.CompanyRegistrationUrl)
                .HasMaxLength(500)
                .HasColumnName("Company Registration Url");
            entity.Property(e => e.Country).HasMaxLength(250);
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.CustomerName)
                .HasMaxLength(250)
                .HasColumnName("Customer Name");
            entity.Property(e => e.Guid)
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
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.EntityName)
                .HasMaxLength(300)
                .HasColumnName("Entity Name");
            entity.Property(e => e.Guid)
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

            entity.Property(e => e.PromptId)
                .ValueGeneratedNever()
                .HasColumnName("Prompt Id");
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Guid)
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
                .HasMaxLength(500)
                .HasColumnName("Prompt Description");
            entity.Property(e => e.PromptName)
                .HasMaxLength(500)
                .HasColumnName("Prompt Name");
            entity.Property(e => e.PromptSubCategory)
                .HasMaxLength(500)
                .HasColumnName("Prompt Sub Category");
            entity.Property(e => e.PromptValue1)
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
                .HasMaxLength(10)
                .HasColumnName("Purchasing Price Currency");
            entity.Property(e => e.SellingPrice)
                .HasColumnType("numeric(18, 3)")
                .HasColumnName("Selling Price");
            entity.Property(e => e.SellingPriceCurrency)
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
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Description).HasMaxLength(100);
            entity.Property(e => e.Guid)
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
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Guid)
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.Make).HasMaxLength(300);
            entity.Property(e => e.Model).HasMaxLength(300);

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
                .HasMaxLength(10)
                .HasColumnName("Amount Curency");
            entity.Property(e => e.CostType)
                .HasMaxLength(300)
                .HasColumnName("Cost Type");
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Guid)
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

        modelBuilder.Entity<StockDocument>(entity =>
        {
            entity.ToTable("Stock Documents");

            entity.Property(e => e.StockDocumentId).HasColumnName("Stock Document Id");
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.DocumentType)
                .HasMaxLength(500)
                .HasColumnName("Document Type");
            entity.Property(e => e.DocumentUrl)
                .HasMaxLength(500)
                .HasColumnName("Document Url");
            entity.Property(e => e.Guid)
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
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Guid)
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
            entity.Property(e => e.City).HasMaxLength(100);
            entity.Property(e => e.ContactInfo)
                .HasMaxLength(100)
                .HasColumnName("Contact Info");
            entity.Property(e => e.Country).HasMaxLength(100);
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.EmailAddress)
                .HasMaxLength(100)
                .HasColumnName("Email Address");
            entity.Property(e => e.FirstName)
                .HasMaxLength(100)
                .HasColumnName("First Name");
            entity.Property(e => e.Guid)
                .HasMaxLength(100)
                .HasDefaultValueSql("(newid())");
            entity.Property(e => e.Language).HasMaxLength(100);
            entity.Property(e => e.LastModifiedBy)
                .HasMaxLength(100)
                .HasColumnName("Last Modified By");
            entity.Property(e => e.LastModifiedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Last Modified Date");
            entity.Property(e => e.LastName)
                .HasMaxLength(100)
                .HasColumnName("Last Name");
            entity.Property(e => e.MiddleName)
                .HasMaxLength(100)
                .HasColumnName("Middle Name");
            entity.Property(e => e.PasswordHalt)
                .HasMaxLength(250)
                .HasColumnName("Password Halt");
            entity.Property(e => e.PasswordSalt)
                .HasMaxLength(250)
                .HasColumnName("Password Salt");
            entity.Property(e => e.Username).HasMaxLength(100);

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
                .HasMaxLength(100)
                .HasDefaultValueSql("(N'Audit')")
                .HasColumnName("Created By");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("Created Date");
            entity.Property(e => e.Guid)
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

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
