USE [master]
GO
/****** Object:  Database [ShoesStoreManagement]    Script Date: 09/03/2023 11:34:59 PM ******/
CREATE DATABASE [ShoesStoreManagement]

GO
ALTER DATABASE [ShoesStoreManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoesStoreManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoesStoreManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoesStoreManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoesStoreManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoesStoreManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoesStoreManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoesStoreManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ShoesStoreManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoesStoreManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoesStoreManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoesStoreManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoesStoreManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoesStoreManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoesStoreManagement', N'ON'
GO
ALTER DATABASE [ShoesStoreManagement] SET QUERY_STORE = OFF
GO
USE [ShoesStoreManagement]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 09/03/2023 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
	[token] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 09/03/2023 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NULL,
 CONSTRAINT [PK__Categori__27638D74F7253F7E] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 09/03/2023 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[FID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 09/03/2023 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrdDate] [date] NULL,
	[shipdate] [date] NULL,
	[status] [int] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 09/03/2023 11:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [nvarchar](255) NULL,
	[price] [int] NULL,
	[imgPath] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[status] [int] NULL,
	[CateID] [int] NULL,
 CONSTRAINT [PK__Products__C57755205DDC388D] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (1, N'user', N'user', N'user', N'02165468415', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (2, N'admin', N'admin', N'admin1', N'021321312321', 1, 1, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (3, N'xayike4012@maazios.com', N'NMvqMlQI', N'dsadas', N'21321312', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (4, N'yavayak120@gpipes.com', N'ZAtH2fcT', N'213213', N'2131321', 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1, N'Running')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (2, N'Basketball')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (3, N'Hiking')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (4, N'Sandals')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (5, N'Boots')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (6, N'Skateboarding')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (7, N'Oxford')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (8, N'High heels')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (9, N'Slip-on')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (1, 1, 1, 3)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (3, 1, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (4, 2, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (5, 2, 7, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (6, 2, 8, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (7, 3, 10, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (8, 4, 6, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (9, 5, 4, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (10, 5, 5, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (11, 6, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (12, 6, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (13, 7, 4, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (14, 7, 7, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (15, 7, 8, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (16, 7, 9, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (17, 8, 6, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (18, 9, 5, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (19, 10, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (20, 10, 7, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (21, 11, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (22, 12, 2, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (23, 13, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (24, 14, 3, 3)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (25, 15, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (26, 15, 2, 3)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (27, 16, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (1, CAST(N'2023-02-20' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (2, CAST(N'2023-02-21' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (3, CAST(N'2023-02-22' AS Date), NULL, 2, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (4, CAST(N'2023-02-23' AS Date), NULL, 2, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (5, CAST(N'2023-02-24' AS Date), NULL, 2, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (6, CAST(N'2023-02-25' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (7, CAST(N'2023-02-19' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (8, CAST(N'2023-02-17' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (9, CAST(N'2023-02-18' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (10, CAST(N'2023-02-16' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (11, CAST(N'2023-02-28' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (12, CAST(N'2023-02-28' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (13, CAST(N'2023-02-28' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (14, CAST(N'2023-02-28' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (15, CAST(N'2023-03-02' AS Date), NULL, 1, 2)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (16, CAST(N'2023-03-02' AS Date), NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (1, N'Nike Revolution 6', 2100000, N'images/revolution-6-running-shoes-5k6Jh6.jpg', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 1)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (2, N'Nike MC Trainer', 1200000, N'images/mc-trainer-training-shoe-T9vmbZ.png', N'The Nike MC Trainer helps you transition from heavy lifting in the weight room to agility drills on the turf without skipping a beat.', 1, 7)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (3, N'Nike Air Max Alpha Trainer 4', 1210000, N'images/air-max-alpha-trainer-4-training-shoe-phsD5s.png', N'Tackle your most intense workouts in the Nike Air Max Alpha Trainer 4. The wide, flat base with Nike Air cushioning gives you comfortable stability for lifting. ', 1, 1)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (4, N'Nike Vaporfly 2', 1000000, N'images/0fe8e64a-6c6e-4779-9758-c440a25c09f9.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 1)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (5, N'Nike Air Zoom Rival Fly 3', 990000, N'images/7f3d19e6-a3b8-49be-959f-4d734aec99a3.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 1)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (6, N'Zion 2 PF', 560000, N'images/544603ac-af2f-440d-b80c-7a914146d56c.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 2)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (7, N'KD15 EP', 428000, N'images/68d0228a-eb7d-4078-ab50-d9382854178c.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 8)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (8, N'Air Jordan XXXVII PF', 123000, N'images/lebron-xx-christmas-ep-basketball-shoes-ffXW69.jpg', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 2)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (9, N'Nike Renew Elevate 3', 258000, N'images/7f84ce7f-e4ed-4764-b503-6d2ceb80136c.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 2)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (10, N'Nike Air Zoom G.T. Jump', 689200, N'images/air-jordan-xxxvi-se-basketball-shoe-LG8Xx7.jpg', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 2)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (11, N'Nike Precision 6 FlyEase', 32000, N'images/1f34f86d-4aa8-43d4-9d9c-b7a9e217dc0b.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 3)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (12, N'Luka 1 PF', 12000, N'images/0cdbe85c-dab0-44be-a5bc-d8cae99c6762.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 3)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (13, N'Air Jordan XXXVII Low PF', 11000, N'images/c493f688-cefd-4616-996c-a8b0a82ee1e8.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 9)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (15, N'Nike Precision 6 FlyEase', 55500, N'images/4c92e877-8edf-4eac-9a9b-4ab5d613c4ce.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 3)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (16, N'Nike Renew Elevate 3', 66000, N'images/93c2ef70-4c17-4bcd-b67d-a70e638126ee.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (17, N'Jordan Stay Loyal 2', 69000, N'images/lebron-witness-7-ep-basketball-shoes-FKPXCg.jpg', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (18, N'LeBron Witness 7 EP', 76000, N'images/bc392cad-1bcb-43ee-a062-200f45ef86f5.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (19, N'Nike Air Max Impact 4', 12000, N'images/03055781-756c-4e1e-88d7-a3b82048d583.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (20, N'Kyrie Low 5 EP', 30000, N'images/8607de14-b1d3-4ff9-a5ba-e860b5e72ad5.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 4)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (21, N'Nike Precision 6', 20000, N'images/ee48dae2-09a7-4ab4-9caf-a4ebefdf9c20.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 5)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (22, N'Zoom Freak 4 ''Greek Coastline''', 25000, N'images/a211ad68-32b6-4434-99d0-10dad0d23626.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 5)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (23, N'Nike Air Deldon ''Together We Fly''', 13000, N'images/eff463cd-43fc-4380-954a-839f8f76ccc7.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 5)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (24, N'Zoom Freak 4', 5000, N'images/f8801885-168b-428d-b4eb-0e37d0e04408.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 5)
GO
INSERT [dbo].[Products] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (25, N'LeBron XX Christmas EP', 9000, N'images/8a735b0f-86c2-4935-9a22-c4eabc6e2e72.webp', N'Comfort is the key to your running routine.Made from at least 20% recycled content by weight, this version features touchpoints at the heel and tongue for easy on and off.', 1, 5)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E61642F10C64C]    Script Date: 09/03/2023 11:34:59 PM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDetail__FID__2E1BDC42] FOREIGN KEY([FID])
REFERENCES [dbo].[Products] ([PID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDetail__FID__2E1BDC42]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__CateID__300424B4] FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__CateID__300424B4]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK__Products__price__34C8D9D1] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK__Products__price__34C8D9D1]
GO
USE [master]
GO
ALTER DATABASE [ShoesStoreManagement] SET  READ_WRITE 
GO
