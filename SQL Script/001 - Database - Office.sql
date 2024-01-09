USE [master]
GO
/****** Object:  Database [Vehicles]    Script Date: 1/9/2024 4:52:03 PM ******/
CREATE DATABASE [Vehicles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vehicles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Vehicles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vehicles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Vehicles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Vehicles] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vehicles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vehicles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vehicles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vehicles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vehicles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vehicles] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vehicles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vehicles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vehicles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vehicles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vehicles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vehicles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vehicles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vehicles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vehicles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vehicles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vehicles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vehicles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vehicles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vehicles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vehicles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vehicles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vehicles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vehicles] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Vehicles] SET  MULTI_USER 
GO
ALTER DATABASE [Vehicles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vehicles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vehicles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vehicles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vehicles] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vehicles] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Vehicles] SET QUERY_STORE = OFF
GO
USE [Vehicles]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer Id] [int] IDENTITY(1,1) NOT NULL,
	[Entity] [int] NOT NULL,
	[User Id] [int] NOT NULL,
	[Company Name] [nvarchar](250) NOT NULL,
	[Company Owner] [nvarchar](250) NOT NULL,
	[Customer Name] [nvarchar](250) NOT NULL,
	[Country] [nvarchar](250) NOT NULL,
	[Source] [nvarchar](250) NULL,
	[Category] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Buying Limit Currency] [nvarchar](10) NULL,
	[Buying Limit] [numeric](18, 3) NULL,
	[Tax Id] [nvarchar](250) NULL,
	[Company Registration Url] [nvarchar](500) NULL,
	[Import License Url] [nvarchar](500) NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Customer Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[Entity] [int] IDENTITY(1,1) NOT NULL,
	[Entity Name] [nvarchar](300) NOT NULL,
	[Is Head Office] [bit] NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[Entity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User Info]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User Info](
	[User Id] [int] IDENTITY(1,1) NOT NULL,
	[Entity] [int] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password Halt] [varbinary](250) NOT NULL,
	[Password Salt] [varbinary](250) NULL,
	[First Name] [nvarchar](100) NOT NULL,
	[Middle Name] [nvarchar](100) NULL,
	[Last Name] [nvarchar](100) NOT NULL,
	[Email Address] [nvarchar](100) NOT NULL,
	[Contact Info] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Language] [nvarchar](100) NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User Info] PRIMARY KEY CLUSTERED 
(
	[User Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Customers]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Customers]
AS
SELECT        dbo.Entity.[Entity Name], dbo.Entity.[Is Head Office], dbo.[User Info].Username, dbo.Customers.[Company Name], dbo.Customers.[Company Owner], dbo.Customers.[Customer Name], dbo.Customers.Country, 
                         dbo.Customers.Source, dbo.Customers.Category, dbo.Customers.Address, dbo.Customers.Phone, dbo.Customers.[Buying Limit Currency], dbo.Customers.[Buying Limit], dbo.Customers.[Tax Id], 
                         dbo.Customers.[Import License Url], dbo.Customers.[Created By], dbo.Customers.[Created Date], dbo.Customers.[Last Modified By], dbo.Customers.[Last Modified Date], dbo.Customers.Guid, dbo.Customers.[Customer Id], 
                         dbo.Customers.Entity
FROM            dbo.Customers INNER JOIN
                         dbo.Entity ON dbo.Customers.Entity = dbo.Entity.Entity INNER JOIN
                         dbo.[User Info] ON dbo.Customers.[User Id] = dbo.[User Info].[User Id] AND dbo.Entity.Entity = dbo.[User Info].Entity
GO
/****** Object:  Table [dbo].[Consignee]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignee](
	[Consignee Id] [int] IDENTITY(1,1) NOT NULL,
	[Entity] [int] NOT NULL,
	[Company Name] [nvarchar](250) NOT NULL,
	[Company Owner] [nvarchar](250) NOT NULL,
	[Customer Name] [nvarchar](250) NOT NULL,
	[Country] [nvarchar](250) NOT NULL,
	[Source] [nvarchar](250) NULL,
	[Category] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[Buying Limit Currency] [nvarchar](10) NULL,
	[Buying Limit] [numeric](18, 3) NULL,
	[Tax Id] [nvarchar](250) NULL,
	[Company Registration Url] [nvarchar](500) NULL,
	[Import License Url] [nvarchar](500) NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Consignee] PRIMARY KEY CLUSTERED 
(
	[Consignee Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prompt Values]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prompt Values](
	[Prompt Id] [int] NOT NULL,
	[Prompt Name] [nvarchar](500) NOT NULL,
	[Prompt Sub Category] [nvarchar](500) NOT NULL,
	[Prompt Description] [nvarchar](500) NOT NULL,
	[Prompt Value] [nvarchar](500) NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Prompt Values] PRIMARY KEY CLUSTERED 
(
	[Prompt Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Sales Id] [int] NOT NULL,
	[Stock Id] [int] NOT NULL,
	[Consignee Id] [int] NOT NULL,
	[User Id] [int] NOT NULL,
	[Purchasing Price] [numeric](18, 3) NOT NULL,
	[Purchasing Price Currency] [nvarchar](10) NOT NULL,
	[Selling Price] [numeric](18, 3) NOT NULL,
	[Selling Price Currency] [nvarchar](10) NOT NULL,
	[Exchange Rate] [numeric](18, 10) NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Sales Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Security Group]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security Group](
	[Security Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Security Group] PRIMARY KEY CLUSTERED 
(
	[Security Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Stock Id] [int] IDENTITY(1,1) NOT NULL,
	[Entity] [int] NOT NULL,
	[Make] [nvarchar](300) NOT NULL,
	[Model] [nvarchar](300) NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Stock Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock Addtional Cost]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock Addtional Cost](
	[Stock Cost Id] [int] IDENTITY(1,1) NOT NULL,
	[Stock Id] [int] NOT NULL,
	[Cost Type] [nvarchar](300) NOT NULL,
	[Amount Curency] [nvarchar](10) NOT NULL,
	[Amount] [numeric](18, 3) NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Stock Addtional Cost] PRIMARY KEY CLUSTERED 
(
	[Stock Cost Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock Documents]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock Documents](
	[Stock Document Id] [int] IDENTITY(1,1) NOT NULL,
	[Stock Id] [int] NOT NULL,
	[Document Type] [nvarchar](500) NOT NULL,
	[Document Url] [nvarchar](500) NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Stock Documents] PRIMARY KEY CLUSTERED 
(
	[Stock Document Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock Images]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock Images](
	[Stock Image Id] [int] IDENTITY(1,1) NOT NULL,
	[Stock Id] [int] NOT NULL,
	[Photo Url] [nvarchar](500) NOT NULL,
	[Is Cover] [bit] NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Stock Images] PRIMARY KEY CLUSTERED 
(
	[Stock Image Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User Security Group]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User Security Group](
	[User Security Id] [int] IDENTITY(1,1) NOT NULL,
	[User Id] [int] NOT NULL,
	[Security Id] [int] NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User Security Group] PRIMARY KEY CLUSTERED 
(
	[User Security Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User Session]    Script Date: 1/9/2024 4:52:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User Session](
	[Session Id] [int] IDENTITY(1,1) NOT NULL,
	[User Guid] [nvarchar](100) NOT NULL,
	[Session] [nvarchar](100) NOT NULL,
	[Expiry] [datetime] NOT NULL,
 CONSTRAINT [PK_User Session] PRIMARY KEY CLUSTERED 
(
	[Session Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Consignee] ADD  CONSTRAINT [DF_Consignee_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Consignee] ADD  CONSTRAINT [DF_Consignee_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Consignee] ADD  CONSTRAINT [DF_Consignee_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Consignee] ADD  CONSTRAINT [DF_Consignee_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Entity] ADD  CONSTRAINT [DF_Entity_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Entity] ADD  CONSTRAINT [DF_Entity_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Entity] ADD  CONSTRAINT [DF_Entity_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Entity] ADD  CONSTRAINT [DF_Entity_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Prompt Values] ADD  CONSTRAINT [DF_Prompt Values_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Prompt Values] ADD  CONSTRAINT [DF_Prompt Values_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Prompt Values] ADD  CONSTRAINT [DF_Prompt Values_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Prompt Values] ADD  CONSTRAINT [DF_Prompt Values_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Security Group] ADD  CONSTRAINT [DF_Security Group_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Security Group] ADD  CONSTRAINT [DF_Security Group_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Security Group] ADD  CONSTRAINT [DF_Security Group_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Security Group] ADD  CONSTRAINT [DF_Security Group_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Stock Addtional Cost] ADD  CONSTRAINT [DF_Stock Addtional Cost_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Stock Addtional Cost] ADD  CONSTRAINT [DF_Stock Addtional Cost_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Stock Addtional Cost] ADD  CONSTRAINT [DF_Stock Addtional Cost_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Stock Addtional Cost] ADD  CONSTRAINT [DF_Stock Addtional Cost_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Stock Documents] ADD  CONSTRAINT [DF_Stock Documents_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Stock Documents] ADD  CONSTRAINT [DF_Stock Documents_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Stock Documents] ADD  CONSTRAINT [DF_Stock Documents_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Stock Documents] ADD  CONSTRAINT [DF_Stock Documents_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[Stock Images] ADD  CONSTRAINT [DF_Stock Images_Is Cover]  DEFAULT ((0)) FOR [Is Cover]
GO
ALTER TABLE [dbo].[Stock Images] ADD  CONSTRAINT [DF_Stock Images_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Stock Images] ADD  CONSTRAINT [DF_Stock Images_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Stock Images] ADD  CONSTRAINT [DF_Stock Images_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Stock Images] ADD  CONSTRAINT [DF_Stock Images_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[User Info] ADD  CONSTRAINT [DF_User Info_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[User Info] ADD  CONSTRAINT [DF_User Info_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[User Info] ADD  CONSTRAINT [DF_User Info_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[User Info] ADD  CONSTRAINT [DF_User Info_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[User Security Group] ADD  CONSTRAINT [DF_User Security Group_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[User Security Group] ADD  CONSTRAINT [DF_User Security Group_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[User Security Group] ADD  CONSTRAINT [DF_User Security Group_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[User Security Group] ADD  CONSTRAINT [DF_User Security Group_Guid]  DEFAULT (newid()) FOR [Guid]
GO
ALTER TABLE [dbo].[User Session] ADD  CONSTRAINT [DF_User Session_Session]  DEFAULT (newid()) FOR [Session]
GO
ALTER TABLE [dbo].[Consignee]  WITH CHECK ADD  CONSTRAINT [FK_Consignee_Entity] FOREIGN KEY([Entity])
REFERENCES [dbo].[Entity] ([Entity])
GO
ALTER TABLE [dbo].[Consignee] CHECK CONSTRAINT [FK_Consignee_Entity]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Entity] FOREIGN KEY([Entity])
REFERENCES [dbo].[Entity] ([Entity])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Entity]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_User Info] FOREIGN KEY([User Id])
REFERENCES [dbo].[User Info] ([User Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_User Info]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Consignee] FOREIGN KEY([Consignee Id])
REFERENCES [dbo].[Consignee] ([Consignee Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Consignee]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Stock] FOREIGN KEY([Stock Id])
REFERENCES [dbo].[Stock] ([Stock Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Stock]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_User Info] FOREIGN KEY([User Id])
REFERENCES [dbo].[User Info] ([User Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_User Info]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Entity] FOREIGN KEY([Entity])
REFERENCES [dbo].[Entity] ([Entity])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Entity]
GO
ALTER TABLE [dbo].[Stock Addtional Cost]  WITH CHECK ADD  CONSTRAINT [FK_Stock Addtional Cost_Stock] FOREIGN KEY([Stock Id])
REFERENCES [dbo].[Stock] ([Stock Id])
GO
ALTER TABLE [dbo].[Stock Addtional Cost] CHECK CONSTRAINT [FK_Stock Addtional Cost_Stock]
GO
ALTER TABLE [dbo].[Stock Documents]  WITH CHECK ADD  CONSTRAINT [FK_Stock Documents_Stock] FOREIGN KEY([Stock Id])
REFERENCES [dbo].[Stock] ([Stock Id])
GO
ALTER TABLE [dbo].[Stock Documents] CHECK CONSTRAINT [FK_Stock Documents_Stock]
GO
ALTER TABLE [dbo].[Stock Images]  WITH CHECK ADD  CONSTRAINT [FK_Stock Images_Stock] FOREIGN KEY([Stock Id])
REFERENCES [dbo].[Stock] ([Stock Id])
GO
ALTER TABLE [dbo].[Stock Images] CHECK CONSTRAINT [FK_Stock Images_Stock]
GO
ALTER TABLE [dbo].[User Info]  WITH CHECK ADD  CONSTRAINT [FK_User Info_Entity] FOREIGN KEY([Entity])
REFERENCES [dbo].[Entity] ([Entity])
GO
ALTER TABLE [dbo].[User Info] CHECK CONSTRAINT [FK_User Info_Entity]
GO
ALTER TABLE [dbo].[User Security Group]  WITH CHECK ADD  CONSTRAINT [FK_User Security Group_Security Group] FOREIGN KEY([Security Id])
REFERENCES [dbo].[Security Group] ([Security Id])
GO
ALTER TABLE [dbo].[User Security Group] CHECK CONSTRAINT [FK_User Security Group_Security Group]
GO
ALTER TABLE [dbo].[User Security Group]  WITH CHECK ADD  CONSTRAINT [FK_User Security Group_User Info] FOREIGN KEY([User Id])
REFERENCES [dbo].[User Info] ([User Id])
GO
ALTER TABLE [dbo].[User Security Group] CHECK CONSTRAINT [FK_User Security Group_User Info]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[40] 2[22] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 186
               Right = 267
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Entity"
            Begin Extent = 
               Top = 6
               Left = 301
               Bottom = 183
               Right = 495
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User Info"
            Begin Extent = 
               Top = 6
               Left = 527
               Bottom = 188
               Right = 748
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 23
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1800
         Width = 1545
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Customers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Customers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Customers'
GO
USE [master]
GO
ALTER DATABASE [Vehicles] SET  READ_WRITE 
GO
