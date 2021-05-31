-- Step 1
-- Create a db master key if one does not already exist, using your own password.
CREATE MASTER KEY ENCRYPTION BY PASSWORD='MyStr9ngS3cr3t';



-- Step 2
-- Create a database scoped credential.
-- This example uses the storage accounts secret key
CREATE DATABASE SCOPED CREDENTIAL AccessDesignbookDataLake
WITH 
	IDENTITY = 'SHARED ACCESS SIGNATURE'
	, SECRET = '<PASTE YOUR SECRET KEY HERE>';




-- Step 3
-- Create an external data source
-- TYPE: HADOOP - PolyBase uses Hadoop APIs to access data in Azure blob storage.
-- LOCATION: Provide Azure storage account name and blob container name.
-- CREDENTIAL: Provide the credential created in the previous step.

CREATE EXTERNAL DATA SOURCE AzureStorage
WITH (
    TYPE = HADOOP,
    LOCATION = 'abfss://northwind@designbookdatalake.dfs.core.windows.net',
    CREDENTIAL = AccessDesignbookDataLake
);

-- Create an external file format

CREATE EXTERNAL FILE FORMAT TextFile 
WITH 
(
     FORMAT_TYPE = DelimitedText
	 , FORMAT_OPTIONS (
				FIELD_TERMINATOR = ','
				, STRING_DELIMITER = '"') 
);





--Step 4
-- Now define external tables to read data from Order and OrderDetail
CREATE EXTERNAL TABLE dbo.ext_Order
(
	OrderID				int				NOT NULL
	, CustomerID		int				NULL
	, EmployeeID		int				NULL
	, OrderDate			nvarchar(40)			NULL
	, RequiredDate		nvarchar(40)			NULL
	, ShippedDate		nvarchar(40)			NULL
	, ShipVia			int				NULL
	, Freight			money			NULL
	, ShipName			nvarchar(40)	NULL
	, ShipAddress		nvarchar(60)	NULL
	, ShipCity			nvarchar(15)	NULL
	, ShipRegion		nvarchar(15)	NULL
	, ShipPostalCode	nvarchar(10)	NULL
	, ShipCountry		nvarchar(15)	NULL
	, TotalAmount		money			NULL
)
WITH 
(
    LOCATION='/Raw/[dbo].[Order]/',
    DATA_SOURCE=AzureStorage,
    FILE_FORMAT=TextFile
);

CREATE EXTERNAL TABLE dbo.ext_OrderDetail
(
	OrderID			int				NOT NULL
	, ProductID		int				NOT NULL
	, UnitPrice		money			NOT NULL
	, Quantity		smallint		NOT NULL
	, Discount		numeric(5, 4)	NOT NULL
)
WITH 
(
    LOCATION='/Raw/[dbo].[OrderDetail]/',
    DATA_SOURCE=AzureStorage,
    FILE_FORMAT=TextFile
);
GO




-- Step 5
-- Create a sproc that imports the data using CTAS that can be called from Azure Data Factory:
-- IMPORT into SQL Pool
CREATE PROCEDURE usp_Import_factOrderData
AS
CREATE TABLE dbo.stage_factOrder
WITH
(   
    DISTRIBUTION = ROUND_ROBIN
	, CLUSTERED COLUMNSTORE INDEX
    
)
AS
SELECT 
	o.[OrderID]
	,[CustomerID]
	,[EmployeeID]
	,CONVERT(date, [OrderDate]) AS [OrderDate]
	,CONVERT(date, [RequiredDate]) AS [RequiredDate]
	,CONVERT(date, [ShippedDate]) AS [ShippedDate]
	,[ShipVia]
	,[Freight]
	,[ShipName]
	,[ShipAddress]
	,[ShipCity]
	,[ShipRegion]
	,[ShipPostalCode]
	,[ShipCountry]
	,[TotalAmount]
	, d.ProductID
	, d.UnitPrice
	, d.Quantity
	, d.Discount
FROM dbo.ext_Order AS o
INNER JOIN dbo.ext_OrderDetail AS d ON o.OrderID = d.OrderID;


-- INSERT into production table
INSERT dbo.factOrder
(
	ProductKey
	, OrderDateKey	
	, RequiredDateKey
	, ShippedDateKey
	, CustomerKey
	, ShipperKey
	, AddressKey
	, EmployeeKey
	, OrderID
	, UnitPrice
	, Quantity
	, Discount
	, LineTotal
	, Freight
)

SELECT 
	ISNULL(P.ProductKey, -1)
	, YEAR(OrderDate) * 10000 + MONTH(OrderDate) * 100 + DAY(OrderDate)	
	, YEAR(RequiredDate) * 10000 + MONTH(RequiredDate) * 100 + DAY(RequiredDate)
	, ISNULL(YEAR(ShippedDate) * 10000 + MONTH(ShippedDate) * 100 + DAY(ShippedDate), '99991231')
	, ISNULL(C.CustomerKey, -1)
	, -1 -- ISNULL(S.ShipperKey, -1)
	, -1 -- ISNULL(A.AddressKey, -1)
	, -1 -- ISNULL(E.EmployeeKey, -1)
	, f.OrderID
	, f.UnitPrice
	, f.Quantity
	, f.Discount
	, f.UnitPrice * f.Quantity * (1 - f.Discount)
	, f.Freight
FROM dbo.stage_factOrder f
LEFT JOIN dbo.dimProduct P ON P.SourceKey = f.ProductID
LEFT JOIN dbo.dimCustomer C ON C.SourceKey = f.CustomerID
--LEFT JOIN dbo.dimShipper S ON S.SourceKey = f.ShipperID
--LEFT JOIN dbo.dimAddress A ON A.ShipName = f.ShipName AND A.ShipAddress = f.ShipAddress
--LEFT JOIN dbo.dimEmployee E ON E.EmployeeKey = f.EmployeeID
;

-- Drop the staging table
DROP TABLE dbo.stage_factOrder;


-- Create statistics on the new data
CREATE STATISTICS [stats_CustomerKey] ON [factOrder] ([CustomerKey]);
CREATE STATISTICS [stats_ProductKey] ON [factOrder] ([ProductKey]);
CREATE STATISTICS [stats_OrderDateKey] ON [factOrder] ([OrderDateKey]);
-- End procedure