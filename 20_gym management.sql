Problem Statement 20: Gym Management
CREATE DATABASE GymDB;
USE GymDB;

CREATE TABLE Trainer(trainer_id INT PRIMARY KEY,name VARCHAR(50),specialization VARCHAR(50));
CREATE TABLE Member(member_id INT PRIMARY KEY,name VARCHAR(50),age INT,trainer_id INT,FOREIGN KEY(trainer_id) REFERENCES Trainer(trainer_id));
CREATE TABLE Workout(workout_id INT PRIMARY KEY,member_id INT,trainer_id INT,workout_date DATE,duration INT,FOREIGN KEY(member_id) REFERENCES Member(member_id),FOREIGN KEY(trainer_id) REFERENCES Trainer(trainer_id));

SELECT * FROM Member WHERE age BETWEEN 20 AND 40;
SELECT * FROM Trainer WHERE specialization='Yoga';
SELECT m.name,t.name,w.workout_date FROM Workout w JOIN Member m ON w.member_id=m.member_id JOIN Trainer t ON w.trainer_id=t.trainer_id;
SELECT member_id,COUNT(*) FROM Workout GROUP BY member_id;
SELECT trainer_id,COUNT(*) FROM Workout GROUP BY trainer_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT * FROM Member WHERE member_id NOT IN(SELECT member_id FROM Workout);
SELECT * FROM Workout WHERE workout_date='2024-04-10';
UPDATE Member SET age=28 WHERE member_id=2;
DELETE FROM Workout WHERE duration<30;
