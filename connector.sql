-- This query I used to connect MySQL to POWER BI (using Direct Query method)
SELECT  
    o.Order_ID,  
    CAST(o.Order_Date AS DATE) AS Order_Date,  
    o.CityCode,  
    g.CityName,  
    p.Products,  
    p.Category,  
    o.Total_Sales,  
    o.Quantity,  
    o.Order_Status  
FROM Orders o  
JOIN geo g ON o.CityCode = g.CityCode  
JOIN Products p ON o.Product = p.Products  
ORDER BY o.Order_Date DESC;  -- Show most recent orders first