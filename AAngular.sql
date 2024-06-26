USE [master]
GO
/****** Object:  Database [AAngular]    Script Date: 10-05-2024 19:39:41 ******/
CREATE DATABASE [AAngular]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AAngular', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AAngular.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AAngular_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AAngular_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AAngular] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AAngular].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AAngular] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AAngular] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AAngular] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AAngular] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AAngular] SET ARITHABORT OFF 
GO
ALTER DATABASE [AAngular] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AAngular] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AAngular] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AAngular] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AAngular] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AAngular] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AAngular] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AAngular] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AAngular] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AAngular] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AAngular] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AAngular] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AAngular] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AAngular] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AAngular] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AAngular] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AAngular] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AAngular] SET RECOVERY FULL 
GO
ALTER DATABASE [AAngular] SET  MULTI_USER 
GO
ALTER DATABASE [AAngular] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AAngular] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AAngular] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AAngular] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AAngular] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AAngular] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AAngular', N'ON'
GO
ALTER DATABASE [AAngular] SET QUERY_STORE = ON
GO
ALTER DATABASE [AAngular] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AAngular]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10-05-2024 19:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stockProducts]    Script Date: 10-05-2024 19:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stockProducts](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](max) NOT NULL,
	[createdDate] [datetime2](7) NULL,
	[Price] [float] NOT NULL,
	[productDetail] [nvarchar](max) NOT NULL,
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_stockProducts] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stockPurchase]    Script Date: 10-05-2024 19:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stockPurchase](
	[purchaseId] [int] IDENTITY(1,1) NOT NULL,
	[purchaseDate] [datetime2](7) NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[supplierName] [nvarchar](max) NOT NULL,
	[invoiceAmt] [float] NOT NULL,
	[invoiceNo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_stockPurchase] PRIMARY KEY CLUSTERED 
(
	[purchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stockSales]    Script Date: 10-05-2024 19:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stockSales](
	[salesId] [int] IDENTITY(1,1) NOT NULL,
	[invoiceNo] [nvarchar](max) NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[MobileNo] [int] NULL,
	[saledate] [datetime2](7) NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[totalAmt] [int] NOT NULL,
 CONSTRAINT [PK_stockSales] PRIMARY KEY CLUSTERED 
(
	[salesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stockTable]    Script Date: 10-05-2024 19:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stockTable](
	[stockId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[createdDate] [datetime2](7) NOT NULL,
	[updatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_stockTable] PRIMARY KEY CLUSTERED 
(
	[stockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10-05-2024 19:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [AAngular] SET  READ_WRITE 
GO
