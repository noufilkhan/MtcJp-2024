USE [master]
GO
/****** Object:  Database [Vehicles]    Script Date: 1/6/2024 9:56:54 PM ******/
CREATE DATABASE [Vehicles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vehicles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vehicles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vehicles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vehicles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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
/****** Object:  Table [dbo].[Consignee]    Script Date: 1/6/2024 9:56:55 PM ******/
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
	[Last Modified Date] [datetime] NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Consignee] PRIMARY KEY CLUSTERED 
(
	[Consignee Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/6/2024 9:56:55 PM ******/
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
	[Last Modified Date] [datetime] NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Customer Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 1/6/2024 9:56:55 PM ******/
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
	[Last Modified Date] [datetime] NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[Entity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Security Group]    Script Date: 1/6/2024 9:56:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Security Group](
	[Security Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Security Group] PRIMARY KEY CLUSTERED 
(
	[Security Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User Info]    Script Date: 1/6/2024 9:56:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User Info](
	[User Id] [int] IDENTITY(1,1) NOT NULL,
	[Entity] [int] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password Halt] [nvarchar](100) NOT NULL,
	[Password Salt] [nvarchar](100) NULL,
	[First Name] [nvarchar](100) NOT NULL,
	[Middle Name] [nvarchar](100) NULL,
	[Last Name] [nvarchar](100) NOT NULL,
	[Email Address] [nvarchar](100) NOT NULL,
	[Contact Info] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Created By] [nvarchar](100) NOT NULL,
	[Created Date] [datetime] NOT NULL,
	[Last Modified Date] [datetime] NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User Info] PRIMARY KEY CLUSTERED 
(
	[User Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User Security Group]    Script Date: 1/6/2024 9:56:55 PM ******/
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
	[Last Modified Date] [datetime] NULL,
	[Last Modified By] [nvarchar](100) NULL,
	[Guid] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User Security Group] PRIMARY KEY CLUSTERED 
(
	[User Security Id] ASC
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
ALTER TABLE [dbo].[Security Group] ADD  CONSTRAINT [DF_Security Group_Created By]  DEFAULT (N'Audit') FOR [Created By]
GO
ALTER TABLE [dbo].[Security Group] ADD  CONSTRAINT [DF_Security Group_Created Date]  DEFAULT (getdate()) FOR [Created Date]
GO
ALTER TABLE [dbo].[Security Group] ADD  CONSTRAINT [DF_Security Group_Last Modified Date]  DEFAULT (getdate()) FOR [Last Modified Date]
GO
ALTER TABLE [dbo].[Security Group] ADD  CONSTRAINT [DF_Security Group_Guid]  DEFAULT (newid()) FOR [Guid]
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
USE [master]
GO
ALTER DATABASE [Vehicles] SET  READ_WRITE 
GO
