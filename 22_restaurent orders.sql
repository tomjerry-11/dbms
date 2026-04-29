Problem Statement 22: Restaurant Orders
CREATE DATABASE RestaurantDB;
USE RestaurantDB;

CREATE TABLE Restaurant(res_id INT PRIMARY KEY,name VARCHAR(50),city VARCHAR(50));
CREATE TABLE Customer(cust_id INT PRIMARY KEY,name VARCHAR(50),phone VARCHAR(20),city VARCHAR(50));
CREATE TABLE Orders(order_id INT PRIMARY KEY,cust_id INT,res_id INT,order_date DATE,amount DECIMAL(8,2),FOREIGN KEY(cust_id) REFERENCES Customer(cust_id),FOREIGN KEY(res_id) REFERENCES Restaurant(res_id));

SELECT * FROM Restaurant WHERE city='Pune';
SELECT DISTINCT c.* FROM Customer c JOIN Orders o ON c.cust_id=o.cust_id WHERE amount>1000;
SELECT c.name,r.name,o.amount FROM Orders o JOIN Customer c ON o.cust_id=c.cust_id JOIN Restaurant r ON o.res_id=r.res_id;
SELECT res_id,COUNT(*) FROM Orders GROUP BY res_id;
SELECT res_id,SUM(amount) total FROM Orders GROUP BY res_id ORDER BY total DESC LIMIT 1;
SELECT * FROM Customer WHERE cust_id NOT IN(SELECT cust_id FROM Orders);
SELECT * FROM Orders WHERE order_date BETWEEN '2024-01-01' AND '2024-03-31';
UPDATE Customer SET city='Mumbai' WHERE cust_id=3;
DELETE FROM Orders WHERE amount<100;
