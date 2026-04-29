Problem Statement 14: Student Hostel Library
CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Student(student_id INT PRIMARY KEY,name VARCHAR(50),course VARCHAR(50));
CREATE TABLE Hostel(student_id INT PRIMARY KEY,room_no INT,FOREIGN KEY(student_id) REFERENCES Student(student_id));
CREATE TABLE Library(student_id INT,book_issued_date DATE,FOREIGN KEY(student_id) REFERENCES Student(student_id));

-- Students staying in hostel
SELECT s.* FROM Student s JOIN Hostel h ON s.student_id=h.student_id;

-- Issued books but not in hostel
SELECT * FROM Student WHERE student_id IN(SELECT student_id FROM Library) AND student_id NOT IN(SELECT student_id FROM Hostel);

-- In hostel or library
SELECT * FROM Student WHERE student_id IN(SELECT student_id FROM Hostel UNION SELECT student_id FROM Library);

-- In both
SELECT * FROM Student WHERE student_id IN(SELECT student_id FROM Hostel INTERSECT SELECT student_id FROM Library);

-- Count per course
SELECT course,COUNT(*) FROM Student GROUP BY course;

-- Not issued books
SELECT * FROM Student WHERE student_id NOT IN(SELECT student_id FROM Library);

-- Latest issue date
SELECT student_id,MAX(book_issued_date) FROM Library GROUP BY student_id;

-- Total students in hostel
SELECT COUNT(*) FROM Hostel;

-- Average books issued per student
SELECT AVG(bookcount) FROM(SELECT COUNT(*) bookcount FROM Library GROUP BY student_id)x;
