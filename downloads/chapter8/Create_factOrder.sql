CREATE TABLE dbo.factOrder
(
	ProductKey			int			NOT NULL
	, OrderDateKey		int			NOT NULL
	, RequiredDateKey	int			NOT NULL
	, ShippedDateKey	int			NOT NULL
	, CustomerKey		int			NOT NULL
	, ShipperKey		int			NOT NULL
	, AddressKey		int			NOT NULL
	, EmployeeKey		int			NOT NULL
	, OrderID			int			NOT NULL
	, UnitPrice			money		NOT NULL
	, Quantity			smallint	NOT NULL
	, Discount			money		NOT NULL
	, LineTotal			money		NOT NULL
	, Freight			money		NULL
)
WITH
(
	DISTRIBUTION = HASH( CustomerKey )
	, CLUSTERED COLUMNSTORE INDEX
);
