USE [asm_gd_final]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 6/25/2021 12:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](255) NOT NULL,
	[activated] [bit] NOT NULL,
	[admin] [bit] NOT NULL,
	[email] [varchar](255) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[photo] [varchar](255) NULL,
 CONSTRAINT [PK__accounts__F3DBC573A52BAFE0] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/25/2021 12:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK__categori__3213E83FEEC10F63] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 6/25/2021 12:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderid] [bigint] NULL,
	[productid] [int] NULL,
	[city] [nvarchar](255) NULL,
	[country] [nvarchar](255) NULL,
	[fullname] [nvarchar](255) NULL,
 CONSTRAINT [PK__orderdet__3213E83F3B7F4740] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/25/2021 12:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[createdate] [date] NULL,
	[username] [varchar](255) NULL,
	[phone] [int] NULL,
	[email] [varchar](255) NULL,
 CONSTRAINT [PK__orders__3213E83FD8189C2B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/25/2021 12:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[createdate] [date] NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[categoryid] [varchar](255) NULL,
	[image1] [varchar](255) NULL,
	[image2] [varchar](255) NULL,
	[sale] [float] NULL,
 CONSTRAINT [PK__products__3213E83F88A70292] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'admin', 1, 1, N'mafio1201@gmail.com', N'Nguyễn Trần Quốc Khanh', N'123', NULL)
INSERT [dbo].[accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'QuocKhanh', 1, 0, N'mafio1201@gmail.com', N'Nguyễn Trần Quốc Khanh', N'123', NULL)
INSERT [dbo].[accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'us01', 1, 0, N'diemphuoc5555@gmail.com', N'Quách Diêm Phước', N'123', NULL)
INSERT [dbo].[accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'user2', 1, 1, N'diemphuoc5555@gmail.com', N'Hoàng Xuân Đạt', N'123', NULL)
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'1', N'Apex')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'2', N'Bata')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'3', N'Puma')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'4', N' Nike')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'5', N'Likoda')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'6', N'Piolaba')
GO
SET IDENTITY_INSERT [dbo].[orderdetails] ON 

INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [city], [country], [fullname]) VALUES (7, 110, 3, 7, 38, N'Hồ Chí Minh', N'US', N'Hoàng Xuân Đạt')
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [city], [country], [fullname]) VALUES (8, 97, 1, 8, 39, N'Hồ Chí Minh', N'VietNam', N'Hoàng Xuân Đạt')
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [city], [country], [fullname]) VALUES (9, 97, 3, 9, 39, N'Hồ Chí Minh', N'Chinese', N'Hoàng Xuân Đạt')
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [city], [country], [fullname]) VALUES (10, 110, 3, 10, 38, N'Hồ Chí Minh', N'VietNam', N'Diêm Phước')
INSERT [dbo].[orderdetails] ([id], [price], [quantity], [orderid], [productid], [city], [country], [fullname]) VALUES (11, 97, 1, 11, 39, N'Hồ Chí Minh', N'VietNam', N'Nguyễn Trần Quốc Khanh')
SET IDENTITY_INSERT [dbo].[orderdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [address], [createdate], [username], [phone], [email]) VALUES (7, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'user2', 963230016, N'diemphuoc5555@gmail.com')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [phone], [email]) VALUES (8, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'user2', 963230016, N'diemphuoc5555@gmail.com')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [phone], [email]) VALUES (9, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'user2', 963230016, N'diemphuoc5555@gmail.com')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [phone], [email]) VALUES (10, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'user2', 963230016, N'diemphuoc5555@gmail.com')
INSERT [dbo].[orders] ([id], [address], [createdate], [username], [phone], [email]) VALUES (11, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'QuocKhanh', 963230016, N'mafio1201@gmail.com')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (38, 1, CAST(N'2001-06-23' AS Date), N'Minimal', 230, N'1', N'pro13.jpg', N'pro14.jpg', 110)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (39, 1, CAST(N'2001-06-23' AS Date), N'Troma', 230, N'1', N'pro15.jpg', N'pro16.jpg', 97)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (40, 1, CAST(N'2001-06-23' AS Date), N'Minim Trom Furn', 230, N'1', N'pro16.jpg', N'pro17.jpg', 93)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (41, 1, CAST(N'2001-06-23' AS Date), N'Min Furnit', 230, N'2', N'pro17.jpg', N'pro18.jpg', 103)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (42, 1, CAST(N'2001-06-23' AS Date), N'Furniture', 230, N'2', N'pro18.jpg', N'pro19.jpg', 131)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (43, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'2', N'pro19.jpg', N'pro20.jpg', 152)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (44, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'3', N'pro20.jpg', N'pro19.jpg', 108)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (45, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'3', N'pro15.jpg', N'pro16.jpg', 87)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (46, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'3', N'pro16.jpg', N'pro17.jpg', 96)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (47, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'4', N'pro19.jpg', N'pro20.jpg', 99)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (48, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'4', N'pro20.jpg', N'pro19.jpg', 112)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (49, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'4', N'pro15.jpg', N'pro16.jpg', 90)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (50, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'5', N'pro16.jpg', N'pro17.jpg', 79)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (51, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'5', N'pro13.jpg', N'pro14.jpg', 180)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (52, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'5', N'pro15.jpg', N'pro16.jpg', 150)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (53, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'6', N'pro16.jpg', N'pro17.jpg', 121)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (54, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'6', N'pro17.jpg', N'pro18.jpg', 132)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (55, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'6', N'pro18.jpg', N'pro19.jpg', 119)
INSERT [dbo].[products] ([id], [available], [createdate], [name], [price], [categoryid], [image1], [image2], [sale]) VALUES (59, NULL, CAST(N'2001-03-15' AS Date), N'Linh Kiện', 200, NULL, N'pro1.jpg', NULL, 180)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr] FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKaltatpxipsjtcih4d1h6bn0xr]
GO
ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8] FOREIGN KEY([orderid])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FKj4gc2ja2otvwemf4rho2lp3s8]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q] FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK1krrsjgcawsfg8k8u4hm5gi8q]
GO
