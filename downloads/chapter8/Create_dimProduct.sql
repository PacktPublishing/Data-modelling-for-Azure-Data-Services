CREATE TABLE dbo.dimProduct
(
	ProductKey					int				NOT NULL
	, SourceKey					int				NOT NULL
	, ProductName				nvarchar(40)	NOT NULL
	, CategoryName				nvarchar(15)	NOT NULL
	, QuantityPerUnit			nvarchar(20)	NULL
	, UnitPrice					money			NULL
	, ReorderLevel				smallint		NULL
	, Discontinued				bit				NOT NULL
	, Supplier_CompanyName		nvarchar(40)	NOT NULL
	, Supplier_ContactName		nvarchar(30)	NULL
	, Supplier_ContactTitle		nvarchar(30)	NULL
	, Supplier_Address			nvarchar(60)	NULL
	, Supplier_City				nvarchar(15)	NULL
	, Supplier_Region			nvarchar(15)	NULL
	, Supplier_PostalCode		nvarchar(10)	NULL
	, Supplier_Country			nvarchar(15)	NULL
	, Supplier_Phone			nvarchar(24)	NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN
	, CLUSTERED INDEX (ProductKey ASC)
);


