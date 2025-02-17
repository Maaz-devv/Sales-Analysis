CREATE DATABASE ecommerce;
use ecommerce;
DESC ecommerce.orders;
DESC ecommerce.products;
DESC ecommerce.geo;
DESC ecommerce.dates;

-- change price column int to decimal
ALTER TABLE ecommerce.products 
CHANGE COLUMN `Price (PKR)` `Price` DECIMAL(10,2);

ALTER TABLE ecommerce.geo 
CHANGE COLUMN `City Code` `CityCode` VARCHAR(50);

ALTER TABLE ecommerce.geo 
MODIFY COLUMN CityCode VARCHAR(50) PRIMARY KEY;



-- Rename 'City' to 'CityCode' in the Orders table
ALTER TABLE ecommerce.orders 
CHANGE COLUMN City CityCode VARCHAR(50);

UPDATE ecommerce.dates 
SET cal_date = STR_TO_DATE(cal_date, '%d-%b-%y');

SET SQL_SAFE_UPDATES = 0;
-- Modify Orders Table Data Types
ALTER TABLE ecommerce.orders 
MODIFY COLUMN Order_ID INT PRIMARY KEY AUTO_INCREMENT,
MODIFY COLUMN CityCode VARCHAR(50),
MODIFY COLUMN Product VARCHAR(255),
MODIFY COLUMN Order_Date DATE,
MODIFY COLUMN Quantity INT,
MODIFY COLUMN Order_Status VARCHAR(50);

-- Modify Products Table Data Types
ALTER TABLE ecommerce.products
MODIFY COLUMN Products VARCHAR(255) PRIMARY KEY,
MODIFY COLUMN Category VARCHAR(100),
MODIFY COLUMN Price DECIMAL(10,2);

-- Modify Inventory Table Data Types
ALTER TABLE ecommerce.inventory
MODIFY COLUMN Products VARCHAR(255) ,
MODIFY COLUMN Category VARCHAR(100) ,
MODIFY COLUMN TotalUnits int,
MODIFY COLUMN UnitsLeft int NULL;

UPDATE ecommerce.inventory 
SET UnitsLeft = NULL 
WHERE UnitsLeft = '';
SET SQL_SAFE_UPDATES = 0;


ALTER TABLE ecommerce.inventory
MODIFY COLUMN Products VARCHAR(255),
MODIFY COLUMN Category VARCHAR(100) PRIMARY KEY,
MODIFY COLUMN TotalUnits INT,
MODIFY COLUMN UnitsLeft INT NULL;


-- Modify Geo Table and Set PK as 'CityCode'
ALTER TABLE ecommerce.geo 
MODIFY COLUMN CityCode VARCHAR(50) PRIMARY KEY,
MODIFY COLUMN CityName VARCHAR(10);

-- Modify Dates Table Data Types
ALTER TABLE ecommerce.dates 
MODIFY COLUMN cal_date DATE PRIMARY KEY,
MODIFY COLUMN Month_num TINYINT,
MODIFY COLUMN month_name VARCHAR(20),
MODIFY COLUMN year YEAR;


-- Create Foreign Key Relationship for CityCode
ALTER TABLE ecommerce.orders 
ADD CONSTRAINT fk_orders_geo FOREIGN KEY (CityCode) REFERENCES ecommerce.geo(CityCode);

-- Create Foreign Key Relationship for Products
ALTER TABLE ecommerce.orders 
ADD CONSTRAINT fk_orders_products FOREIGN KEY (Product) REFERENCES ecommerce.products(Products);

-- Create Foreign Key Relationship for Order_Date
ALTER TABLE ecommerce.orders 
ADD CONSTRAINT fk_orders_dates FOREIGN KEY (Order_Date) REFERENCES ecommerce.dates(cal_date);



SELECT DISTINCT Product 
FROM ecommerce.orders 
WHERE Product NOT IN (SELECT Products FROM ecommerce.products);

UPDATE ecommerce.orders 
SET Product = REPLACE(Product, "'", "’");

-- fixing typing issues 
UPDATE ecommerce.orders 
SET Product = 'Non-Stick Cookware Set - Prestige 5-Piece Set' 
WHERE Product = 'Non-Stick Cookware Set - Prestige 5-Piece';


SELECT DISTINCT Order_Date 
FROM ecommerce.orders 
WHERE Order_Date NOT IN (SELECT cal_date FROM ecommerce.dates);

INSERT INTO ecommerce.dates (cal_date)
SELECT DISTINCT Order_Date 
FROM ecommerce.orders 
WHERE Order_Date NOT IN (SELECT cal_date FROM ecommerce.dates);



SELECT 
    o.Order_ID, 
    o.CityCode, 
    o.Product, 
    o.Order_Date, 
    o.Quantity, 
    p.Price, 
    CASE 
        WHEN o.Order_Status = 'Shipped' THEN o.Quantity * p.Price 
        ELSE 0 
    END AS Total_Sales
FROM ecommerce.orders o
JOIN ecommerce.products p ON o.Product = p.Products
WHERE o.Order_Status = 'Shipped';

-- add new column total_sales
ALTER TABLE ecommerce.orders ADD COLUMN Total_Sales DECIMAL(10,2);

-- Update column so only shipped order amount add in this column
UPDATE ecommerce.orders o
JOIN ecommerce.products p ON o.Product = p.Products
SET o.Total_Sales = CASE 
     WHEN o.Order_Status = 'Shipped' THEN o.Quantity * p.Price 
     ELSE 0 
 END;

-- for fix some typing issues in dataset
UPDATE ecommerce.products 
SET Price = CASE 
    WHEN Products = 'Wireless Earbuds - Audionic AirBuds 2' THEN 4500
    WHEN Products = 'Power Bank - Romoss 20000mAh' THEN 4000
    WHEN Products = 'Gaming Mouse - Redragon M711 Cobra' THEN 4000
    WHEN Products = 'Bluetooth Speaker - Audionic Mehfil Speaker' THEN 5000
    WHEN Products = 'Smartwatch - Xiaomi Mi Band 7' THEN 4500
    WHEN Products = 'Men’s Kurta - J. Cotton Kurta' THEN 4200
    WHEN Products = 'Women’s Lawn Suit - Khaadi 3-Piece Lawn' THEN 5000
    WHEN Products = 'Men’s Sneakers - Servis Cheetah Shoes' THEN 5200
    WHEN Products = 'Women’s Handbag - Stylo Leather Bag' THEN 4800
    WHEN Products = 'Men’s Formal Shirt - Bonanza Satrangi Shirt' THEN 3200
    WHEN Products = 'Electric Kettle - Dawlance 1.7L Kettle' THEN 6000
    WHEN Products = 'Rice Cooker - Westpoint 1.8L Rice Cooker' THEN 5500
    WHEN Products = 'Bed Sheet Set - Sapphire Cotton Bedsheet' THEN 4000
    WHEN Products = 'Non-Stick Cookware Set - Prestige 5-Piece Set' THEN 5000
    WHEN Products = 'Wall Clock - Quartz Designer Clock' THEN 3500
END
WHERE Products IN (
    'Wireless Earbuds - Audionic AirBuds 2',
    'Power Bank - Romoss 20000mAh',
    'Gaming Mouse - Redragon M711 Cobra',
    'Bluetooth Speaker - Audionic Mehfil Speaker',
    'Smartwatch - Xiaomi Mi Band 7',
    'Men’s Kurta - J. Cotton Kurta',
    'Women’s Lawn Suit - Khaadi 3-Piece Lawn',
    'Men’s Sneakers - Servis Cheetah Shoes',
    'Women’s Handbag - Stylo Leather Bag',
    'Men’s Formal Shirt - Bonanza Satrangi Shirt',
    'Electric Kettle - Dawlance 1.7L Kettle',
    'Rice Cooker - Westpoint 1.8L Rice Cooker',
    'Bed Sheet Set - Sapphire Cotton Bedsheet',
    'Non-Stick Cookware Set - Prestige 5-Piece Set',
    'Wall Clock - Quartz Designer Clock'
);

-- This query I used to connect MySQL to POWER BI (using Direct query method)
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

