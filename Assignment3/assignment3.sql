-- My query is to run a transaction with an existing customer with a customer profile, it edits the stock levels to reflect the purchase. I have also commented out other varying queries that I successfully ran using my database, as I could not think on a way to create a situation where all these things would be used in one query?

-- delete database if it exists
DROP DATABASE IF EXISTS fashion_shop;

--create database
CREATE DATABASE fashion_shop;

USE fashion_shop;

-- clothing Table (I used decimal instead of float for prices)
CREATE TABLE clothing (
    upc INT PRIMARY KEY,
    product_name VARCHAR(255),
    season VARCHAR(100),
    price DECIMAL(6 , 2 ) NOT NULL,
    colour_code VARCHAR(10),
    product_size VARCHAR(5),
    quantity INT(3)
);
-- jewellery Table (I used decimal instead of float for prices)
CREATE TABLE jewellery (
    upc INT PRIMARY KEY,
    product_name VARCHAR(255),
    season VARCHAR(100),
    price DECIMAL(6 , 2 ) NOT NULL,
    colour_code VARCHAR(10),
    product_size VARCHAR(10),
    quantity INT(3)
);
-- packaging table alerts when low in stock. 
CREATE TABLE packaging (
    upc INT PRIMARY KEY,
    product_name VARCHAR(255),
    quantity INT(4)
);
-- VIP table
CREATE TABLE vips (
    customer_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20) UNIQUE,
    points_earned INT(5) NOT NULL,
    vip_status tinyint(1) DEFAULT NULL
);
-- purchase table
CREATE TABLE purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL, 
    SalesAmount DECIMAL(6 , 2 ) NOT NULL,
    purchase_date DATE,
    FOREIGN KEY (customer_id) REFERENCES vips(customer_id)
);

-- to help increase and decrease stock levels
ALTER TABLE purchases
ADD COLUMN clothing_upc INT,
ADD COLUMN jewellery_upc INT;

-- giving packaging minimum values
ALTER TABLE packaging
ADD COLUMN min_quantity INT(4) DEFAULT 10; 

-- Add foreign key for clothing
ALTER TABLE purchases
ADD CONSTRAINT fk_purchases_clothing_upc
FOREIGN KEY (clothing_upc) REFERENCES clothing(upc);

-- Add foreign key for jewellery
ALTER TABLE purchases
ADD CONSTRAINT fk_purchases_jewellery_upc
FOREIGN KEY (jewellery_upc) REFERENCES jewellery(upc);

-- Sample Data for clothing table:
INSERT INTO clothing (upc, product_name, season, price, colour_code, product_size, quantity)
VALUES
  (80501, 'Panther Skirt', 'AW25', 500, 103, 'S', 2),
  (80502, 'Krall Shirt', 'SS22', 150, 503, 'M', 4),
  (80503, 'Drunken Jacket', 'AW25', 980, 032, 'S', 1),
  (80504, 'Foam Skirt', 'SS24', 770.05, 505, 'XS', 2),
  (80505, 'Bat Coat', 'SS24', 1080.20, 504, 'L', 1),
  (80506, 'Foam Skirt', 'SS24', 770.05, 505, 'XS', 2),
  (80507, 'CJ Kilt', 'AW24', 900, 505, 'M', 3),
  (80508, 'Balloon Trousers', 'SS24', 385, 104, 'L', 5);
  -- Sample Data for jewellery table:
INSERT INTO jewellery (upc, product_name, season, price, colour_code, product_size, quantity)
VALUES
  (80523, 'Mini Bas choker', 'SS21', 155.20, 102, 'OS' , 30),
  (80524, 'Grace Cuff', 'SS24', 120, 102, 'OS' , 5),
  (80525, 'Tilly Ring', 'AW25', 90.05, 100, 'S', 6),
  (80526, 'Mayfair Pendant', 'SS21', 100, 102, 'OS' , 26),
  (80527, 'Shelley Pendant', 'SS24', 300, 102, 'OS' , 2),
  (80528, 'Ismene Ring', '	AW25', 105.50, 100, 'XXS', 4),
  (80529, 'Petra Hair Clip', 'SS24', 110.10, 406, 'OS', 5),
  (80530, 'Bumble Bee Brooch', 'SS25', 105.55, 102, 'OS', 20);
    -- Sample Data for packaging table:
INSERT INTO packaging (upc, product_name, quantity)
VALUES
  (83523, 'carrier_bag', 200),
  (83524, 'small_box', 50),
  (83525, 'medium_box', 99),
  (83526, 'garment_bag', 60);  
    -- Sample Data for vips table:
INSERT INTO vips (customer_id, first_name, last_name, email, phone_number, points_earned, vip_status)
VALUES
  (0101, 'Mary', 'Murdoch', 'm.murd0@gmail.com', 0770667986, 10, false),
  (0102, 'Tom', 'Mcgeary', 'tommy18@outlook.com', 0773927729, 50, false),
  (0103, 'Fiona', 'Sun', 'sunny432@hotmail.com', NULL, 7, false),
  (0104, 'Samantha', 'Fernando', 'smileysam@gmail.com', 0783927149, 60, false),
  (0105, 'Bill', 'Mackay', 'bm@jb.com', NULL, 30, false),
  (0106, 'Sama', 'Sade', 'smjuyvgy@gmail.com', 0783925539, 310, true),
  (0107, 'Sara', 'Smith', 'sara@me.com', 07839272349, 100, true),
  (0108, 'Robert', 'Frank', 'sfsks@gmail.com', 0783940049, 230, true);
      -- Sample Data for purchases table: date in built function
INSERT INTO purchases (customer_id, SalesAmount, purchase_date) 
VALUES
  (0108, CAST(560.05 AS Decimal(6, 2)), '2024-09-01'),
  (0108, CAST(1000.10 AS Decimal(6, 2)), '2025-02-22'),
  (0101, CAST(120.25 AS Decimal(6, 2)), '2025-12-02'),
  (0104, CAST(56.25 AS Decimal(6, 2)), '2025-06-22'),
  (0101, CAST(42.05 AS Decimal(6, 2)), '2025-02-27'),
  (0102, CAST(600.10 AS Decimal(6, 2)), '2025-08-22'),
  (0102, CAST(58.05 AS Decimal(6, 2)), '2021-09-22'),
  (0107, CAST(1050.05 AS Decimal(6, 2)), '2023-02-22'),
  (0107, CAST(67.40 AS Decimal(6, 2)), '2024-02-12'),
  (0106, CAST(89.05 AS Decimal(6, 2)), '2025-12-12'),
  (0103, CAST(255.05 AS Decimal(6, 2)), '2023-09-22'),
  (0105, CAST(60.05 AS Decimal(6, 2)), '2025-12-12');


-- inserting data
INSERT INTO clothing (upc, product_name, season, price, colour_code, product_size, quantity)
VALUES
  (80111, 'Panther Skirt', 'AW25', 500, 103, 'M', 5),
  (80545, 'Krall Shirt', 'SS22', 150, 503, 'XL', 2);
  
INSERT INTO purchases (customer_id, SalesAmount, purchase_date, clothing_upc)
VALUES 
   (0105, 500.00, '2025-02-22', 80501);

INSERT INTO jewellery (upc, product_name, season, price, colour_code, product_size, quantity)
VALUES
  (80666, 'Mini Bas choker', 'SS21', 155.20, 107, 'OS', 3),
  (80566, 'Grace Pendant', 'SS24', 120, 100, 'OS', 12),
  (89529, 'Tilly Ring', 'AW25', 90.05, 140, 'XXS', 3);
  
INSERT INTO packaging (upc, product_name, quantity)
VALUES
  (83773, 'gift with purchase', 20);
  
-- Select customer and item
SELECT 
    v.customer_id, v.first_name, v.last_name, v.email, v.phone_number,
    p.purchase_id, p.SalesAmount, p.purchase_date,
    c.product_name AS clothing_product,
    c.price AS clothing_price,
    c.product_size AS clothing_size,
    c.quantity AS remaining_stock
FROM
    vips v
JOIN 
    purchases p ON v.customer_id = p.customer_id
LEFT JOIN 
    clothing c ON c.upc = p.clothing_upc
WHERE
    v.customer_id = 0105;

-- subtract the purchased items from stock
UPDATE clothing
SET quantity = quantity - 1
WHERE upc = (
    SELECT clothing_upc
    FROM purchases
    WHERE purchase_id = 25
    LIMIT 1
);

COMMIT;
    
-- to undo 
-- ROLLBACK;

-- to check the quantity
-- SELECT *
-- FROM clothing;
    
-- 4. query check if customer is VIP

-- SELECT
--   customer_id, first_name, last_name, email, vip_status
-- FROM 
--   vips
-- WHERE 
--   vip_status = true;
   
-- 5. query find SS24 season ordered by price

-- SELECT * 
-- FROM clothing
-- WHERE season = 'SS24'
-- ORDER BY price ASC;
   
-- delete data
-- DELETE FROM jewellery 
-- WHERE upc = 80529 
--  AND product_name = 'Petra Hair Clip' 
--  AND season = 'SS24' 
--  AND price = 110.10 
--  AND colour_code = 406 
--  AND product_size = 'OS' 
--  AND quantity = 5;
  
-- SELECT *

-- FROM jewellery

-- Creating a Stored procedure to fetch customers by VIP status
DELIMITER $$

CREATE PROCEDURE GetCustomersByVIPStatus(IN vipStatus TINYINT)
BEGIN
    SELECT customer_id, first_name, last_name
    FROM vips
    WHERE vip_status = vipStatus;
END $$

--DELIMITER ;

-- to call this shortcut
-- CALL GetCustomersByVIPStatus(1);

-- CALL GetCustomersByVIPStatus(0);

-- to check when packaging needs ordered 
DELIMITER $$

CREATE PROCEDURE PackagingLow(IN min_quantity INT)
BEGIN
    SELECT upc, product_name, quantity 
    FROM packaging
    WHERE quantity < min_quantity;
END $$

DELIMITER ;

-- to see what packaging needs restocked
-- CALL PackagingLow(10);