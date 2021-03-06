CREATE DATABASE WebShopVue_QuachDiemPhuoc
GO
USE WebShopVue_QuachDiemPhuoc
GO
CREATE TABLE accounts(
	username varchar(255) NOT NULL,
	activated bit NOT NULL,
	admin bit NOT NULL,
	email varchar(255) NOT NULL,
	fullname varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	photo varchar(255) NULL
);

CREATE TABLE categories(
	id varchar(255) NOT NULL,
	name varchar(255) NULL,
);

CREATE TABLE orderdetails(
	id bigint (IDENTITY(1,1)) NOT NULL,
	price float NULL,
	quantity int NULL,
	orderid bigint NULL,
	productid int NULL,
	city varchar(255) NULL,
	country varchar(255) NULL,
	fullname varchar(255) NULL,
);

CREATE TABLE orders(
	id bigint (IDENTITY(1,1)) NOT NULL,
	address varchar(255) NULL,
	createdate date NULL,
	username varchar(255) NULL,
	phone int NULL,
	email varchar(255) NULL,
);

CREATE TABLE products(
	id int (IDENTITY(1,1)) NOT NULL,
	available bit NULL,
	createdate date NULL,
	name varchar(255) NULL,
	price float NULL,
	categoryid varchar(255) NULL,
	image1 varchar(255) NULL,
	image2 varchar(255) NULL,
	sale float NULL,
);

GO
INSERT accounts (username, activated, admin, email, fullname, password, photo) VALUES (N'admin', 1, 1, N'mafio1201@gmail.com', N'Nguyễn Trần Quốc Khanh', N'123', NULL)
INSERT accounts (username, activated, admin, email, fullname, password, photo) VALUES (N'QuocKhanh', 1, 0, N'mafio1201@gmail.com', N'Nguyễn Trần Quốc Khanh', N'123', NULL)
INSERT accounts (username, activated, admin, email, fullname, password, photo) VALUES (N'us01', 1, 0, N'diemphuoc5555@gmail.com', N'Quách Diêm Phước', N'123', NULL)
INSERT accounts (username, activated, admin, email, fullname, password, photo) VALUES (N'user2', 1, 1, N'diemphuoc5555@gmail.com', N'Hoàng Xuân Đạt', N'123', NULL)
GO
INSERT categories (id, name) VALUES (N'1', N'Apex')
INSERT categories (id, name) VALUES (N'2', N'Bata')
INSERT categories (id, name) VALUES (N'3', N'Puma')
INSERT categories (id, name) VALUES (N'4', N' Nike')
INSERT categories (id, name) VALUES (N'5', N'Likoda')
INSERT categories (id, name) VALUES (N'6', N'Piolaba')
GO
SET IDENTITY_INSERT orderdetails ON 

INSERT orderdetails (id, price, quantity, orderid, productid, city, country, fullname) VALUES (7, 110, 3, 7, 38, N'Hồ Chí Minh', N'US', N'Hoàng Xuân Đạt')
INSERT orderdetails (id, price, quantity, orderid, productid, city, country, fullname) VALUES (8, 97, 1, 8, 39, N'Hồ Chí Minh', N'VietNam', N'Hoàng Xuân Đạt')
INSERT orderdetails (id, price, quantity, orderid, productid, city, country, fullname) VALUES (9, 97, 3, 9, 39, N'Hồ Chí Minh', N'Chinese', N'Hoàng Xuân Đạt')
INSERT orderdetails (id, price, quantity, orderid, productid, city, country, fullname) VALUES (10, 110, 3, 10, 38, N'Hồ Chí Minh', N'VietNam', N'Diêm Phước')
INSERT orderdetails (id, price, quantity, orderid, productid, city, country, fullname) VALUES (11, 97, 1, 11, 39, N'Hồ Chí Minh', N'VietNam', N'Nguyễn Trần Quốc Khanh')
SET IDENTITY_INSERT orderdetails OFF
GO
SET IDENTITY_INSERT orders ON 

INSERT orders (id, address, createdate, username, phone, email) VALUES (7, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'user2', 963230016, N'diemphuoc5555@gmail.com')
INSERT orders (id, address, createdate, username, phone, email) VALUES (8, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'user2', 963230016, N'diemphuoc5555@gmail.com')
INSERT orders (id, address, createdate, username, phone, email) VALUES (9, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'user2', 963230016, N'diemphuoc5555@gmail.com')
INSERT orders (id, address, createdate, username, phone, email) VALUES (10, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'user2', 963230016, N'diemphuoc5555@gmail.com')
INSERT orders (id, address, createdate, username, phone, email) VALUES (11, N'05-duong so 8, quan binh tan, thanh pho ho chi minh', CAST(N'2021-06-24' AS Date), N'QuocKhanh', 963230016, N'mafio1201@gmail.com')
SET IDENTITY_INSERT orders OFF
GO
SET IDENTITY_INSERT products ON 

INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (38, 1, CAST(N'2001-06-23' AS Date), N'Minimal', 230, N'1', N'pro13.jpg', N'pro14.jpg', 110)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (39, 1, CAST(N'2001-06-23' AS Date), N'Troma', 230, N'1', N'pro15.jpg', N'pro16.jpg', 97)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (40, 1, CAST(N'2001-06-23' AS Date), N'Minim Trom Furn', 230, N'1', N'pro16.jpg', N'pro17.jpg', 93)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (41, 1, CAST(N'2001-06-23' AS Date), N'Min Furnit', 230, N'2', N'pro17.jpg', N'pro18.jpg', 103)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (42, 1, CAST(N'2001-06-23' AS Date), N'Furniture', 230, N'2', N'pro18.jpg', N'pro19.jpg', 131)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (43, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'2', N'pro19.jpg', N'pro20.jpg', 152)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (44, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'3', N'pro20.jpg', N'pro19.jpg', 108)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (45, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'3', N'pro15.jpg', N'pro16.jpg', 87)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (46, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'3', N'pro16.jpg', N'pro17.jpg', 96)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (47, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'4', N'pro19.jpg', N'pro20.jpg', 99)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (48, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'4', N'pro20.jpg', N'pro19.jpg', 112)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (49, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'4', N'pro15.jpg', N'pro16.jpg', 90)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (50, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'5', N'pro16.jpg', N'pro17.jpg', 79)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (51, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'5', N'pro13.jpg', N'pro14.jpg', 180)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (52, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'5', N'pro15.jpg', N'pro16.jpg', 150)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (53, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'6', N'pro16.jpg', N'pro17.jpg', 121)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (54, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'6', N'pro17.jpg', N'pro18.jpg', 132)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (55, 1, CAST(N'2001-06-23' AS Date), N'Minimal Troma Furniture', 230, N'6', N'pro18.jpg', N'pro19.jpg', 119)
INSERT products (id, available, createdate, name, price, categoryid, image1, image2, sale) VALUES (59, NULL, CAST(N'2001-03-15' AS Date), N'Linh Kiện', 200, NULL, N'pro1.jpg', NULL, 180)
SET IDENTITY_INSERT products OFF
GO
ALTER TABLE orderdetails  WITH CHECK ADD  CONSTRAINT FKaltatpxipsjtcih4d1h6bn0xr FOREIGN KEY(productid)
REFERENCES products (id)
GO
ALTER TABLE orderdetails CHECK CONSTRAINT FKaltatpxipsjtcih4d1h6bn0xr
GO
ALTER TABLE orderdetails  WITH CHECK ADD  CONSTRAINT FKj4gc2ja2otvwemf4rho2lp3s8 FOREIGN KEY(orderid)
REFERENCES orders (id)
GO
ALTER TABLE orderdetails CHECK CONSTRAINT FKj4gc2ja2otvwemf4rho2lp3s8
GO
ALTER TABLE orders  WITH CHECK ADD  CONSTRAINT FKk3cjfcgb621qhahps1tre43e4 FOREIGN KEY(username)
REFERENCES accounts (username)
GO
ALTER TABLE orders CHECK CONSTRAINT FKk3cjfcgb621qhahps1tre43e4
GO
ALTER TABLE products  WITH CHECK ADD  CONSTRAINT FK1krrsjgcawsfg8k8u4hm5gi8q FOREIGN KEY(categoryid)
REFERENCES categories (id)
GO
ALTER TABLE products CHECK CONSTRAINT FK1krrsjgcawsfg8k8u4hm5gi8q
GO
