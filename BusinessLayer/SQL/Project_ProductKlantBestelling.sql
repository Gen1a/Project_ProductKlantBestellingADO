USE [master]
GO
/****** Object:  Database [Project_ProductKlantBestelling]    Script Date: 9/01/2021 11:47:42 ******/
CREATE DATABASE [Project_ProductKlantBestelling]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_ProductKlantBestelling', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project_ProductKlantBestelling.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_ProductKlantBestelling_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project_ProductKlantBestelling_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_ProductKlantBestelling].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET RECOVERY FULL 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET  MULTI_USER 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project_ProductKlantBestelling', N'ON'
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET QUERY_STORE = OFF
GO
USE [Project_ProductKlantBestelling]
GO
/****** Object:  Table [dbo].[Bestelling]    Script Date: 9/01/2021 11:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bestelling](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[KlantId] [bigint] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Betaald] [bit] NOT NULL,
	[Prijs] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klant]    Script Date: 9/01/2021 11:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klant](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Naam] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/01/2021 11:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Naam] [nvarchar](100) NOT NULL,
	[Prijs] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Bestelling]    Script Date: 9/01/2021 11:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Bestelling](
	[productId] [bigint] NOT NULL,
	[bestellingId] [bigint] NOT NULL,
	[aantal] [int] NOT NULL,
 CONSTRAINT [PK_Product_Bestelling] PRIMARY KEY CLUSTERED 
(
	[productId] ASC,
	[bestellingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Klant] ON 

INSERT [dbo].[Klant] ([Id], [Naam], [Adres]) VALUES (1, N'Frederik', N'Teststraat')
INSERT [dbo].[Klant] ([Id], [Naam], [Adres]) VALUES (2, N'Amber', N'Aalstraat')
INSERT [dbo].[Klant] ([Id], [Naam], [Adres]) VALUES (3, N'Pieter', N'Pieterstraat')
INSERT [dbo].[Klant] ([Id], [Naam], [Adres]) VALUES (4, N'Elena', N'Geraardsbergsesteenweg')
SET IDENTITY_INSERT [dbo].[Klant] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Naam], [Prijs]) VALUES (1, N'Jupiler', CAST(1.50 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [Naam], [Prijs]) VALUES (2, N'Hoegaarden', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [Naam], [Prijs]) VALUES (3, N'Leffe', CAST(1.80 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [Naam], [Prijs]) VALUES (4, N'Westmalle', CAST(1.90 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Bestelling]  WITH CHECK ADD  CONSTRAINT [FK_Bestelling_Klant] FOREIGN KEY([KlantId])
REFERENCES [dbo].[Klant] ([Id])
GO
ALTER TABLE [dbo].[Bestelling] CHECK CONSTRAINT [FK_Bestelling_Klant]
GO
ALTER TABLE [dbo].[Product_Bestelling]  WITH CHECK ADD  CONSTRAINT [FK_Product_Bestelling_Bestelling] FOREIGN KEY([bestellingId])
REFERENCES [dbo].[Bestelling] ([Id])
GO
ALTER TABLE [dbo].[Product_Bestelling] CHECK CONSTRAINT [FK_Product_Bestelling_Bestelling]
GO
ALTER TABLE [dbo].[Product_Bestelling]  WITH CHECK ADD  CONSTRAINT [FK_Product_Bestelling_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Product_Bestelling] CHECK CONSTRAINT [FK_Product_Bestelling_Product]
GO
USE [master]
GO
ALTER DATABASE [Project_ProductKlantBestelling] SET  READ_WRITE 
GO
