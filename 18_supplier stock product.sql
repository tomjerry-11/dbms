Problem Statement 18: Supplier Product Stock
CREATE DATABASE StockDB;
USE StockDB;

CREATE TABLE Supplier(supplier_id INT PRIMARY KEY,name VARCHAR(50),city VARCHAR(50));
CREATE TABLE Product(product_id INT PRIMARY KEY,name VARCHAR(50),price DECIMAL(8,2),supplier_id INT,FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id));
CREATE TABLE Stock(stock_id INT PRIMARY KEY,product_id INT,quantity INT,last_updated DATE,FOREIGN KEY(product_id) REFERENCES Product(product_id));

SELECT * FROM Product WHERE price>1000;
SELECT * FROM Supplier WHERE city='Pune';
SELECT p.name,s.name FROM Product p JOIN Supplier s ON p.supplier_id=s.supplier_id;
SELECT product_id,SUM(quantity) FROM Stock GROUP BY product_id;
SELECT product_id FROM Stock ORDER BY quantity DESC LIMIT 1;
SELECT * FROM Stock WHERE quantity=0;
SELECT * FROM Stock WHERE last_updated>'2024-01-01';
UPDATE Product SET price=1500 WHERE product_id=1;
DELETE FROM Product WHERE price<100;
