-- 1. Same CREATE as Problem Set 1

-- 2. Add age column to Customer
ALTER TABLE Customer ADD COLUMN age INT;

-- 3. Orders between 500 and 2000
SELECT o.ord_no, o.purch_amt, c.cust_name, c.city
FROM Orders o JOIN Customer c ON o.customer_id = c.customer_id
WHERE o.purch_amt BETWEEN 500 AND 2000;

-- 4. Salesperson and customer they represent
SELECT c.cust_name, c.city, s.name AS salesman, s.commission
FROM Customer c JOIN Salesman s ON c.salesman_id = s.salesman_id;

-- 5. Full order details
SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name AS salesman, s.commission
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Salesman s ON o.salesman_id = s.salesman_id;

-- 6. Join all three, no duplicate columns
SELECT o.ord_no, o.ord_date, o.purch_amt,
       c.customer_id, c.cust_name, c.city AS cust_city, c.grade,
       s.salesman_id, s.name, s.city AS sal_city, s.commission
FROM Orders o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Salesman s ON o.salesman_id = s.salesman_id;

-- 7. Salespersons in ascending order
SELECT * FROM Salesman ORDER BY name ASC;

-- 8. Orders between 10000 and 20000
SELECT * FROM Orders WHERE purch_amt > 10000 AND purch_amt < 20000;

-- 9. Delete orders <= 100
DELETE FROM Orders WHERE purch_amt <= 100;

-- 10. Remove grade column
ALTER TABLE Customer DROP COLUMN grade;
