Problem Set 3 — Company/Item/Sales
-- 1. Create tables
CREATE TABLE Company_mast (
    com_id INT PRIMARY KEY,
    com_name VARCHAR(50)
);

CREATE TABLE Item_mast (
    pro_id INT PRIMARY KEY,
    pro_name VARCHAR(50),
    pro_price DECIMAL(10,2),
    pro_com INT,
    FOREIGN KEY (pro_com) REFERENCES Company_mast(com_id)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    pro_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (pro_id) REFERENCES Item_mast(pro_id)
);

-- 2. Add pro_stock column
ALTER TABLE Item_mast ADD COLUMN pro_stock INT;

-- 3. Average price per company
SELECT c.com_name, AVG(i.pro_price) AS avg_price
FROM Item_mast i JOIN Company_mast c ON i.pro_com = c.com_id
GROUP BY c.com_name;

-- 4. Company names starting with 'A'
SELECT * FROM Company_mast WHERE com_name LIKE 'A%';

-- 5. Same as Q3
SELECT c.com_name, AVG(i.pro_price) AS avg_price
FROM Item_mast i JOIN Company_mast c ON i.pro_com = c.com_id
GROUP BY c.com_name;

-- 6. Companies with avg price > 500
SELECT c.com_name, AVG(i.pro_price) AS avg_price
FROM Item_mast i JOIN Company_mast c ON i.pro_com = c.com_id
GROUP BY c.com_name
HAVING AVG(i.pro_price) > 500;

-- 7. Products with pro_id 101, 102, 105
SELECT * FROM Item_mast WHERE pro_id IN (101, 102, 105);

-- 8. Product count per company
SELECT c.com_name, COUNT(i.pro_id) AS product_count
FROM Company_mast c LEFT JOIN Item_mast i ON c.com_id = i.pro_com
GROUP BY c.com_name;

-- 9. Total sales amount per product
SELECT i.pro_name, SUM(s.quantity * i.pro_price) AS total_sales
FROM Sales s JOIN Item_mast i ON s.pro_id = i.pro_id
GROUP BY i.pro_name;

-- 10. All companies with their products (LEFT JOIN)
SELECT c.com_name, i.pro_name
FROM Company_mast c LEFT JOIN Item_mast i ON c.com_id = i.pro_com;
Problem Set 4 — Trains/Passengers/Reservations/Tickets
-- 1. Create tables
CREATE TABLE Trains (
    train_id INT PRIMARY KEY,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50),
    departure_time TIME,
    arrival_time TIME
);
