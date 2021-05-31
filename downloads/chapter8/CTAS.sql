-- IMPORT into SQL Pool
CREATE TABLE dbo.stage_factOrder
WITH
(   
    DISTRIBUTION = ROUND_ROBIN
	, CLUSTERED COLUMNSTORE INDEX
    
)
AS
SELECT * FROM dbo.ext_factOrder;


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
	ProductKey
	, OrderDateKey	
	, RequiredDateKey
	, ISNULL(ShippedDateKey, '99991231')
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
FROM dbo.stage_factOrder;

-- Drop the staging table
-- Drop the staging table
DROP TABLE dbo.stage_factOrder;


-- Create statistics on the new data
CREATE STATISTICS [stats_CustomerKey] ON [factOrder] ([CustomerKey]);
CREATE STATISTICS [stats_ProductKey] ON [factOrder] ([ProductKey]);
CREATE STATISTICS [stats_OrderDateKey] ON [factOrder] ([OrderDateKey]);

