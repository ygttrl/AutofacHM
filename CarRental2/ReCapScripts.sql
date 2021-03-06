USE [master]
GO
/****** Object:  Database [RecapDb]    Script Date: 17.02.2021 13:01:46 ******/
CREATE DATABASE [RecapDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecapDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RecapDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RecapDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RecapDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RecapDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecapDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecapDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecapDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecapDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecapDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecapDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecapDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RecapDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecapDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecapDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecapDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecapDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecapDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecapDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecapDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecapDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RecapDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecapDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecapDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecapDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecapDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecapDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RecapDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecapDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RecapDb] SET  MULTI_USER 
GO
ALTER DATABASE [RecapDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecapDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecapDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecapDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RecapDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RecapDb] SET QUERY_STORE = OFF
GO
USE [RecapDb]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 17.02.2021 13:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 17.02.2021 13:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NULL,
	[ColorId] [int] NULL,
	[ModelYear] [datetime] NULL,
	[DailyPrice] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 17.02.2021 13:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 17.02.2021 13:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 17.02.2021 13:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RentDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.02.2021 13:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name]) VALUES (1, N'Hyundai')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (2, N'Audi')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (3, N'Mercedes')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (4, N'BMW')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (5, N'Wolkswagen')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (6, N'Seat')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (7, N'Renaılt')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (8, N'Fiat')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (9, N'Dodge')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (11, N'Opel')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (1, 1, 9, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(120000.00 AS Decimal(18, 2)), N'Hyundai i20')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (2, 2, 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime), CAST(180000.00 AS Decimal(18, 2)), N'Audi A3')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (5, 3, 2, CAST(N'2018-09-02T00:00:00.000' AS DateTime), CAST(1000000.00 AS Decimal(18, 2)), N'Mercedes-S')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (7, 3, 5, CAST(N'2015-09-30T00:00:00.000' AS DateTime), CAST(500000.00 AS Decimal(18, 2)), N'Mercedes AMG E')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (8, 4, 4, CAST(N'2020-04-27T00:00:00.000' AS DateTime), CAST(450000.00 AS Decimal(18, 2)), N'BMW M3')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (9, 4, 6, CAST(N'2021-12-15T00:00:00.000' AS DateTime), CAST(400000.00 AS Decimal(18, 2)), N'BMW M2')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (10, 4, 3, CAST(N'2020-12-30T00:00:00.000' AS DateTime), CAST(1200000.00 AS Decimal(18, 2)), N'BMW 760Li')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (11, 5, 1, CAST(N'2019-02-04T00:00:00.000' AS DateTime), CAST(128000.00 AS Decimal(18, 2)), N'GOLF 7')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (12, 5, 9, CAST(N'2020-08-05T00:00:00.000' AS DateTime), CAST(175000.00 AS Decimal(18, 2)), N'Transporter ')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (14, 5, 5, CAST(N'2016-03-02T00:00:00.000' AS DateTime), CAST(92000.00 AS Decimal(18, 2)), N'Passat Wagon')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (15, 6, 6, CAST(N'2020-04-05T00:00:00.000' AS DateTime), CAST(300000.00 AS Decimal(18, 2)), N'Leon')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (16, 6, 1, CAST(N'2018-03-02T00:00:00.000' AS DateTime), CAST(150000.00 AS Decimal(18, 2)), N'Cupra')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (17, 1, 5, CAST(N'2017-06-03T00:00:00.000' AS DateTime), CAST(140000.00 AS Decimal(18, 2)), N'Elentra')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (18, 7, 9, CAST(N'2005-09-28T00:00:00.000' AS DateTime), CAST(40000.00 AS Decimal(18, 2)), N'Clio')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (19, 7, 1, CAST(N'2020-12-25T00:00:00.000' AS DateTime), CAST(130000.00 AS Decimal(18, 2)), N'Clio')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (22, 8, 1, CAST(N'2016-05-02T00:00:00.000' AS DateTime), CAST(90000.00 AS Decimal(18, 2)), N'Egea')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (23, 8, 9, CAST(N'2018-06-28T00:00:00.000' AS DateTime), CAST(120000.00 AS Decimal(18, 2)), N'Doblo')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (24, 9, 3, CAST(N'2019-11-10T00:00:00.000' AS DateTime), CAST(850000.00 AS Decimal(18, 2)), N'Viper')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description]) VALUES (25, 9, 7, CAST(N'2008-11-02T00:00:00.000' AS DateTime), CAST(170000.00 AS Decimal(18, 2)), N'Avenger')
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'White')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Red')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Blue')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Green')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Black')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Orange')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Purple')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (8, N'Pink')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (9, N'Gery')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (11, N'Yellow')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (1, 1, N'AliCompany')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (2, 2, N'VeliCompany')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (3, 3, N'AyşeCompany')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (4, 4, N'MerveCompany')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (5, 5, N'HüseyinCompany')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (6, 6, N'FatmaCompany')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (7, 7, N'BerkeCompany')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (2, 1, 1, CAST(N'2021-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (3, 2, 3, CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(N'2021-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (4, 9, 6, CAST(N'2021-02-10T00:00:00.000' AS DateTime), CAST(N'2021-02-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (5, 22, 5, CAST(N'2021-02-11T00:00:00.000' AS DateTime), CAST(N'2021-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (6, 18, 4, CAST(N'2021-02-12T00:00:00.000' AS DateTime), CAST(N'2021-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (7, 24, 2, CAST(N'2021-02-09T00:00:00.000' AS DateTime), CAST(N'2021-02-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (8, 14, 5, CAST(N'2021-01-12T00:00:00.000' AS DateTime), CAST(N'2021-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (10, 10, 1, CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(N'2021-01-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rentals] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'Ali', N'Ünlü', N'ali.unlu@gmil.com', N'123')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'Veli', N'Hamza', N'veli.Hamza@gmil.com', N'123')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (3, N'Ayşe', N'Güven', N'ayse.guven@yahoo.com', N'123')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (4, N'Merve', N'Faruk', N'merve.faruk@gmail.com', N'123')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (5, N'Hüseyin', N'koçoglu', N'Hüseyin.kocoglu@gmail.com', N'123')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (6, N'Fatma', N'Dursun', N'Fatma.Dursun@hotmail.com', N'123')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (7, N'Berke', N'Canoğlu', N'berke.canoğlu@gmil.com', N'123')
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (8, N'İdil', N'Kiraz', N'idil.kiraz@gmil.com', N'123')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Car_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Car_Brand]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Car_Color] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Car_Color]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Cars] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Cars]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Customers]
GO
USE [master]
GO
ALTER DATABASE [RecapDb] SET  READ_WRITE 
GO
