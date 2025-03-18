USE [master]
GO
/****** Object:  Database [DB_GroceryStore]    Script Date: 3/19/2025 1:16:13 AM ******/
CREATE DATABASE [DB_GroceryStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_GroceryStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HAIANH\MSSQL\DATA\DB_GroceryStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_GroceryStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.HAIANH\MSSQL\DATA\DB_GroceryStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_GroceryStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_GroceryStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_GroceryStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_GroceryStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_GroceryStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_GroceryStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_GroceryStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_GroceryStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_GroceryStore] SET  MULTI_USER 
GO
ALTER DATABASE [DB_GroceryStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_GroceryStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_GroceryStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_GroceryStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_GroceryStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_GroceryStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_GroceryStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_GroceryStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_GroceryStore]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/19/2025 1:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category__id] [int] IDENTITY(1,1) NOT NULL,
	[category__name] [nvarchar](30) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category__id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/19/2025 1:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order__id] [int] NOT NULL,
	[product__id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unit__price] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/19/2025 1:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order__id] [int] IDENTITY(1,1) NOT NULL,
	[user__id] [int] NOT NULL,
	[order__date] [date] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order__id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/19/2025 1:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product__id] [int] IDENTITY(1,1) NOT NULL,
	[product__name] [nvarchar](30) NOT NULL,
	[supplier__id] [int] NOT NULL,
	[category__id] [int] NOT NULL,
	[quantity__per__unit] [nvarchar](20) NOT NULL,
	[unit__price] [float] NOT NULL,
	[unit__in__stock] [int] NOT NULL,
	[quantity__sold] [int] NOT NULL,
	[star__rating] [tinyint] NOT NULL,
	[image] [varchar](max) NOT NULL,
	[describe] [nvarchar](max) NOT NULL,
	[release__date] [date] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product__id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/19/2025 1:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplier__id] [int] IDENTITY(1,1) NOT NULL,
	[company__name] [varchar](50) NOT NULL,
	[contact__name] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[supplier__id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tokenForgetPassword]    Script Date: 3/19/2025 1:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tokenForgetPassword](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token] [varchar](255) NOT NULL,
	[isUsed] [bit] NOT NULL,
	[userId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/19/2025 1:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user__id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[role] [bit] NOT NULL,
	[balance] [float] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user__id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([category__id], [category__name], [description]) VALUES (1, N'Dairy', N'Products made from milk')
GO
INSERT [dbo].[Categories] ([category__id], [category__name], [description]) VALUES (2, N'Pantry', N'Shelf-stable food items')
GO
INSERT [dbo].[Categories] ([category__id], [category__name], [description]) VALUES (3, N'Meat', N'Various types of meat')
GO
INSERT [dbo].[Categories] ([category__id], [category__name], [description]) VALUES (4, N'Fruits', N'Edible plant fruits')
GO
INSERT [dbo].[Categories] ([category__id], [category__name], [description]) VALUES (5, N'Vegetables', N'Edible plant vegetables')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[OrderDetails] ([order__id], [product__id], [quantity], [unit__price]) VALUES (94, 3, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([order__id], [product__id], [quantity], [unit__price]) VALUES (95, 7, 1, 6)
GO
INSERT [dbo].[OrderDetails] ([order__id], [product__id], [quantity], [unit__price]) VALUES (95, 9, 1, 9)
GO
INSERT [dbo].[OrderDetails] ([order__id], [product__id], [quantity], [unit__price]) VALUES (96, 6, 3, 5)
GO
INSERT [dbo].[OrderDetails] ([order__id], [product__id], [quantity], [unit__price]) VALUES (97, 3, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([order__id], [product__id], [quantity], [unit__price]) VALUES (101, 3, 12, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([order__id], [user__id], [order__date]) VALUES (94, 5, CAST(N'2025-02-16' AS Date))
GO
INSERT [dbo].[Orders] ([order__id], [user__id], [order__date]) VALUES (95, 5, CAST(N'2025-02-16' AS Date))
GO
INSERT [dbo].[Orders] ([order__id], [user__id], [order__date]) VALUES (96, 5, CAST(N'2025-01-18' AS Date))
GO
INSERT [dbo].[Orders] ([order__id], [user__id], [order__date]) VALUES (97, 19, CAST(N'2025-01-18' AS Date))
GO
INSERT [dbo].[Orders] ([order__id], [user__id], [order__date]) VALUES (98, 19, CAST(N'2025-04-18' AS Date))
GO
INSERT [dbo].[Orders] ([order__id], [user__id], [order__date]) VALUES (99, 19, CAST(N'2025-05-18' AS Date))
GO
INSERT [dbo].[Orders] ([order__id], [user__id], [order__date]) VALUES (100, 19, CAST(N'2025-06-18' AS Date))
GO
INSERT [dbo].[Orders] ([order__id], [user__id], [order__date]) VALUES (101, 19, CAST(N'2025-03-18' AS Date))
GO
INSERT [dbo].[Orders] ([order__id], [user__id], [order__date]) VALUES (102, 19, CAST(N'2025-03-18' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (1, N'Cherry', 7, 4, N'1 piece', 5, 30, 10, 5, N'images/products/z6419922659253_60f7a5127fc2f716e6ef9a8a9946465d.jpg', N'delicious', CAST(N'2025-03-18' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (3, N'Banana', 6, 4, N'1 bunch', 1, 85, 65, 5, N'images/products/product-1-1.jpg', N'Fresh organic bananas', CAST(N'2025-03-01' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (4, N'Tomatoes', 10, 5, N'1 kg', 3, 80, 40, 5, N'images/products/product-1-2.jpg', N'Red ripe tomatoes', CAST(N'2025-03-02' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (5, N'Bread', 8, 2, N'1 loaf', 2, 60, 30, 5, N'images/products/product-1-3.jpg', N'Whole grain bread', CAST(N'2025-03-01' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (6, N'Apples', 7, 4, N'1 kg', 5, 87, 48, 5, N'images/products/product-1-4.jpg', N'Juicy red apples', CAST(N'2025-03-01' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (7, N'Olive Oil', 10, 3, N'500ml bottle', 6, 50, 20, 5, N'images/products/product-1-5.jpg', N'Extra virgin olive oil', CAST(N'2025-03-03' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (8, N'Eggs', 6, 1, N'12 eggs', 4, 70, 35, 5, N'images/products/product-1-6.jpg', N'Farm fresh eggs', CAST(N'2025-03-01' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (9, N'Honey', 10, 3, N'500g jar', 9, 40, 15, 5, N'images/products/product-1-7.jpg', N'Pure organic honey', CAST(N'2025-03-02' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (10, N'Onions', 9, 5, N'1 kg', 2, 100, 50, 5, N'images/products/product-1-8.jpg', N'Fresh onions', CAST(N'2025-03-01' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (11, N'Cabbage', 9, 5, N'1 head', 3, 80, 40, 5, N'images/products/product-1-9.jpg', N'Green cabbage', CAST(N'2025-03-01' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (20, N'Mangosteen', 7, 4, N'1 piece', 5, 30, 10, 5, N'images/products/z6419922637706_13ff70cc436b0acd99dd46375d845056.jpg', N'delicious', CAST(N'2025-03-18' AS Date))
GO
INSERT [dbo].[Products] ([product__id], [product__name], [supplier__id], [category__id], [quantity__per__unit], [unit__price], [unit__in__stock], [quantity__sold], [star__rating], [image], [describe], [release__date]) VALUES (21, N'Mango', 7, 4, N'1 piece', 5, 30, 10, 5, N'images/products/z6419922637734_b510436d666c46c2500ddc3234264398.jpg', N'delicious', CAST(N'2025-03-18' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (6, N'Fresh Dairy Co.', N'Michael Johnson', N'123-456-7890')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (7, N'Pantry Essentials Ltd.', N'Alice Johnson', N'234-567-8901')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (8, N'Prime Meat Supplies', N'Robert Brown', N'345-678-9012')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (9, N'Tropical Fruits Inc.', N'Maria Davis', N'456-789-0123')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (10, N'Green Veggies Market', N'William Martinez', N'567-890-1234')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (11, N'ABC Corp', N'John Doe', N'123-456-7890')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (12, N'XYZ Ltd', N'Jane Smith', N'987-654-3210')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (13, N'Global Supplies', N'Michael Johnson', N'555-123-4567')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (14, N'TechWorld', N'Emily Davis', N'444-987-6543')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (15, N'SuperMart', N'William Brown', N'333-222-1111')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (16, N'Fresh Foods', N'Olivia Wilson', N'666-777-8888')
GO
INSERT [dbo].[Suppliers] ([supplier__id], [company__name], [contact__name], [phone]) VALUES (17, N'Quick Logistics', N'James Anderson', N'999-888-7777')
GO
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([user__id], [username], [fullname], [password], [email], [address], [phone], [role], [balance]) VALUES (3, N'user03', N'Phạm Văn C', N'pass789', N'user03@gmail.com', N'Đà Nẵng', N'0909876543', 0, 250000)
GO
INSERT [dbo].[Users] ([user__id], [username], [fullname], [password], [email], [address], [phone], [role], [balance]) VALUES (4, N'user04', N'Lê Thị Daaaaa', N'abc', N'user04@gmail.com', N'Cần Thơ', N'0922334455', 1, 300000.25)
GO
INSERT [dbo].[Users] ([user__id], [username], [fullname], [password], [email], [address], [phone], [role], [balance]) VALUES (5, N'user05', N'Hoàng Minh E', N'pass202', N'user05@gmail.com', N'Hải Phòng', N'0933445566', 1, 600000.1)
GO
INSERT [dbo].[Users] ([user__id], [username], [fullname], [password], [email], [address], [phone], [role], [balance]) VALUES (6, N'user06', N'Đoàn Hữu F', N'pass303', N'user06@gmail.com', N'Huế', N'0944556677', 1, 120000)
GO
INSERT [dbo].[Users] ([user__id], [username], [fullname], [password], [email], [address], [phone], [role], [balance]) VALUES (10, N'user10', N'Trịnh Hiền J', N'pass707', N'user10@gmail.com', N'Đồng Nai', N'0988990011', 1, 950000.6)
GO
INSERT [dbo].[Users] ([user__id], [username], [fullname], [password], [email], [address], [phone], [role], [balance]) VALUES (16, N'david_miller', N'David Miller', N'adminPass789', N'david.miller@example.com', N'303 Cedar Ln, North Haverbrook', N'555-8642', 1, 150)
GO
INSERT [dbo].[Users] ([user__id], [username], [fullname], [password], [email], [address], [phone], [role], [balance]) VALUES (18, N'charles_lee', N'Charles Lee', N'password1234', N'charles.lee@example.com', N'505 Redwood Dr, Shelbyville', N'555-6421', 1, 500)
GO
INSERT [dbo].[Users] ([user__id], [username], [fullname], [password], [email], [address], [phone], [role], [balance]) VALUES (19, N'bluebear', N'MinhNhat', N'12', N'ngaidang53@gmail.com', N'Thai Nguyen', N'0933789345', 0, 2500000)
GO
INSERT [dbo].[Users] ([user__id], [username], [fullname], [password], [email], [address], [phone], [role], [balance]) VALUES (31, N'na', N'NgocAnh', N'abcc1', N'pdphamngocanh@gmail.com', N'Thai Nguyen', N'123456833', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_User]    Script Date: 3/19/2025 1:16:14 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UC_User] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([order__id])
REFERENCES [dbo].[Orders] ([order__id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([product__id])
REFERENCES [dbo].[Products] ([product__id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([user__id])
REFERENCES [dbo].[Users] ([user__id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category__id])
REFERENCES [dbo].[Categories] ([category__id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([supplier__id])
REFERENCES [dbo].[Suppliers] ([supplier__id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[tokenForgetPassword]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([user__id])
GO
USE [master]
GO
ALTER DATABASE [DB_GroceryStore] SET  READ_WRITE 
GO
