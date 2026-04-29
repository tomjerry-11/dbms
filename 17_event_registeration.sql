Problem Statement 17: Event Registration
CREATE DATABASE EventDB;
USE EventDB;

CREATE TABLE Event(event_id INT PRIMARY KEY,name VARCHAR(50),location VARCHAR(50),date DATE);
CREATE TABLE Participant(participant_id INT PRIMARY KEY,name VARCHAR(50),email VARCHAR(50));
CREATE TABLE Registration(reg_id INT PRIMARY KEY,event_id INT,participant_id INT,reg_date DATE,fee DECIMAL(8,2),FOREIGN KEY(event_id) REFERENCES Event(event_id),FOREIGN KEY(participant_id) REFERENCES Participant(participant_id));

SELECT * FROM Event WHERE location='Pune';

SELECT * FROM Participant WHERE name LIKE '%an%';

SELECT e.name,p.name,r.reg_date FROM Registration r JOIN Event e ON r.event_id=e.event_id JOIN Participant p ON r.participant_id=p.participant_id;

SELECT event_id,COUNT(*) FROM Registration GROUP BY event_id;

SELECT event_id,SUM(fee) total FROM Registration GROUP BY event_id ORDER BY total DESC LIMIT 1;

SELECT * FROM Participant WHERE participant_id NOT IN(SELECT participant_id FROM Registration);

SELECT * FROM Registration WHERE reg_date='2024-04-12';

UPDATE Registration SET fee=500 WHERE reg_id=2;

DELETE FROM Registration WHERE fee<200;
