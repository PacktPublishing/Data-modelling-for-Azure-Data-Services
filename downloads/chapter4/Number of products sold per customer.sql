SELECT
    CompanyName
    , ProductName
    , YEAR(OrderDate) AS Year
    , SUM(quantity) AS UnitsSold
FROM dbo.OrderDetail AS od
    INNER JOIN dbo.[Order] o ON o.OrderID = od.OrderID
    INNER JOIN dbo.Customer c ON c.CustomerID = o.CustomerID
    INNER JOIN dbo.Product p ON p.ProductId = od.ProductID
GROUP BY CompanyName, YEAR(OrderDate), ProductName
ORDER BY CompanyName, ProductName, YEAR(OrderDate);