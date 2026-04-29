Problem Statement 16: Banking System
CREATE DATABASE BankDB;
USE BankDB;

CREATE TABLE Customer(cust_id INT PRIMARY KEY,name VARCHAR(50),city VARCHAR(50));
CREATE TABLE Account(acc_no INT PRIMARY KEY,cust_id INT,balance DECIMAL(12,2),acc_type VARCHAR(30),FOREIGN KEY(cust_id) REFERENCES Customer(cust_id));
CREATE TABLE Transaction(trans_id INT PRIMARY KEY,acc_no INT,amount DECIMAL(10,2),trans_type VARCHAR(20),trans_date DATE,FOREIGN KEY(acc_no) REFERENCES Account(acc_no));

SELECT * FROM Account WHERE balance>50000;

SELECT cust_id,SUM(balance) FROM Account GROUP BY cust_id;

SELECT c.name,t.* FROM Customer c JOIN Account a ON c.cust_id=a.cust_id JOIN Transaction t ON a.acc_no=t.acc_no;

SELECT acc_no,COUNT(*) FROM Transaction GROUP BY acc_no;

SELECT * FROM Customer WHERE cust_id NOT IN(SELECT cust_id FROM Account a JOIN Transaction t ON a.acc_no=t.acc_no);

UPDATE Account SET balance=balance+1000 WHERE acc_type='Savings';

DELETE FROM Transaction WHERE trans_date<DATE_SUB(CURDATE(),INTERVAL 3 YEAR);

SELECT MAX(amount) FROM Transaction;

CREATE VIEW Customer_Account AS SELECT c.name,a.acc_no,a.balance FROM Customer c JOIN Account a ON c.cust_id=a.cust_id;
    