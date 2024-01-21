USE [master]
GO
/****** Object:  Database [Vehicles]    Script Date: 1/16/2024 8:09:42 PM ******/
CREATE DATABASE [Vehicles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vehicles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vehicles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vehicles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vehicles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO


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
/****** Object:  Table [dbo].[Customers]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  Table [dbo].[Entity]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  Table [dbo].[User Info]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  View [dbo].[View_Customers]    Script Date: 1/16/2024 8:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Customers]
AS
SELECT        dbo.Entity.[Entity Name], dbo.Entity.[Is Head Office], dbo.[User Info].Username, dbo.Customers.[Company Name], dbo.Customers.[Company Owner], dbo.Customers.[Customer Name], dbo.Customers.Country, 
                         dbo.Customers.Source, dbo.Customers.Category, dbo.Customers.Address, dbo.Customers.Phone, dbo.Customers.[Buying Limit Currency], dbo.Customers.[Buying Limit], dbo.Customers.[Tax Id], 
                         dbo.Customers.[Import License Url], dbo.Customers.[Created By], dbo.Customers.[Created Date], dbo.Customers.[Last Modified By], dbo.Customers.[Last Modified Date], dbo.Customers.Guid, dbo.Customers.[Customer Id], 
                         dbo.Customers.Entity, dbo.Customers.[User Id]
FROM            dbo.Customers INNER JOIN
                         dbo.Entity ON dbo.Customers.Entity = dbo.Entity.Entity INNER JOIN
                         dbo.[User Info] ON dbo.Customers.[User Id] = dbo.[User Info].[User Id] AND dbo.Entity.Entity = dbo.[User Info].Entity
GO
/****** Object:  Table [dbo].[Consignee]    Script Date: 1/16/2024 8:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consignee](
	[Consignee Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer Id] [int] NOT NULL,
	[Company Name] [nvarchar](250) NOT NULL,
	[Company Owner] [nvarchar](250) NOT NULL,
	[Consignee Name] [nvarchar](250) NOT NULL,
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
/****** Object:  Table [dbo].[Prompt Values]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  Table [dbo].[Sales]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  Table [dbo].[Security Group]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  Table [dbo].[Stock]    Script Date: 1/16/2024 8:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Stock Id] [int] IDENTITY(1,1) NOT NULL,
	[Entity] [int] NOT NULL,
	[Serial No] [nvarchar](300) NULL,
	[Status] [nvarchar](300) NULL,
	[Model Code] [nvarchar](300) NULL,
	[Make] [nvarchar](300) NULL,
	[Model] [nvarchar](300) NULL,
	[Chasis Model] [nvarchar](300) NULL,
	[CC] [nvarchar](300) NULL,
	[Year] [date] NULL,
	[Color] [nvarchar](300) NULL,
	[Purchase Date] [datetime] NULL,
	[Manufacture Date] [datetime] NULL,
	[Auction Ship No] [nvarchar](300) NULL,
	[Traction] [nvarchar](300) NULL,
	[Vehicle Grade] [nvarchar](300) NULL,
	[Fuel Type] [nvarchar](300) NULL,
	[Transmission] [nvarchar](300) NULL,
	[Mileage] [nvarchar](300) NULL,
	[Interior Color] [nvarchar](300) NULL,
	[Weight] [numeric](18, 0) NULL,
	[Gross Weight] [numeric](18, 0) NULL,
	[Net Weight] [numeric](18, 0) NULL,
	[Area] [numeric](18, 5) NULL,
	[Engine Type] [nvarchar](300) NULL,
	[Engine Number] [nvarchar](300) NULL,
	[Doors] [int] NULL,
	[Length] [numeric](18, 5) NULL,
	[Width] [numeric](18, 5) NULL,
	[Height] [numeric](18, 5) NULL,
	[Passenger] [int] NULL,
	[Ichi Masho] [nvarchar](300) NULL,
	[N1] [nvarchar](300) NULL,
	[N2] [nvarchar](300) NULL,
	[N3] [nvarchar](300) NULL,
	[N4] [nvarchar](300) NULL,
	[Repaired] [nvarchar](300) NULL,
	[Other Information] [nvarchar](300) NULL,
	[Body] [nvarchar](300) NULL,
	[Comments] [nvarchar](300) NULL,
	[APJ Comments] [nvarchar](300) NULL,
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
/****** Object:  Table [dbo].[Stock Addtional Cost]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  Table [dbo].[Stock Cost]    Script Date: 1/16/2024 8:09:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock Cost](
	[Stock Cost Id] [int] IDENTITY(1,1) NOT NULL,
	[Stock Id] [int] NOT NULL,
	[Buying Cost] [numeric](18, 5) NOT NULL,
	[Auction Fee] [numeric](18, 5) NULL,
	[Penalty] [numeric](18, 5) NULL,
	[Jizel] [numeric](18, 5) NULL,
	[Commission] [numeric](18, 5) NULL,
	[THC] [numeric](18, 5) NULL,
	[Storage Fee] [numeric](18, 5) NULL,
	[Forwarding Price] [numeric](18, 5) NULL,
	[Repairs] [numeric](18, 5) NULL,
	[Auction Fee Selling] [numeric](18, 5) NULL,
	[Freight] [numeric](18, 5) NULL,
	[Rikso] [numeric](18, 5) NULL,
	[Misc] [numeric](18, 5) NULL,
	[Auction Visit Fee] [numeric](18, 5) NULL,
	[Total Cost] [numeric](18, 5) NULL,
	[Senda Fee] [numeric](18, 5) NULL,
	[Inspection Fee] [numeric](18, 5) NULL,
	[Sale Price] [numeric](18, 5) NULL,
	[Profit] [numeric](18, 5) NULL,
	[Profit Percentage] [numeric](18, 5) NULL,
	[Recycle Fee Refunded] [numeric](18, 5) NULL,
	[Recycle Fee] [numeric](18, 5) NULL,
	[Autoquest Fee] [numeric](18, 5) NULL,
	[Recycle Cost] [numeric](18, 5) NULL,
	[Insurance Fee] [numeric](18, 5) NULL,
	[Radioactive Inspection] [numeric](18, 5) NULL,
	[Agent Stock] [nvarchar](50) NULL,
	[Photo Fee] [numeric](18, 5) NULL,
	[Cutting Fee] [numeric](18, 5) NULL,
	[Custom Price] [numeric](18, 5) NULL,
	[Smoke Fee] [numeric](18, 5) NULL,
	[Exchange Rate] [numeric](18, 5) NULL,
	[Invoice Price USD] [numeric](18, 5) NULL,
	[Surrender Fee] [numeric](18, 5) NULL,
	[Linked Part] [numeric](18, 5) NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NOT NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Stock Cost] PRIMARY KEY CLUSTERED 
(
	[Stock Cost Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock Documents]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  Table [dbo].[Stock Images]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  Table [dbo].[User Security Group]    Script Date: 1/16/2024 8:09:42 PM ******/
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
/****** Object:  Table [dbo].[User Session]    Script Date: 1/16/2024 8:09:42 PM ******/
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
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([Customer Id], [Entity], [User Id], [Company Name], [Company Owner], [Customer Name], [Country], [Source], [Category], [Address], [Phone], [Buying Limit Currency], [Buying Limit], [Tax Id], [Company Registration Url], [Import License Url], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (2, 1, 1, N'First Company', N'James Bond', N'The Rock', N'United States', NULL, N'First Category', N'ABC Street', N'+12547856', N'$', CAST(3000.000 AS Numeric(18, 3)), N'12548', N'658974', N'www.google.com', N'Audit', CAST(N'2024-01-09T15:44:25.657' AS DateTime), CAST(N'2024-01-09T15:44:25.657' AS DateTime), NULL, N'B2962CEA-FFDD-4707-B6C9-AC166AE99281')
GO
INSERT [dbo].[Customers] ([Customer Id], [Entity], [User Id], [Company Name], [Company Owner], [Customer Name], [Country], [Source], [Category], [Address], [Phone], [Buying Limit Currency], [Buying Limit], [Tax Id], [Company Registration Url], [Import License Url], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (3, 2, 2, N'Second Company', N'Donald Duck', N'Tom And Jerry', N'United States', NULL, N'Second Category', N'ABC Street', N'+12547856', N'$', CAST(5000.000 AS Numeric(18, 3)), N'365894', N'9998547', N'www.google.com', N'Audit', CAST(N'2024-01-09T15:44:25.657' AS DateTime), CAST(N'2024-01-09T15:44:25.657' AS DateTime), NULL, N'B2962CEA-FFDD-4707-B6C9-AC166AE99281')
GO
INSERT [dbo].[Customers] ([Customer Id], [Entity], [User Id], [Company Name], [Company Owner], [Customer Name], [Country], [Source], [Category], [Address], [Phone], [Buying Limit Currency], [Buying Limit], [Tax Id], [Company Registration Url], [Import License Url], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (4, 1, 1, N'The Rock', N'James Bond', N'The Rock', N'United States', NULL, N'First Category', N'ABC Street', N'+12547856', N'$', CAST(3000.000 AS Numeric(18, 3)), N'12548', NULL, N'www.google.com', N'Audit', CAST(N'2024-01-10T16:17:54.463' AS DateTime), CAST(N'2024-01-10T16:17:54.463' AS DateTime), NULL, N'4b380295-8333-4515-9ef3-191bb7d90fe7')
GO
INSERT [dbo].[Customers] ([Customer Id], [Entity], [User Id], [Company Name], [Company Owner], [Customer Name], [Country], [Source], [Category], [Address], [Phone], [Buying Limit Currency], [Buying Limit], [Tax Id], [Company Registration Url], [Import License Url], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (5, 1, 1, N'Fourth Company 2', N'James Bond', N'The Rock', N'United States', NULL, N'First Category', N'ABC Street', N'+12547856', N'$', CAST(3000.000 AS Numeric(18, 3)), N'12548', NULL, N'www.google.com', N'Audit', CAST(N'2024-01-10T16:18:38.703' AS DateTime), CAST(N'2024-01-10T13:31:17.660' AS DateTime), N'noufil', N'6c11315d-af5a-4fac-8348-65e45826be3d')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Entity] ON 
GO
INSERT [dbo].[Entity] ([Entity], [Entity Name], [Is Head Office], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (1, N'Head Office', 1, N'Audit', CAST(N'2024-01-08T20:42:53.037' AS DateTime), CAST(N'2024-01-08T20:42:53.037' AS DateTime), NULL, N'C4BA11D4-92E2-4277-9E7A-2BC30259C7A6')
GO
INSERT [dbo].[Entity] ([Entity], [Entity Name], [Is Head Office], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (2, N'Karachi Office', 0, N'Audit', CAST(N'2024-01-08T20:43:15.527' AS DateTime), CAST(N'2024-01-08T20:43:15.527' AS DateTime), NULL, N'16B943A4-1028-475C-8D7F-F9E977644E5D')
GO
SET IDENTITY_INSERT [dbo].[Entity] OFF
GO
SET IDENTITY_INSERT [dbo].[Security Group] ON 
GO
INSERT [dbo].[Security Group] ([Security Id], [Description], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (1, N'Admin', N'Audit', CAST(N'2024-01-08T21:09:59.687' AS DateTime), CAST(N'2024-01-08T21:09:59.687' AS DateTime), NULL, N'8729484F-7477-40F6-A8E2-030E23443D45')
GO
INSERT [dbo].[Security Group] ([Security Id], [Description], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (2, N'Agent', N'Audit', CAST(N'2024-01-08T21:10:04.067' AS DateTime), CAST(N'2024-01-08T21:10:04.067' AS DateTime), NULL, N'6056022C-C6E9-40EF-87FD-E0345E1E0765')
GO
SET IDENTITY_INSERT [dbo].[Security Group] OFF
GO
SET IDENTITY_INSERT [dbo].[User Info] ON 
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (1, 1, N'noufil', 0xE98AEB113C42865BCDF97D447943EA49ECBB414EF2F7CA9615919B0CCC8E893BD485BCE05B2BD99697275573D28CE1F66AD49184F48588DB3ECC9D3BE1545054, 0x9B5E29F1094A2BF32AE86D80FCD120F69EE241D4A3268C9F0BF1D397A033D5637F386D6A1C3920CAC90AECCE5D6E592431E3250ED28B1885AF953E41E306E7214B091F73F1B1B958F39D72B0AAF98947B8812D58DF888468F6DE4200E1AB846BB867D3FF1D9564052281F8B82307ED54036812E91882F3FADAE305633D68FF42, N'Noufil', N'', N'Khan', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-08T20:55:59.987' AS DateTime), CAST(N'2024-01-08T20:55:59.987' AS DateTime), N'', N'92EA8842-B698-408F-AA4D-1176A100020C')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (2, 2, N'faaz', 0xF9BA827E2A7C75FF21A366AD557BD4908504AC93BA872977DE97F64B97E10CA8DACEF210A8CC19F022212305E9EBD89387A93E73F6F3644DDA316B681DE1AD0C, 0x6EE01CAF7563602CA9DDD547A2C1B15410C236E230434949F78D912CCF63FEF7090673F858DF6C1E25E0BFBE94AF85AB9B9964FFB7F6EF836F26F71BA4376DC619C7FB537A212D83D3D704090C85030D85F6FBE4FB5D0186BA8FBE8217DD599A77536B0F86198B9D321D6A1C2E9EBF1096274A71956CF6334C5C1641D39A7EA2, N'Faaz', N'', N'Khan', N'faaz@live.net', N'+9234330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-08T20:55:31.603' AS DateTime), CAST(N'2024-01-08T20:55:31.603' AS DateTime), N'', N'CEA54C7B-1A43-428E-80EF-C285421488BD')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (3, 2, N'lisa', 0xBB44FC52BED59E3325D82CF6D1A703F64F8188B8F01104C72A42CAF82CF37D0BBE0F6C28F1AD9D80F3AF4A3F32DE2FF01F0C1B722110CFF5A1D6FF4195D275F4, 0x2F545A1293BCFD853FEFB458BC73BBA87C7C09DAB2279032419F324FFDD9778714B3154D624F58F152D46410E2D91FB5C4AB22592680C447E9132600D1AA9BA6672903C34A15E89D840CFBF71D09DEA27E9AFE12FE001E09982CDC07E48F6105654F3D5C00E43A050E730E104BDB11C48F7ECE3CBF356F9B3ED7815C79842EAB, N'Noufil', N'', N'Khan', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-08T20:54:34.523' AS DateTime), CAST(N'2024-01-08T20:54:34.523' AS DateTime), N'', N'2B8E073B-7724-4F3B-957F-FA7EAB3805BA')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (8, 2, N'mark', 0x2CC72440023D7D10B9FFD57741A16E19E3C20257794CA01136D3CD223A574F8225E44995F7D003C34D613498839B31669EF4A42FFE1673BFCC068FC6DA89BE5C, 0xB7DA586313002C8DC817F303A3FF21085B671F2C3DE629925849BEC25D62D62953950DB1F0D5A391BC27C345B411678242101AB92E01E866DFDF27525A5677AEBFF8057FA845FC1383A2CECA5FFA76D3B7E45429F1E0AD150DBA8DA0057F3DDB6BC4C725336CBAE5931DB32E54D18B26174B4A4B6AA27604A00898AAA8B1DC84, N'Noufil', N'', N'Khan', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-08T21:54:08.560' AS DateTime), CAST(N'2024-01-08T21:54:08.560' AS DateTime), N'', N'3276E790-BDFF-4AB6-BCB1-AA49D3DFB2C8')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (9, 1, N'crimepatrol', 0x138334E6AF9047B295461C1F0466D9373F69B9885F8F46F9728957BCEBB8482955C9A4E900A3686D347C23C9B3907BA5E881A2A3FA3749CA21A988EEC6B70254, 0xA3F7D3CC1E0D9A092C3244D03D20F6E19B9A1BAE1E0F097B07EF8F388DC4E828D0D9CBD24DD0298339C21CFD3E4261D3ECA833F79960A1380A3A055B8B7124554624C133D4A441B1A9F3F4A99434DAC8B19C061B9EE3EC9F8BD0103CC6C2084AED4496761048AB78D5AD3C273788111B3A3262FCADA1EF9890DF50BACB506BE4, N'Crime', N'', N'Patrol', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-10T14:09:00.917' AS DateTime), CAST(N'2024-01-10T14:09:00.917' AS DateTime), N'', N'3A6F195D-99CB-4275-9591-17C6430BE964')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (10, 1, N'crimepatrol', 0x553C3B1B140D1A1991B9A31B3FF9DE7D3C545E3DA8064999CF7C8568A854D33E88557A8CAC28D4618E0F556F93D8C5A30422103F88E52EE7810553CBFC063E76, 0x88B3C1DE7776C2D0B2DC3D5A77EA8D69FDB77ADA2768C4767E5DDCF9E2F15C25CAEB449BEF4802A861C04FB92292A9C944453A3315166A0EFFBEEA741C67455B0A133DC68AE512AA566E04D8816D402BA926942A9DB205E257355A34D371B81D5994616E3242B0D2AEE3C12E91755BAEA2E0733F3ADEE071480C5C23C205CC8B, N'Crime', N'', N'Patrol', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-10T14:53:07.250' AS DateTime), CAST(N'2024-01-10T14:53:07.250' AS DateTime), N'', N'8D597393-C50D-4DB2-B1E0-34848C266950')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (11, 1, N'crimepatrol', 0x6CCE5254A1202C71C2767470F8B859E9F9D5EEC551765887E8849283034A72D39F6DC397219BBC86C248F44CA1AE69C47B8E51ABB1A786404282102746901130, 0x528F2EA8B111B212030CD72F21E1CF39943CE1A7CC074277FC23723ACFEA87BBD5FF119CA04E171B89973DBC5890D58BE0A09A31A7695A2627CE2F2A3C41DCE593B8B11CEEE2C85CBB7ADD08D27E1FF0297CCAE0220A5A6C57C53185AB79FEEB21300A54D885A5E534D86020E2C3A40AE8B4005DD5180D54D1D80EB2D4CD9A2D, N'Crime', N'', N'Patrol', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-10T14:54:47.140' AS DateTime), CAST(N'2024-01-10T14:54:47.140' AS DateTime), N'', N'103AF5A6-340A-4E42-AA2F-BD4DDFD2FD53')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (12, 1, N'crimepatrol', 0x8F0A79868811F5F2D9A506F4EEB9BD42427A768869BCD30ED7298BAFBCF948E4BBE407036C4CA6A76325DC157C19115991F23BE58E185D5BD8789854A7C9B2B0, 0x4DE0920CF38D7FD881BD25488086F0286D97CE97B75593C2173EBB3A61A494B6C239F4A18CD2BC1C227D55561F3E4234ADC9A9428A130A70A8991C4F45F68B67B2B08B4D69A1A5277BB052492C34A4C08575EDCCE0933918A84569B60A0BEB27E826DE5C71ADB6FCBBDCC812A1EAEC7F4CF6B50493B03D0961E5EF2F3A040F7F, N'Crime', N'', N'Patrol', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-10T14:54:49.420' AS DateTime), CAST(N'2024-01-10T14:54:49.420' AS DateTime), N'', N'85CEFF91-9F56-4967-B085-833F375C3C27')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (13, 1, N'crimepatrol22', 0xEB8B4345C98D7696DDB2EED96A0296833A29A072826BCBF42E90421F6DF42623CF8F7CEA89EC1F344B2504A9A9A9F38FDD8A9DAA8BA7C1C0EB64947628D627CB, 0x232396D283121CAB8A377FF291B8D824EFEA0C1E40D417981DA1E5E61FE9C1E757592F642C82BB9C08A7A8776E8A046143A29E819E00780DFBEA3A27CBDBC9E14E620D08A14B6BDB993CA8C21E549B2980934162AF0759387A7170C13F6D41F32E9CDEF16225EE2E5143B8B0120CA36F80EE893B6D1C87729C319918AC18787A, N'Crime', N'', N'Patrol', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-10T15:04:21.860' AS DateTime), CAST(N'2024-01-10T15:04:21.860' AS DateTime), N'', N'2631604A-2558-4E3D-96E6-F7B1FFE9325E')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (14, 1, N'crimepatrol33', 0x82FC723205A5129CA56213E82D31CD878530B378254B1B59FECC4030D2C50E4AF7E06B49547FA678747D2C0BAA8C2FA6D0EAF6615805AC8BC1B08F66B3D53A70, 0xE6013146E8E92FF263748AE4A88AE5580C3659EA560EB83247F4643D50A44FA2CCE1A6312D34EF28F4CF75D23A7D37599E002BBE2A7EF1DD78000F761D6A986EFE494313F5ECD593B211F63E63D715C6B9ABAAEEBDF44446919040AA04AA5A112018B7BD0D2084E7B64F3CE4A5013BEF4FE166983CFD357AED4453FE9461F1E4, N'Crime', N'', N'Patrol', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-10T15:53:31.453' AS DateTime), CAST(N'2024-01-10T15:53:31.453' AS DateTime), N'', N'943A09E1-F923-40CE-A20A-E0AE50C3F462')
GO
SET IDENTITY_INSERT [dbo].[User Info] OFF
GO
SET IDENTITY_INSERT [dbo].[User Security Group] ON 
GO
INSERT [dbo].[User Security Group] ([User Security Id], [User Id], [Security Id], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (1, 1, 1, N'Audit', CAST(N'2024-01-08T21:10:27.790' AS DateTime), CAST(N'2024-01-08T21:10:27.790' AS DateTime), NULL, N'51A6A361-5595-4EC6-92C5-EAAF6D343658')
GO
INSERT [dbo].[User Security Group] ([User Security Id], [User Id], [Security Id], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (2, 2, 1, N'Audit', CAST(N'2024-01-08T21:10:32.203' AS DateTime), CAST(N'2024-01-08T21:10:32.203' AS DateTime), NULL, N'4B779BCD-509C-40DF-8439-F9849130D307')
GO
INSERT [dbo].[User Security Group] ([User Security Id], [User Id], [Security Id], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (4, 3, 2, N'Audit', CAST(N'2024-01-08T21:10:40.623' AS DateTime), CAST(N'2024-01-08T21:10:40.623' AS DateTime), NULL, N'3AAC8C09-F735-47A1-AF3B-14862DE57296')
GO
SET IDENTITY_INSERT [dbo].[User Security Group] OFF
GO
SET IDENTITY_INSERT [dbo].[User Session] ON 
GO
INSERT [dbo].[User Session] ([Session Id], [User Guid], [Session], [Expiry]) VALUES (1, N'92EA8842-B698-408F-AA4D-1176A100020C', N'E8F4F9DF-26B6-4023-B7D1-249652CA29E2', CAST(N'2024-01-08T20:35:13.163' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[User Session] OFF
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
ALTER TABLE [dbo].[Stock Cost] ADD  CONSTRAINT [DF_Stock Cost_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Stock Cost] ADD  CONSTRAINT [DF_Stock Cost_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Stock Cost] ADD  CONSTRAINT [DF_Stock Cost_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Stock Cost] ADD  CONSTRAINT [DF_Stock Cost_Guid]  DEFAULT (newid()) FOR [Guid]
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
ALTER TABLE [dbo].[Consignee]  WITH CHECK ADD  CONSTRAINT [FK_Consignee_Customers] FOREIGN KEY([Customer Id])
REFERENCES [dbo].[Customers] ([Customer Id])
GO
ALTER TABLE [dbo].[Consignee] CHECK CONSTRAINT [FK_Consignee_Customers]
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
ALTER TABLE [dbo].[Stock Cost]  WITH CHECK ADD  CONSTRAINT [FK_Stock Cost_Stock] FOREIGN KEY([Stock Id])
REFERENCES [dbo].[Stock] ([Stock Id])
GO
ALTER TABLE [dbo].[Stock Cost] CHECK CONSTRAINT [FK_Stock Cost_Stock]
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
               Top = 186
               Left = 38
               Bottom = 316
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
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
         Filte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Customers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'r = 1350
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
