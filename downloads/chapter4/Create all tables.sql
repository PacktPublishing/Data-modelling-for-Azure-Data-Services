CREATE TABLE [dbo].[Customer]
(
    CustomerID          INT IDENTITY(1,1)   NOT NULL,
    CompanyName         NVARCHAR(40)        NOT NULL,
    ContactName         NVARCHAR(30)        NULL,
    ContactTitle        NVARCHAR(30)        NULL,
    Address             NVARCHAR(60)        NULL,
    City                NVARCHAR(15)        NULL,
    Region              NVARCHAR(15)        NULL,
    PostalCode          NVARCHAR(10)        NULL,
    Country             NVARCHAR(15)        NULL,
    Phone               NVARCHAR(24)        NULL,
    Fax                 NVARCHAR(24)        NULL
);
GO

CREATE TABLE [dbo].[Order]
(
	OrderID			INT IDENTITY(1,1)	NOT NULL,
	CustomerID		INT					NULL,
	EmployeeID		INT					NULL,
	OrderDate		DATE				NULL,
	RequiredDate	DATE				NULL,
	ShippedDate		DATE				NULL,
	ShipVia			INT					NULL,
	Freight			MONEY				NULL,
	ShipName		NVARCHAR(40)		NULL,
	ShipAddress		NVARCHAR(60)		NULL,
	ShipCity		NVARCHAR(15)		NULL,
	ShipRegion		NVARCHAR(15)		NULL,
	ShipPostalCode	NVARCHAR(10)		NULL,
	ShipCountry		NVARCHAR(15)		NULL,
	TotalAmount		MONEY				NULL
);
GO

CREATE TABLE [dbo].[OrderDetail]
(
	OrderID		INT NOT NULL,
	ProductID	INT NOT NULL,
	UnitPrice	MONEY NOT NULL,
	Quantity	SMALLINT NOT NULL,
	Discount	NUMERIC(5, 4) NOT NULL
);
GO

CREATE TABLE [dbo].[ProductCategory](
	CategoryID		INT IDENTITY(1,1)	NOT NULL,
	CategoryName	NVARCHAR(15)		NOT NULL,
	Description		NVARCHAR(255)		NULL,
	Picture			VARBINARY(MAX)		NULL
);
GO

CREATE TABLE [dbo].[Employee]
(
	EmployeeID		INT IDENTITY(1,1)	NOT NULL,
	LastName		NVARCHAR(20)		NOT NULL,
	FirstName		NVARCHAR(10)		NOT NULL,
	Title			NVARCHAR(30)		NULL,
	TitleOfCourtesy	NVARCHAR(25)		NULL,
	BirthDate		DATE				NULL,
	HireDate		DATE				NULL,
	Address			NVARCHAR(60)		NULL,
	City			NVARCHAR(15)		NULL,
	Region			NVARCHAR(15)		NULL,
	PostalCode		NVARCHAR(10)		NULL,
	Country			NVARCHAR(15)		NULL,
	HomePhone		NVARCHAR(24)		NULL,
	Extension		NVARCHAR(4)			NULL,
	Photo			VARBINARY(MAX)		NULL,
	Notes			NVARCHAR(MAX)		NULL,
	ReportsTo		INT					NULL
);
GO

CREATE TABLE [dbo].[Shipper]
(
	ShipperID		INT IDENTITY(1,1)	NOT NULL,
	CompanyName		NVARCHAR(40)		NOT NULL,
	Phone			NVARCHAR(24)		NULL
);
GO
