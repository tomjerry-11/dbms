Problem Set 6 — Hotel/Room/Customer/Booking
-- 1. Create tables
CREATE TABLE Hotel (
    hotel_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Room (
    room_id INT PRIMARY KEY,
    hotel_id INT,
    type VARCHAR(30),
    price DECIMAL(10,2),
    available BOOLEAN,
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

-- 2. Available Deluxe rooms
SELECT * FROM Room WHERE type = 'Deluxe' AND available = TRUE;

-- 3. Suite rooms OR price > 5000
SELECT * FROM Room WHERE type = 'Suite' OR price > 5000;

-- 4. Customers who never booked
SELECT * FROM Customer
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Booking);

-- 5. All bookings with customer and room details
SELECT b.booking_id, c.name, r.type, r.price, b.check_in, b.check_out
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
JOIN Room r ON b.room_id = r.room_id;

-- 6. Room availability with hotel name
SELECT h.name AS hotel, r.room_id, r.type, r.available
FROM Room r JOIN Hotel h ON r.hotel_id = h.hotel_id;

-- 7. Total bookings per hotel
SELECT h.name, COUNT(b.booking_id) AS total_bookings
FROM Hotel h
JOIN Room r ON h.hotel_id = r.hotel_id
JOIN Booking b ON r.room_id = b.room_id
GROUP BY h.name;

-- 8. Bookings per customer
SELECT c.name, COUNT(b.booking_id) AS total_bookings
FROM Customer c JOIN Booking b ON c.customer_id = b.customer_id
GROUP BY c.name;

-- 9. Customers checked in 12 Apr and out 15 Apr
SELECT c.* FROM Customer c JOIN Booking b ON c.customer_id = b.customer_id
WHERE b.check_in = '2025-04-12' AND b.check_out = '2025-04-15';

-- 10. Delete hotels with Deluxe rooms
DELETE FROM Hotel WHERE hotel_id IN (
    SELECT hotel_id FROM Room WHERE type = 'Deluxe'
);
