CREATE TABLE [dbo].[Product]
(
	ProductID			INT IDENTITY(1,1)	NOT NULL,
	ProductName			NVARCHAR(40)		NOT NULL,
	SupplierID			INT					NULL,
	CategoryID			INT					NULL,
	QuantityPerUnit		NVARCHAR(20)		NULL,
	UnitPrice			MONEY				NULL,
	UnitsInStock		SMALLINT			NULL,
	UnitsOnOrder		SMALLINT			NULL,
	ReorderLevel		SMALLINT			NULL,
	Discontinued		BIT					NOT NULL
);



