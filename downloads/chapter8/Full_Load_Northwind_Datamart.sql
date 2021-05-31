CREATE OR ALTER PROCEDURE Staging.LoadDimensionsFromSource
AS
--DROP ALL Foreign keys to enable TRUNCATE TABLE
ALTER TABLE [dbo].[factOrder] DROP CONSTRAINT [FK_Order_Address];

ALTER TABLE [dbo].[factOrder] DROP CONSTRAINT [FK_Order_Customer];

ALTER TABLE [dbo].[factOrder] DROP CONSTRAINT [FK_Order_Datum];

ALTER TABLE [dbo].[factOrder] DROP CONSTRAINT [FK_Order_Datum_Required];

ALTER TABLE [dbo].[factOrder] DROP CONSTRAINT [FK_Order_Datum_Shipped];

ALTER TABLE [dbo].[factOrder] DROP CONSTRAINT [FK_Order_Employee];

ALTER TABLE [dbo].[factOrder] DROP CONSTRAINT [FK_Order_Product];

ALTER TABLE [dbo].[factOrder] DROP CONSTRAINT [FK_Order_Shipper];

ALTER TABLE [dbo].[factVoorraad] DROP CONSTRAINT [FK_Voorraad_Product];

ALTER TABLE [dbo].[factVoorraad] DROP CONSTRAINT [FK_Voorraad_Datum];





--For full load: truncate all tables and reload from staging views
TRUNCATE TABLE dbo.dimAddress;

INSERT dbo.dimAddress
SELECT 
	ShipName
    , ShipAddress
    , ShipCity
    , ShipRegion
    , ShipPostalCode
    , ShipCountry
FROM Staging.dimAddress;

TRUNCATE TABLE dbo.dimCustomer;

INSERT dbo.dimCustomer
SELECT
	BronKey
    , Customer_CompanyName
    , Customer_ContactName
    , Customer_ContactTitle
    , Customer_Address
    , Customer_City
    , Customer_Region
    , Customer_PostalCode
    , Customer_Country
    , Customer_Phone
    , Customer_Fax
    , StartDate
    , EndDate
FROM Staging.dimCustomer;

TRUNCATE TABLE dbo.dimEmployee;

INSERT dbo.dimEmployee
SELECT
	 BronKey
    , LastName
    , FirstName
    , Title
    , TitleOfCourtesy
    , BirthDate
    , AgeGroup
    , HireDate
    , YearsInService
    , Address
    , City
    , Region
    , PostalCode
    , Country
    , HomePhone
    , Extension
    , ReportsTo
    , NULL --RegionDescription
    , NULL --TerritoryDescription
    , StartDate
    , EndDate
FROM Staging.DimEmployee;

TRUNCATE TABLE dbo.dimProduct;

INSERT dbo.dimProduct
SELECT
	BronKey
    , ProductName
    , CategoryName
    , QuantityPerUnit
    , UnitPrice
    , ReorderLevel
    , Discontinued
    , Supplier_CompanyName
    , Supplier_ContactName
    , Supplier_ContactTitle
    , Supplier_Address
    , Supplier_City
    , Supplier_Region
    , Supplier_PostalCode
    , Supplier_Country
    , Supplier_Phone
FROM Staging.DimProduct;

TRUNCATE TABLE dbo.dimShipper;

INSERT dbo.dimShipper
SELECT
	BronKey
      , Shipper_CompanyName
      , Phone
FROM Staging.DimShipper;

TRUNCATE TABLE dbo.dimDate;

INSERT dbo.dimDate
EXEC Staging.usp_GenerateDimDate;

TRUNCATE TABLE dbo.factOrder;

INSERT dbo.factOrder
SELECT
	ProductKey
    , OrderDatumKey
    , RequiredDatumKey
    , ShippedDatumKey
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
FROM Staging.factOrder;

--Re-add all foreign keys:
ALTER TABLE [dbo].[factOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_Address] FOREIGN KEY([AddressKey])
REFERENCES [dbo].[dimAddress] ([AddressKey]);

ALTER TABLE [dbo].[factOrder] CHECK CONSTRAINT [FK_Order_Address];

ALTER TABLE [dbo].[factOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[dimCustomer] ([CustomerKey]);

ALTER TABLE [dbo].[factOrder] CHECK CONSTRAINT [FK_Order_Customer];

ALTER TABLE [dbo].[factOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_Datum] FOREIGN KEY([OrderDatumKey])
REFERENCES [dbo].[dimDate] ([DateKey]);

ALTER TABLE [dbo].[factOrder] CHECK CONSTRAINT [FK_Order_Datum];

ALTER TABLE [dbo].[factOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_Datum_Required] FOREIGN KEY([RequiredDatumKey])
REFERENCES [dbo].[dimDate] ([DateKey]);

ALTER TABLE [dbo].[factOrder] CHECK CONSTRAINT [FK_Order_Datum_Required];

ALTER TABLE [dbo].[factOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_Datum_Shipped] FOREIGN KEY([ShippedDatumKey])
REFERENCES [dbo].[dimDate] ([DateKey]);

ALTER TABLE [dbo].[factOrder] CHECK CONSTRAINT [FK_Order_Datum_Shipped];


ALTER TABLE [dbo].[factOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeKey])
REFERENCES [dbo].[dimEmployee] ([EmployeeKey]);

ALTER TABLE [dbo].[factOrder] CHECK CONSTRAINT [FK_Order_Employee];

ALTER TABLE [dbo].[factOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[dimProduct] ([ProductKey]);

ALTER TABLE [dbo].[factOrder] CHECK CONSTRAINT [FK_Order_Product];

ALTER TABLE [dbo].[factOrder]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shipper] FOREIGN KEY([ShipperKey])
REFERENCES [dbo].[dimShipper] ([ShipperKey]);

ALTER TABLE [dbo].[factOrder] CHECK CONSTRAINT [FK_Order_Shipper];

ALTER TABLE [dbo].[factVoorraad]  WITH CHECK ADD  CONSTRAINT [FK_Voorraad_Product] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[dimProduct] ([ProductKey]);

ALTER TABLE [dbo].[factVoorraad] CHECK CONSTRAINT [FK_Voorraad_Product];

ALTER TABLE [dbo].[factVoorraad]  WITH CHECK ADD  CONSTRAINT [FK_Voorraad_Datum] FOREIGN KEY([DatumKey])
REFERENCES [dbo].[dimDate] ([DateKey]);

ALTER TABLE [dbo].[factVoorraad] CHECK CONSTRAINT [FK_Voorraad_Datum];

