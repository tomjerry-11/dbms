Problem Set 5 — Books/Members/Issue
-- 1. Create tables
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    publisher VARCHAR(50),
    price DECIMAL(10,2),
    available_copies INT
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);

CREATE TABLE Issue (
    issue_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- 2. Books by Paulo Coelho
SELECT * FROM Books WHERE author = 'Paulo Coelho';

-- 3. Books issued with member names
SELECT b.title, m.name, i.issue_date
FROM Issue i
JOIN Books b ON i.book_id = b.book_id
JOIN Members m ON i.member_id = m.member_id;

-- 4. Count books issued per member
SELECT m.name, COUNT(i.issue_id) AS books_issued
FROM Members m JOIN Issue i ON m.member_id = i.member_id
GROUP BY m.name;

-- 5. Most expensive book
SELECT * FROM Books WHERE price = (SELECT MAX(price) FROM Books);

-- 6. Books priced between 200 and 500
SELECT * FROM Books WHERE price BETWEEN 200 AND 500;

-- 7. Members who never issued a book
SELECT * FROM Members
WHERE member_id NOT IN (SELECT DISTINCT member_id FROM Issue);

-- 8. Books with 'Science' in title
SELECT * FROM Books WHERE title LIKE '%Science%';

-- 9. Books by Penguin, HarperCollins, or Eden
SELECT * FROM Books WHERE publisher IN ('Penguin', 'HarperCollins', 'Eden');

-- 10. Books returned on 15 April 2025
SELECT b.title, m.name
FROM Issue i
JOIN Books b ON i.book_id = b.book_id
JOIN Members m ON i.member_id = m.member_id
WHERE i.return_date = '2025-04-15';
