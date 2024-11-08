create table [Role] (
	id int identity(1,1) primary key,
	type nvarchar(50)
)
create table Category (
	id nvarchar(50) primary key,
	name nvarchar(50)
)
create table Products (
	id nvarchar(255) primary key,
	[name] nvarchar(255),
	origin nvarchar(255),
	company nvarchar(255),
	price nvarchar(255),
	quantity int,
	category_id nvarchar(50) foreign key references Category(id)
)
create table Wishlish (
	id nvarchar(255) primary key,
	price nvarchar(255),
	quantity int
)
create table Cart (
	id nvarchar(255) primary key,
	quantity int
)
create table Shipment (
	id NVARCHAR(255) primary key,
	departure_date DATE,
	arrival_date DATE,
	house_num nvarchar(255),
	city nvarchar(255)
)
create table Payment (
	id NVARCHAR(255) primary key,
	method nvarchar(255),
	date DATE,
	amount FLOAT
)
create table Account (
	id nvarchar(255) primary key,
	[password] nvarchar(255),
	[name] nvarchar(255),
	house_num nvarchar(255),
	city nvarchar(255),
	phone_number nvarchar(255),
	email nvarchar(255),
	role_id int foreign key references Role(id)
)
create table [Order] (
	id nvarchar(50) primary key,
	[date] Date,
	total_price FLOAT,
	user_id nvarchar(255) foreign key references Account(id),
	shipment_id NVARCHAR(255) FOREIGN KEY REFERENCES Shipment(id),
	payment_id NVARCHAR(255) FOREIGN KEY REFERENCES Payment(id)
)
create table WishlishItem ( 
	wishlish_id nvarchar(255) foreign key references Wishlish(id),
	products_id nvarchar(255) foreign key references Products(id)
)
create table OrderItem ( 
	order_id nvarchar(50) foreign key references [Order](id),
	products_id nvarchar(255) foreign key references Products(id)
)

----------------------------------------------------------
INSERT INTO Role (type) 
VALUES
('Admin'),
('Seller'),
('Customers');

INSERT INTO Category (id, name) 
VALUES
(N'1234', N'Giày thể thao'),
(N'6524', N'Giày thời trang');

insert into Products (id, [name], origin, company, price, quantity, category_id) 
values 
(N'6E98E5C3-DF82-9B42-4E87-BFB80A384147', N'Nike Air Max 270', N'Vietnam', N'Nike', N'120.000', 10, N'1234'),
(N'21A81359-3831-C0DC-EEE5-D4A4E67A3154', N'Adidas Ultraboost 21', N'China', N'Adidas', N'430.000', 10, N'1234'),
(N'B8BB2EE9-1777-B44A-5378-2D78C7BC8019', N'Puma RS-X', N'Vietnam', N'Puma', N'580.000', 10, N'1234'),
(N'FE48AB95-D7A6-C955-7A75-153094B6A1D3', N'New Balance 990v5', N'Thailand', N'Nike', N'710.000', 10, N'1234'),
(N'6EB2E156-A7CC-EAE5-5A7C-66270C853510', N'Asics Gel-Kayano 27', N'Vietnam', N'Asics', N'620.000', 10, N'1234'),
(N'B163EA2C-456C-A618-66DC-E4E451C940B4', N'Converse Chuck Taylor All Star', N'China', N'Converse', N'450.000', 10, N'6524'),
(N'E6D4598B-46F4-06B9-9D1B-3A2BBC611471', N'Adidas Stan Smith', N'Vietnam', N'Adidas', N'750.000', 10, N'6524'),
(N'008D7E9D-A71B-B24B-6938-BFA4B163D206', N'Vans Old Skool', N'Vietnam', N'Vans', N'340.000', 10, N'6524'),
(N'73A3B400-9E08-8E9C-8710-2265A563AD3E', N'Nike Air Force 1', N'China', N'Nike', N'120.000', 10, N'6524'),
(N'7E42BA35-2EF4-CC4E-47BA-B01D23EC8F43', N'Reebok Club C 85', N'Vietnam', N'Reebok', N'320.000', 10, N'6524');

insert into dbo.Wishlish (id, price, quantity)
values 
(N'001', N'1.300.000', 3),
(N'002', N'320.000', 1),
(N'003', N'0', 0),
(N'004', N'0', 0);

insert into dbo.Cart (id, quantity)
values 
(N'120', 1),
(N'121', 1),
(N'122', 0),
(N'123', 0);

insert into Shipment (id, departure_date,arrival_date,house_num, [city])
VALUES 
(N'3461', '2024-07-12', '2024-07-15', N'12A đường Phạm Ngũ Lão, quận Hai Bà Trưng', N'Hanoi'),
(N'2611', '2024-02-03', '2024-02-15', N'114 đường Phạm Văn Đồng, Tp Bắc Ninh', N'Bacninh');

insert into Payment (id,method,[date],amount)
VALUES
(N'123', N'COD', '2024-07-11', 12000),
(N'155', N'COD', '2024-07-11', 17000);

insert into Account(id, [password], [name], house_num, city, phone_number, email, role_id) 
values 
(N'4E87-BFB80A384147', N'aB3$9xYz!Qw', N'Nguyễn Quốc Cường', N'11c', N'Hanoi', N'+84 123 456 789', N'randomuser1@gmail.com', 3),
(N'EEE5-D4A4E67A3154', N'7uN@4mLp#Xv', N'Trần Văn Tuyên', N'236', N'Hanoi', N'+84 234 567 890', N'exampleuser2@gmail.com', 3),
(N'7A75-153094B6A1D3', N'Vw6*1nGh^Jb', N'Trần Trọng Kim', N'1/116', N'Bacninh', N'+84 456 789 012', N'sampleuser4@gmail.com', 3),
(N'8A85-163093B6A1E2', N'Vw6*1nGh^Jb', N'Huỳnh Thị Vân Anh', N'3c/23', N'Hanoi', N'+84 345 678 901', N'testaccount3@gmail.com', 3);

insert into dbo.[Order] (id,[date], total_price, shipment_id, payment_id, user_id)
values 
(N'120', '2024-07-06', 1312000, N'3461', N'123', N'4E87-BFB80A384147'),
(N'121', '2024-07-07', 1212000, N'2611', N'155', N'EEE5-D4A4E67A3154');

insert into dbo.WishlishItem (wishlish_id,products_id)
VALUES
(N'001', N'6E98E5C3-DF82-9B42-4E87-BFB80A384147'),
(N'001', N'B8BB2EE9-1777-B44A-5378-2D78C7BC8019'),
(N'001', N'FE48AB95-D7A6-C955-7A75-153094B6A1D3'),
(N'002', N'21A81359-3831-C0DC-EEE5-D4A4E67A3154');

insert into OrderItem (order_id,products_id)
VALUES
(N'120', N'E6D4598B-46F4-06B9-9D1B-3A2BBC611471'),
(N'121', N'7E42BA35-2EF4-CC4E-47BA-B01D23EC8F43');

----------------------------------------------------------
drop table WishlishItem;
drop table OrderItem;
drop table Wishlish;
drop table [Order];
drop table Account;
drop table Role;
drop table Shipment;
drop table Payment;
drop table Products;
drop table Category;
drop table Cart;

----------------------------------------------------------
select* from WishlishItem;
select* from OrderItem;
select* from Wishlish;
select* from [Order];
select* from Account;
select* from [Role];
select* from Shipment;
select* from Payment;
select* from Products;
select* from Category;
select* from Cart;