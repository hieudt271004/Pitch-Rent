USE [master]
GO
/****** Object:  Database [football_rental]    Script Date: 7/13/2024 10:47:48 PM ******/
CREATE DATABASE [football_rental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'football_rental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\football_rental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'football_rental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\football_rental_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [football_rental] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [football_rental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [football_rental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [football_rental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [football_rental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [football_rental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [football_rental] SET ARITHABORT OFF 
GO
ALTER DATABASE [football_rental] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [football_rental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [football_rental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [football_rental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [football_rental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [football_rental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [football_rental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [football_rental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [football_rental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [football_rental] SET  ENABLE_BROKER 
GO
ALTER DATABASE [football_rental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [football_rental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [football_rental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [football_rental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [football_rental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [football_rental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [football_rental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [football_rental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [football_rental] SET  MULTI_USER 
GO
ALTER DATABASE [football_rental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [football_rental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [football_rental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [football_rental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [football_rental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [football_rental] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [football_rental] SET QUERY_STORE = ON
GO
ALTER DATABASE [football_rental] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [football_rental]
GO
/****** Object:  Table [dbo].[equipment]    Script Date: 7/13/2024 10:47:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipment](
	[equipment_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_name] [varchar](100) NULL,
	[img] [varchar](100) NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipment_orders]    Script Date: 7/13/2024 10:47:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipment_orders](
	[equipment_order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[equipment_id] [int] NULL,
	[quantity] [int] NULL,
	[order_date] [datetime] NULL,
	[total_amount] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipment_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[field_orders]    Script Date: 7/13/2024 10:47:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_orders](
	[field_order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[field_time_id] [int] NULL,
	[order_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[field_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[field_time]    Script Date: 7/13/2024 10:47:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field_time](
	[field_time_id] [int] IDENTITY(1,1) NOT NULL,
	[field_id] [int] NULL,
	[start_time] [nvarchar](50) NULL,
	[end_time] [nvarchar](50) NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[field_time_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fields]    Script Date: 7/13/2024 10:47:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fields](
	[field_id] [int] IDENTITY(1,1) NOT NULL,
	[field_name] [varchar](100) NULL,
	[location] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[field_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food_items]    Script Date: 7/13/2024 10:47:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_items](
	[food_id] [int] IDENTITY(1,1) NOT NULL,
	[food_name] [varchar](100) NULL,
	[img] [varchar](255) NULL,
	[price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[food_orders]    Script Date: 7/13/2024 10:47:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food_orders](
	[food_order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[food_id] [int] NULL,
	[quantity] [int] NULL,
	[total_amount] [decimal](10, 2) NULL,
	[order_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[food_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/13/2024 10:47:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[address] [varchar](255) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[equipment] ON 

INSERT [dbo].[equipment] ([equipment_id], [equipment_name], [img], [price]) VALUES (1, N'Football', N'giay.jpg', CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([equipment_id], [equipment_name], [img], [price]) VALUES (2, N'Goalkeeper Gloves', N'giay.jpg', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([equipment_id], [equipment_name], [img], [price]) VALUES (3, N'Football Boots', N'giay.jpg', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([equipment_id], [equipment_name], [img], [price]) VALUES (4, N'Shin Guards', N'giay.jpg', CAST(700.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([equipment_id], [equipment_name], [img], [price]) VALUES (5, N'Football Jersey', N'giay.jpg', CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([equipment_id], [equipment_name], [img], [price]) VALUES (6, N'Football Shorts', N'giay.jpg', CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[equipment] ([equipment_id], [equipment_name], [img], [price]) VALUES (7, N'Football Socks', N'giay.jpg', CAST(4000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[equipment_orders] ON 

INSERT [dbo].[equipment_orders] ([equipment_order_id], [customer_id], [equipment_id], [quantity], [order_date], [total_amount]) VALUES (11, 2, 1, 1, CAST(N'2024-07-13T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[equipment_orders] ([equipment_order_id], [customer_id], [equipment_id], [quantity], [order_date], [total_amount]) VALUES (12, 2, 2, 2, CAST(N'2024-07-13T00:00:00.000' AS DateTime), CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[equipment_orders] ([equipment_order_id], [customer_id], [equipment_id], [quantity], [order_date], [total_amount]) VALUES (13, 2, 3, 2, CAST(N'2024-07-13T00:00:00.000' AS DateTime), CAST(1000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[equipment_orders] OFF
GO
SET IDENTITY_INSERT [dbo].[field_orders] ON 

INSERT [dbo].[field_orders] ([field_order_id], [customer_id], [field_time_id], [order_date]) VALUES (30, 2, 1, CAST(N'2024-07-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[field_orders] OFF
GO
SET IDENTITY_INSERT [dbo].[field_time] ON 

INSERT [dbo].[field_time] ([field_time_id], [field_id], [start_time], [end_time], [price]) VALUES (1, 1, N'8:00 AM', N'10:00 AM', CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[field_time] ([field_time_id], [field_id], [start_time], [end_time], [price]) VALUES (2, 1, N'10:00 AM', N'12:00 AM', CAST(60000.00 AS Decimal(10, 2)))
INSERT [dbo].[field_time] ([field_time_id], [field_id], [start_time], [end_time], [price]) VALUES (3, 1, N'13:00 PM', N'15:00 PM', CAST(80000.00 AS Decimal(10, 2)))
INSERT [dbo].[field_time] ([field_time_id], [field_id], [start_time], [end_time], [price]) VALUES (4, 1, N'15:00 PM', N'17:00 PM', CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[field_time] ([field_time_id], [field_id], [start_time], [end_time], [price]) VALUES (5, 2, N'8:00 AM', N'10:00 AM', CAST(600000.00 AS Decimal(10, 2)))
INSERT [dbo].[field_time] ([field_time_id], [field_id], [start_time], [end_time], [price]) VALUES (6, 2, N'10:00 AM', N'12:00 AM', CAST(600000.00 AS Decimal(10, 2)))
INSERT [dbo].[field_time] ([field_time_id], [field_id], [start_time], [end_time], [price]) VALUES (7, 2, N'13:00 PM', N'15:00 PM', CAST(700001.00 AS Decimal(10, 2)))
INSERT [dbo].[field_time] ([field_time_id], [field_id], [start_time], [end_time], [price]) VALUES (8, 2, N'15:00 PM', N'17:00 PM ', CAST(100000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[field_time] OFF
GO
SET IDENTITY_INSERT [dbo].[fields] ON 

INSERT [dbo].[fields] ([field_id], [field_name], [location]) VALUES (1, N'Sân 1', N'Ha Noi')
INSERT [dbo].[fields] ([field_id], [field_name], [location]) VALUES (2, N'Sân 2', N'Ha Nam')
SET IDENTITY_INSERT [dbo].[fields] OFF
GO
SET IDENTITY_INSERT [dbo].[food_items] ON 

INSERT [dbo].[food_items] ([food_id], [food_name], [img], [price]) VALUES (1, N'Water', N'water.jpg', CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[food_items] ([food_id], [food_name], [img], [price]) VALUES (2, N'Snack', N'snack.jpg', CAST(40000.00 AS Decimal(10, 2)))
INSERT [dbo].[food_items] ([food_id], [food_name], [img], [price]) VALUES (3, N'Ice', N'ice.jpg', CAST(50000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[food_items] OFF
GO
SET IDENTITY_INSERT [dbo].[food_orders] ON 

INSERT [dbo].[food_orders] ([food_order_id], [customer_id], [food_id], [quantity], [total_amount], [order_date]) VALUES (15, 2, 1, 2, CAST(60000.00 AS Decimal(10, 2)), CAST(N'2024-07-13T00:00:00.000' AS DateTime))
INSERT [dbo].[food_orders] ([food_order_id], [customer_id], [food_id], [quantity], [total_amount], [order_date]) VALUES (16, 2, 2, 2, CAST(80000.00 AS Decimal(10, 2)), CAST(N'2024-07-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[food_orders] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [password], [phone], [email], [address], [role]) VALUES (1, N'admin', N'123', N'123456', N'admin@gmail.com', N'HN', 1)
INSERT [dbo].[users] ([user_id], [username], [password], [phone], [email], [address], [role]) VALUES (2, N'pp', N'123', N'123456', N'pp@fpt', N'HN', 2)
INSERT [dbo].[users] ([user_id], [username], [password], [phone], [email], [address], [role]) VALUES (3, N'pp1', N'123', N'123456', N'pp1@fpt', N'HN', 3)
INSERT [dbo].[users] ([user_id], [username], [password], [phone], [email], [address], [role]) VALUES (4, N'pp', N'ppp', N'ppp', N'pppp@gmail.com', N'ppp', 2)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[equipment_orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[equipment_orders]  WITH CHECK ADD FOREIGN KEY([equipment_id])
REFERENCES [dbo].[equipment] ([equipment_id])
GO
ALTER TABLE [dbo].[field_orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[field_orders]  WITH CHECK ADD FOREIGN KEY([field_time_id])
REFERENCES [dbo].[field_time] ([field_time_id])
GO
ALTER TABLE [dbo].[field_time]  WITH CHECK ADD FOREIGN KEY([field_id])
REFERENCES [dbo].[fields] ([field_id])
GO
ALTER TABLE [dbo].[food_orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[food_orders]  WITH CHECK ADD FOREIGN KEY([food_id])
REFERENCES [dbo].[food_items] ([food_id])
GO
USE [master]
GO
ALTER DATABASE [football_rental] SET  READ_WRITE 
GO
