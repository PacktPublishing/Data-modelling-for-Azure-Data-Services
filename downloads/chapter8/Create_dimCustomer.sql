CREATE TABLE dbo.dimCustomer
(
	CustomerKey				int				NOT NULL
	, SourceKey				nchar(5)		NOT NULL
	, Customer_CompanyName	nvarchar(40)	NOT NULL
	, Customer_ContactName	nvarchar(30)	NULL
	, Customer_ContactTitle	nvarchar(30)	NULL
	, Customer_Address		nvarchar(60)	NULL
	, Customer_City			nvarchar(15)	NULL
	, Customer_Region		nvarchar(15)	NULL
	, Customer_PostalCode	nvarchar(10)	NULL
	, Customer_Country		nvarchar(15)	NULL
	, Customer_Phone		nvarchar(24)	NULL
	, Customer_Fax			nvarchar(24)	NULL
	, StartDate				date			NOT NULL
	, EndDate				date			NOT NULL
)
WITH
(
	DISTRIBUTION = HASH( CustomerKey )
	, CLUSTERED COLUMNSTORE INDEX
);

