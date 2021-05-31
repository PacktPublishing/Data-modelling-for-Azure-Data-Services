ALTER TABLE dbo.[Order]
ADD CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID)
    REFERENCES dbo.Customer (CustomerID);
GO
/*
ALTER TABLE dbo.[order]
WITH CHECK ADD CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID)
    REFERENCES dbo.Customer (CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE;
*/

ALTER TABLE dbo.[Order]
ADD CONSTRAINT FK_Order_Shipper FOREIGN KEY (ShipVia)
    REFERENCES dbo.Shipper (ShipperID);
GO

ALTER TABLE dbo.[Order]
ADD CONSTRAINT FK_Order_Employee FOREIGN KEY (EmployeeID)
    REFERENCES dbo.Employee (EmployeeID);
GO

ALTER TABLE dbo.OrderDetail
ADD CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (OrderID)
    REFERENCES dbo.[Order] (OrderID);
GO

ALTER TABLE dbo.OrderDetail
ADD CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (ProductID)
    REFERENCES dbo.Product (ProductID);
GO

ALTER TABLE dbo.Product
ADD CONSTRAINT FK_Product_ProductCategory FOREIGN KEY (CategoryID)
    REFERENCES dbo.ProductCategory (CategoryID);
GO

ALTER TABLE dbo.Product
ADD CONSTRAINT FK_Product_Supplier FOREIGN KEY (SupplierID)
    REFERENCES dbo.Supplier (SupplierID);
GO




