Problem Statement 21: Movie Booking
CREATE DATABASE MovieDB;
USE MovieDB;

CREATE TABLE Movies(movie_id INT PRIMARY KEY,title VARCHAR(50),genre VARCHAR(50),rating DECIMAL(3,1));
CREATE TABLE Theatre(theatre_id INT PRIMARY KEY,name VARCHAR(50),city VARCHAR(50));
CREATE TABLE Booking(booking_id INT PRIMARY KEY,movie_id INT,theatre_id INT,show_date DATE,seats_booked INT,FOREIGN KEY(movie_id) REFERENCES Movies(movie_id),FOREIGN KEY(theatre_id) REFERENCES Theatre(theatre_id));

SELECT * FROM Movies WHERE rating>4;
SELECT * FROM Theatre WHERE city='Delhi';
SELECT m.title,t.name,b.show_date FROM Booking b JOIN Movies m ON b.movie_id=m.movie_id JOIN Theatre t ON b.theatre_id=t.theatre_id;
SELECT movie_id,SUM(seats_booked) FROM Booking GROUP BY movie_id;
SELECT movie_id,SUM(seats_booked) total FROM Booking GROUP BY movie_id ORDER BY total DESC LIMIT 1;
SELECT * FROM Movies WHERE movie_id NOT IN(SELECT movie_id FROM Booking);
SELECT * FROM Booking WHERE show_date='2024-04-20';
UPDATE Movies SET rating=4.8 WHERE movie_id=1;
DELETE FROM Booking WHERE seats_booked<2;
________________________________________
