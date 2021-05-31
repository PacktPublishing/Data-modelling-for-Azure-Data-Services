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


