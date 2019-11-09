use master
go

/*
if OBJECT_ID(N'MyImage',N'U') is null
drop database MyImage
go
*/

IF EXISTS(select * from sys.databases where name='MyImage')
DROP DATABASE MyImage
go

create database MyImage
go

use MyImage
go

create table [Customer]
(
	[CustID] varchar(10) not null,
	[CustFirstName] varchar(50) not null,
	[CustLastName] varchar(30) not null,
	[CustUser] varchar(30) not null,
	[CustPassword] varchar(100) not null,
	[CustEmail] varchar (50) not null,
	[CustBillingAddr] varchar (100) not null,
	[CustShippingAddr] varchar(100) not null,
	[CreatedAt] datetime
)


create table [Role]
(
	[RoleID] varchar(10) not null,
	[RoleName] varchar(30) not null,
	[CreatedAt] datetime
)

create table [CustRole]
(
	[ID] int identity,
	[CustID] varchar(10) not null,
	[RoleID] varchar(10) not null,
	[CreatedAt] datetime
)



create table [PrintSize]
(
	[PrintSizeID] varchar (10) not null,
	[PrintSizeName] varchar(50) not null,
	[PrintSizeDemension] varchar(50) not null,
	[CreatedAt] datetime
)

create table [PricePrintSize]
(
	[PricePrintSizeID] int not null,
	[PriceID] varchar(10) not null,
	[PrintSizeID] varchar(10) not null,
)

create table [Price]
(
	[PriceID] varchar(10) not null,
	[PriceName] varchar(50) not null,
	[PriceType] varchar (50) not null,
	[Price] int not null,
	[CreatedAt] datetime
)

create table [Image]
(
	[OrderID] varchar(10) not null,
	[PrintSizeID] varchar(10) not null,
	[CustID] varchar(10) not null,
	[ImgID] varchar(10) not null,
	[ImgFileName] varchar(100) not null,
	[CreatedAt] datetime
)

create table [Store]
(
	[StoreID] varchar(10) not null,
	[StoreName] varchar (50) not null,
	[StoreAddr] varchar(100) not null,
	[CreatedAt] datetime
)

create table [PaymentMethod]
(
	[PayMethodID] varchar(10)not null,
	[PayMethodName] varchar(50) not null,
	[CreatedAt] datetime
)

create table [CardType]
(
	[PayMethodID] varchar(10) not null,
	[CardTypeID] varchar (10) not null,
	[CardTypeName] varchar(50) not null,
	[CardTypeBIN] varchar(10) not null,
	[CardTypeLen] varchar(20) not null,
	[CardTypeIcon] varchar(10) not null,
	[CreatedAt] datetime
)

Create table [Card]
(
	[CustID] varchar(10) not null,
	[CardTypeID] varchar (10) not null,
	[CardID] varchar(10) not null,
	[CardHolder] varchar(50) not null,
	[CardNumber] varchar(20) not null,
	[CardExp] varchar(10) not null,
	[CardCVV] varchar(4) not null,
	[CreatedAt] datetime
)

create table [Order]
(
	[OrderStatusID] varchar (10) not null,
	[InvoiceID] varchar(10) not null,
	[PayMethodID] varchar(10) not null,
	[CustID] varchar(10) not null,
	[OrderID] varchar(10) not null,
	[OrderItem] varchar(100) not null, -- is Image name??
	[OrderQty] int not null,
	[OrderDate] datetime not null,
	[CreatedAt] datetime
)

create table [OrderStatus]
(
	[OrderStatusID] varchar(10) not null,
	[OrderStatusName] varchar(50) not null,
	[CreatedAt] datetime
)

create table [Invoice]
(
	[InvoiceID] varchar(10) not null,
	[InvoiceNumber] varchar(10) not null,
	[InvoiceDate] datetime not null,
	[CreatedAt] datetime
)

create table [Cart]
(
	[ImgID] varchar(10) not null,
	[CartID] varchar(10) not null,
	[CartItem] varchar(100) not null,
	[CartQty] int not null,
	[CartDate] datetime not null,
	[CreatedAt] datetime
)

create table [Wishlist]
(
	[ImgID] varchar(10) not null,
	[WishlistID] varchar(10) not null,
	[WishlistItem] varchar(100) not null,
	[WishlistQty] int not null,
	[WishlistDate] datetime not null,
	[CreatedAt] datetime
)

create table [Folder]
(
	[FolderID] varchar(10) not null,
	[FolderName] varchar(50) not null,
	[CreatedAt] datetime
)

go


-- alter primary key --
alter table [Customer]
add constraint Pk_Customer primary key ([CustID])

alter table [Role]
add constraint Pk_Role primary key ([RoleID])

alter table [PrintSize]
add constraint Pk_PrintSize primary key ([PrintSizeID])

alter table [Image]
add constraint Pk_Image primary key ([ImgID])

alter table [Store]
add constraint Pk_Store primary key ([StoreID])

alter table [PaymentMethod]
add constraint Pk_PaymentMethod primary key ([PayMethodID])

alter table [CardType]
add constraint Pk_CardType primary key ([CardTypeID])

alter table [Card]
add constraint Pk_Card primary key ([CardID])

alter table [Order]
add constraint Pk_Order primary key ([OrderID])

alter table [Invoice]
add constraint Pk_Invoice primary key ([InvoiceID])

alter table [Cart]
add constraint Pk_Cart primary key ([CartID])

alter table [Wishlist]
add constraint Pk_Wishtlist primary key ([WishlistID])

alter table [PricePrintSize] add
	constraint Pk_PricePrintSize primary key ([PricePrintSizeID])

alter table [Price] with check add
	constraint Pk_Price primary key ([PriceID])
	
alter table [OrderStatus] with check add
	constraint Pk_OrderStatus primary key ([OrderStatusID])

alter table [Folder] with check add
	constraint Pk_Folder primary key ([FolderID])

go


-- alter foreign key --
alter table [CustRole] with check add
	constraint Fk_CustRole_Customer foreign key ([CustID]) references [Customer]([CustID]),
	constraint Fk_CustRole_Role foreign key ([RoleID]) references [Role]([RoleID])

alter table [Image] with check add
	constraint Fk_Image_PrintSize foreign key ([PrintSizeID]) references [PrintSize]([PrintSizeID]),
	constraint Fk_Image_Customer foreign key ([CustID]) references [Customer]([CustID]),
	constraint Fk_Image_Order foreign key ([OrderID]) references [Order]([OrderID])

alter table [CardType] with check add
	constraint Fk_CardType_PaymentMethod foreign key ([PayMethodID]) references [PaymentMethod]([PayMethodID])

alter table [Card] with check add
	constraint Fk_Card_CardType foreign key ([CardTypeID]) references [CardType]([CardTypeID]),
	constraint Fk_Card_Customer foreign key ([CustID]) references [Customer]([CustID])

alter table [Order] with check add
	constraint Fk_Order_PaymentMethod foreign key ([PayMethodID]) references [PaymentMethod]([PayMethodID]), -- table Order & PaymentMethod => many to many ??
	constraint Fk_Order_Invoice foreign key ([InvoiceID]) references [Invoice]([InvoiceID]),
	constraint Fk_Order_Customer foreign key ([CustID]) references [Customer]([CustID]),
	constraint Fk_Order_OrderStatus foreign key ([OrderStatusID]) references [OrderStatus]([OrderStatusID])

alter table [Cart] with check add
	constraint Fk_Cart_Image foreign key ([ImgID]) references [Image]([ImgID]),
	constraint Fk_Cart_Customer foreign key ([CartID]) references [Customer]([CustID])

alter table [Wishlist] with check add
	constraint Fk_Wishlist_Image foreign key ([ImgID]) references [Image]([ImgID]),
	constraint Fk_Wishlist_Customer foreign key ([WishlistID]) references [Customer]([CustID])

alter table [Customer] with check add
	constraint Fk_Customer_Folder foreign key ([CustID]) references [Folder]([FolderID])

alter table [PricePrintSize] with check add
	constraint Fk_PricePrintSize_PrintSize foreign key ([PrintSizeID]) references [PrintSize]([PrintSizeID]),
	constraint Fk_PricePrintSize_Price foreign key ([PriceID]) references [Price]([PriceID])

go



--01 select * from [Customer]
--02 select * from [Role]
--03 select * from [CustRole]
--04 select * from [PrintSize]
--05 select * from [Image]
--06 select * from [Store]
--07 select * from [PaymentMethod]
--08 select * from [CardType]
--09 select * from [Card]
--10 select * from [Order]
--11 select * from [Invoice]
--12 select * from [Cart]
--13 select * from [Wishlist]
--go
