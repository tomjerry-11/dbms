Problem Statement 13: Library Management
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 1 Create tables
CREATE TABLE Books(book_id INT PRIMARY KEY,title VARCHAR(50),author VARCHAR(50),price DECIMAL(8,2));
CREATE TABLE Members(member_id INT PRIMARY KEY,name VARCHAR(50),city VARCHAR(50));
CREATE TABLE Borrow(book_id INT,member_id INT,borrow_date DATE,return_date DATE,FOREIGN KEY(book_id) REFERENCES Books(book_id),FOREIGN KEY(member_id) REFERENCES Members(member_id));

-- 2 Books price greater than 500
SELECT * FROM Books WHERE price>500;

-- 3 Books borrowed in March 2024
SELECT * FROM Borrow WHERE MONTH(borrow_date)=3 AND YEAR(borrow_date)=2024;

-- 4 Members borrowed more than 2 books
SELECT member_id,COUNT(*) FROM Borrow GROUP BY member_id HAVING COUNT(*)>2;

-- 5 Total borrowed books value per member
SELECT m.name,SUM(b.price) total_value FROM Members m JOIN Borrow br ON m.member_id=br.member_id JOIN Books b ON br.book_id=b.book_id GROUP BY m.name;

-- 6 Most expensive book
SELECT * FROM Books WHERE price=(SELECT MAX(price) FROM Books);

-- 7 Authors with books below average price
SELECT DISTINCT author FROM Books WHERE price<(SELECT AVG(price) FROM Books);

-- 8 Update DBMS book price
UPDATE Books SET price=650 WHERE title='DBMS';

-- 9 Members and borrowed books
SELECT m.name,b.title FROM Members m JOIN Borrow br ON m.member_id=br.member_id JOIN Books b ON br.book_id=b.book_id;

-- 10 Delete borrow records with null return
DELETE FROM Borrow WHERE return_date IS NULL;
