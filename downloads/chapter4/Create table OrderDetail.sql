CREATE TABLE [dbo].[OrderDetail]
(
	OrderID		INT NOT NULL,
	ProductID	INT NOT NULL,
	UnitPrice	MONEY NOT NULL,
	Quantity	SMALLINT NOT NULL,
	Discount	NUMERIC(5, 4) NOT NULL
);


