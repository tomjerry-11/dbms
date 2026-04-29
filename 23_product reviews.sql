Problem Statement 23: Product Reviews
CREATE DATABASE ReviewDB;
USE ReviewDB;

CREATE TABLE Users(user_id INT PRIMARY KEY,name VARCHAR(50),email VARCHAR(50));
CREATE TABLE Products(product_id INT PRIMARY KEY,name VARCHAR(50),price DECIMAL(8,2));
CREATE TABLE Reviews(review_id INT PRIMARY KEY,user_id INT,product_id INT,rating INT,comment VARCHAR(100),FOREIGN KEY(user_id) REFERENCES Users(user_id),FOREIGN KEY(product_id) REFERENCES Products(product_id));

SELECT product_id,AVG(rating) FROM Reviews GROUP BY product_id;

SELECT product_id FROM Reviews GROUP BY product_id HAVING AVG(rating)>4;

SELECT user_id,COUNT(*) FROM Reviews GROUP BY user_id HAVING COUNT(*)>3;

SELECT p.name,u.name,r.rating FROM Reviews r JOIN Products p ON r.product_id=p.product_id JOIN Users u ON r.user_id=u.user_id;

SELECT * FROM Products WHERE product_id NOT IN(SELECT product_id FROM Reviews);

UPDATE Reviews SET rating=5 WHERE review_id=2;

DELETE FROM Reviews WHERE rating<2;

SELECT product_id,AVG(rating) FROM Reviews GROUP BY product_id HAVING AVG(rating)>3.5;

SELECT review_id,CASE WHEN rating>=4 THEN 'Good' WHEN rating=3 THEN 'Average' ELSE 'Poor' END AS Category FROM Reviews;

