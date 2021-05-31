CREATE EXTERNAL TABLE dbo.ext_factOrder
(
	ProductKey			int
	, OrderDateKey		int
	, RequiredDateKey	int
	, ShippedDateKey	int
	, CustomerKey		int
	, ShipperKey		int
	, AddressKey		int
	, EmployeeKey		int
	, OrderID			int
	, UnitPrice			money
	, Quantity			smallint
	, Discount			money
	, LineTotal			money
	, Freight			money
)
WITH 
(
    LOCATION='/factOrder/factOrder_data.csv',
    DATA_SOURCE=AzureStorage,
    FILE_FORMAT=TextFile
);

