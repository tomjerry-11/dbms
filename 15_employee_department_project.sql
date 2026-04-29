Problem Statement 15: Employee Department Project
CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Department(dept_id INT PRIMARY KEY,dept_name VARCHAR(50),location VARCHAR(50));
CREATE TABLE Employee(emp_id INT PRIMARY KEY,name VARCHAR(50),dept_id INT,salary DECIMAL(10,2),hire_date DATE,FOREIGN KEY(dept_id) REFERENCES Department(dept_id));
CREATE TABLE Project(proj_id INT PRIMARY KEY,proj_name VARCHAR(50),dept_id INT,budget DECIMAL(12,2),FOREIGN KEY(dept_id) REFERENCES Department(dept_id));

SELECT * FROM Employee WHERE salary>(SELECT AVG(salary) FROM Employee);

SELECT dept_id,SUM(salary) total FROM Employee GROUP BY dept_id ORDER BY total DESC LIMIT 1;

SELECT * FROM Employee WHERE hire_date>=DATE_SUB(CURDATE(),INTERVAL 2 YEAR);

SELECT e.name,d.dept_name FROM Employee e JOIN Department d ON e.dept_id=d.dept_id;

SELECT dept_id,COUNT(*) FROM Employee GROUP BY dept_id;

SELECT * FROM Employee WHERE dept_id IS NULL;

UPDATE Employee SET salary=salary*1.10 WHERE dept_id=(SELECT dept_id FROM Department WHERE dept_name='IT');

DELETE FROM Employee WHERE salary<20000;

CREATE VIEW Emp_View AS SELECT e.name,d.dept_name,e.salary FROM Employee e JOIN Department d ON e.dept_id=d.dept_id;
