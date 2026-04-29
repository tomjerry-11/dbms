-- 1. Create tables
CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5,2)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

CREATE TABLE Orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

-- 2. Highest commission salesperson
SELECT * FROM Salesman WHERE commission = (SELECT MAX(commission) FROM Salesman);

-- 3. Customers with 'da' in name
SELECT * FROM Customer WHERE cust_name LIKE '%da%';

-- 4. Total purchase amount per date
SELECT ord_date, SUM(purch_amt) AS total FROM Orders GROUP BY ord_date;

-- 5. Customer name, order_no, purchase amount
SELECT c.cust_name, o.ord_no, o.purch_amt
FROM Customer c JOIN Orders o ON c.customer_id = o.customer_id;

-- 6. Update city of customer id 5
UPDATE Customer SET city = 'Pune' WHERE customer_id = 5;

-- 7. Salespeople and customers in London
SELECT name AS person, 'Salesman' AS type FROM Salesman WHERE city = 'London'
UNION
SELECT cust_name, 'Customer' FROM Customer WHERE city = 'London';

-- 8. Distinct salespeople and their cities
SELECT DISTINCT salesman_id, city FROM Salesman;

-- 9. Salesperson with highest order on each date
SELECT s.name, s.city, o.ord_date
FROM Salesman s JOIN Orders o ON s.salesman_id = o.salesman_id
WHERE o.purch_amt = (
    SELECT MAX(purch_amt) FROM Orders o2 WHERE o2.ord_date = o.ord_date
);

-- 10. Delete customers in Pune
DELETE FROM Customer WHERE city = 'Pune';
