Problem Statement 19: Flight Reservation
CREATE DATABASE FlightDB;
USE FlightDB;

CREATE TABLE Flight(flight_id INT PRIMARY KEY,flight_name VARCHAR(50),source VARCHAR(50),destination VARCHAR(50));
CREATE TABLE Passenger(passenger_id INT PRIMARY KEY,name VARCHAR(50),passport_no VARCHAR(30));
CREATE TABLE Booking(booking_id INT PRIMARY KEY,passenger_id INT,flight_id INT,journey_date DATE,fare DECIMAL(8,2),FOREIGN KEY(passenger_id) REFERENCES Passenger(passenger_id),FOREIGN KEY(flight_id) REFERENCES Flight(flight_id));

SELECT * FROM Flight WHERE source='Mumbai' AND destination='Delhi';
SELECT * FROM Passenger WHERE name LIKE 'S%';
SELECT p.name,f.flight_name,b.journey_date FROM Booking b JOIN Passenger p ON b.passenger_id=p.passenger_id JOIN Flight f ON b.flight_id=f.flight_id;
SELECT flight_id,COUNT(*) FROM Booking GROUP BY flight_id;
SELECT flight_id,SUM(fare) total FROM Booking GROUP BY flight_id ORDER BY total DESC LIMIT 1;
SELECT * FROM Passenger WHERE passenger_id NOT IN(SELECT passenger_id FROM Booking);
SELECT * FROM Booking WHERE journey_date='2024-05-01';
UPDATE Booking SET fare=3500 WHERE booking_id=1;
DELETE FROM Booking WHERE fare<500
