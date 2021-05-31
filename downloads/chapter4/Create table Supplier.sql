
CREATE TABLE [dbo].[Supplier]
(
	SupplierID		INT IDENTITY(1,1)	NOT NULL,
	CompanyName		NVARCHAR(40)		NOT NULL,
	ContactName		NVARCHAR(30)		NULL,
	ContactTitle	NVARCHAR(30)		NULL,
	Address			NVARCHAR(60)		NULL,
	City			NVARCHAR(15)		NULL,
	Region			NVARCHAR(15)		NULL,
	PostalCode		NVARCHAR(10)		NULL,
	Country			NVARCHAR(15)		NULL,
	Phone			NVARCHAR(24)		NULL,
	Fax				NVARCHAR(24)		NULL,
	HomePage		NVARCHAR(255)		NULL,
    CONSTRAINT PK_Supplier PRIMARY KEY CLUSTERED (SupplierID)
);
GO