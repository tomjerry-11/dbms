Problem Set 10 — Product/Customer/Purchase
-- 1. Create tables
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Purchase (
    purchase_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    quantity INT,
    purchase_date DATE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- 2. Electronics products
SELECT * FROM Product WHERE category = 'Electronics';

-- 3. Customers who bought more than 3 products
SELECT customer_id, COUNT(*) AS total
FROM Purchase GROUP BY customer_id HAVING COUNT(*) > 3;

-- 4. Total amount spent per customer
SELECT c.name, SUM(p.price * pu.quantity) AS total_spent
FROM Purchase pu
JOIN Product p ON pu.product_id = p.product_id
JOIN Customer c ON pu.customer_id = c.customer_id
GROUP BY c.name;

-- 5. Top 2 most purchased products
SELECT product_id, SUM(quantity) AS total_qty
FROM Purchase GROUP BY product_id
ORDER BY total_qty DESC LIMIT 2;

-- 6. Update price of product_id 10
UPDATE Product SET price = 999 WHERE product_id = 10;

-- 7. Delete purchases older than 2022
DELETE FROM Purchase WHERE YEAR(purchase_date) < 2022;

-- 8. Join all 3 tables
SELECT c.name AS customer, p.name AS product, pu.quantity
FROM Purchase pu
JOIN Customer c ON pu.customer_id = c.customer_id
JOIN Product p ON pu.product_id = p.product_id;

-- 9. Products below average price
SELECT * FROM Product WHERE price < (SELECT AVG(price) FROM Product);

-- 10. Cities with at least 2 customers
SELECT city, COUNT(*) FROM Customer GROUP BY city HAVING COUNT(*) >= 2;
