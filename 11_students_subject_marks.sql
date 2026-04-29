Problem Set 11 — Student/Subject/Marks
-- 1. Create tables
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    class VARCHAR(20)
);

CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Marks (
    student_id INT,
    subject_id INT,
    marks INT,
    exam_date DATE,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

-- 2. Average marks per student
SELECT s.name, AVG(m.marks) AS avg_marks
FROM Student s JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name;

-- 3. Students who failed (marks < 40)
SELECT DISTINCT s.name FROM Student s
JOIN Marks m ON s.student_id = m.student_id
WHERE m.marks < 40;

-- 4. Top 3 scorers
SELECT s.name, SUM(m.marks) AS total
FROM Student s JOIN Marks m ON s.student_id = m.student_id
GROUP BY s.name ORDER BY total DESC LIMIT 3;

-- 5. Subject with highest average marks
SELECT sub.name, AVG(m.marks) AS avg_marks
FROM Subject sub JOIN Marks m ON sub.subject_id = m.subject_id
GROUP BY sub.name
ORDER BY avg_marks DESC LIMIT 1;

-- 6. Update marks
UPDATE Marks SET marks = 85 WHERE student_id = 2 AND subject_id = 3;

-- 7. Delete NULL marks
DELETE FROM Marks WHERE marks IS NULL;

-- 8. Student name, subject name, marks
SELECT s.name, sub.name AS subject, m.marks
FROM Marks m
JOIN Student s ON m.student_id = s.student_id
JOIN Subject sub ON m.subject_id = sub.subject_id;

-- 9. Students who scored more than average in Math
SELECT s.name, m.marks FROM Student s
JOIN Marks m ON s.student_id = m.student_id
JOIN Subject sub ON m.subject_id = sub.subject_id
WHERE sub.name = 'Math'
AND m.marks > (
    SELECT AVG(m2.marks) FROM Marks m2
    JOIN Subject s2 ON m2.subject_id = s2.subject_id
    WHERE s2.name = 'Math'
);

-- 10. Total marks per subject
SELECT sub.name, SUM(m.marks) AS total
FROM Subject sub JOIN Marks m ON sub.subject_id = m.subject_id
GROUP BY sub.name;
