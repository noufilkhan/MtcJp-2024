USE [master]
GO
/****** Object:  Database [Vehicles]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Consignee]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Entity]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Prompt Values]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Sales]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Security Group]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Stock]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Stock Addtional Cost]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Stock Documents]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[Stock Images]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[User Info]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[User Security Group]    Script Date: 1/8/2024 10:09:00 PM ******/
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
/****** Object:  Table [dbo].[User Session]    Script Date: 1/8/2024 10:09:00 PM ******/
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
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (1, 1, N'noufil', 0xEAF86B65F2A69EFC871AF5283BA907972865504B96F17A4AFE77797F2EB695D77500E5309E6BC657E818F0E948CABF7AAE868BBF8E0654B044A1AB3A4953D5B9, 0x016C756538CF81398F4E7EF90BA41372ED1EA803BA9C67A04F6CDD2EF70B16B98DCADE37F89E463BAA463C094062D933E12FFFB969763281820F3A1CA785231553B92010B5AA37F959972091F9D74DD7F4678C8347E7E538B6D8853C3A6CCCC4C9CBA0A98BCCD9CD66DC3D922DDC7DB759A8D77B4757F83C96283F5DC598276A, N'Noufil', N'', N'Khan', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-08T20:55:59.987' AS DateTime), CAST(N'2024-01-08T20:55:59.987' AS DateTime), N'', N'92EA8842-B698-408F-AA4D-1176A100020C')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (2, 2, N'faaz', 0xF9BA827E2A7C75FF21A366AD557BD4908504AC93BA872977DE97F64B97E10CA8DACEF210A8CC19F022212305E9EBD89387A93E73F6F3644DDA316B681DE1AD0C, 0x6EE01CAF7563602CA9DDD547A2C1B15410C236E230434949F78D912CCF63FEF7090673F858DF6C1E25E0BFBE94AF85AB9B9964FFB7F6EF836F26F71BA4376DC619C7FB537A212D83D3D704090C85030D85F6FBE4FB5D0186BA8FBE8217DD599A77536B0F86198B9D321D6A1C2E9EBF1096274A71956CF6334C5C1641D39A7EA2, N'Faaz', N'', N'Khan', N'faaz@live.net', N'+9234330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-08T20:55:31.603' AS DateTime), CAST(N'2024-01-08T20:55:31.603' AS DateTime), N'', N'CEA54C7B-1A43-428E-80EF-C285421488BD')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (3, 2, N'lisa', 0xBB44FC52BED59E3325D82CF6D1A703F64F8188B8F01104C72A42CAF82CF37D0BBE0F6C28F1AD9D80F3AF4A3F32DE2FF01F0C1B722110CFF5A1D6FF4195D275F4, 0x2F545A1293BCFD853FEFB458BC73BBA87C7C09DAB2279032419F324FFDD9778714B3154D624F58F152D46410E2D91FB5C4AB22592680C447E9132600D1AA9BA6672903C34A15E89D840CFBF71D09DEA27E9AFE12FE001E09982CDC07E48F6105654F3D5C00E43A050E730E104BDB11C48F7ECE3CBF356F9B3ED7815C79842EAB, N'Noufil', N'', N'Khan', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-08T20:54:34.523' AS DateTime), CAST(N'2024-01-08T20:54:34.523' AS DateTime), N'', N'2B8E073B-7724-4F3B-957F-FA7EAB3805BA')
GO
INSERT [dbo].[User Info] ([User Id], [Entity], [Username], [Password Halt], [Password Salt], [First Name], [Middle Name], [Last Name], [Email Address], [Contact Info], [City], [Country], [Language], [Created By], [Created Date], [Last Modified Date], [Last Modified By], [Guid]) VALUES (8, 2, N'mark', 0x2CC72440023D7D10B9FFD57741A16E19E3C20257794CA01136D3CD223A574F8225E44995F7D003C34D613498839B31669EF4A42FFE1673BFCC068FC6DA89BE5C, 0xB7DA586313002C8DC817F303A3FF21085B671F2C3DE629925849BEC25D62D62953950DB1F0D5A391BC27C345B411678242101AB92E01E866DFDF27525A5677AEBFF8057FA845FC1383A2CECA5FFA76D3B7E45429F1E0AD150DBA8DA0057F3DDB6BC4C725336CBAE5931DB32E54D18B26174B4A4B6AA27604A00898AAA8B1DC84, N'Noufil', N'', N'Khan', N'noufil@aanass.net', N'+97334330829', N'Karachi', N'Pakistan', N'English', N'Audit', CAST(N'2024-01-08T21:54:08.560' AS DateTime), CAST(N'2024-01-08T21:54:08.560' AS DateTime), N'', N'3276E790-BDFF-4AB6-BCB1-AA49D3DFB2C8')
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
USE [master]
GO
ALTER DATABASE [Vehicles] SET  READ_WRITE 
GO
