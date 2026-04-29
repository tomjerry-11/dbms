Problem Statement 12: Hospital Management
Tables: Doctor(doc_id,name,specialization), Patient(patient_id,name,city), Appointment(app_id,doc_id,patient_id,app_date,fees)
-- Create Database
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- 1 Create Tables
CREATE TABLE Doctor(doc_id INT PRIMARY KEY, name VARCHAR(50) NOT NULL, specialization VARCHAR(50) NOT NULL);
CREATE TABLE Patient(patient_id INT PRIMARY KEY, name VARCHAR(50) NOT NULL, city VARCHAR(50));
CREATE TABLE Appointment(app_id INT PRIMARY KEY, doc_id INT, patient_id INT, app_date DATE, fees DECIMAL(8,2), FOREIGN KEY(doc_id) REFERENCES Doctor(doc_id), FOREIGN KEY(patient_id) REFERENCES Patient(patient_id));

-- 2 Appointments in April 2024
SELECT * FROM Appointment WHERE app_date BETWEEN '2024-04-01' AND '2024-04-30';

-- 3 Doctors with highest consultation fees
SELECT d.name,SUM(a.fees) total_fees FROM Doctor d JOIN Appointment a ON d.doc_id=a.doc_id GROUP BY d.name ORDER BY total_fees DESC LIMIT 1;

-- 4 Total appointments per doctor
SELECT d.name,COUNT(a.app_id) total_appointments FROM Doctor d JOIN Appointment a ON d.doc_id=a.doc_id GROUP BY d.name;

-- 5 Patients treated by cardiologists
SELECT DISTINCT p.* FROM Patient p JOIN Appointment a ON p.patient_id=a.patient_id JOIN Doctor d ON a.doc_id=d.doc_id WHERE specialization='Cardiologist';

-- 6 Update specialization
UPDATE Doctor SET specialization='Dermatology' WHERE doc_id=2;

-- 7 Doctors with more than 5 appointments
SELECT d.name FROM Doctor d JOIN Appointment a ON d.doc_id=a.doc_id GROUP BY d.name HAVING COUNT(*)>5;

-- 8 Patients from Mumbai
SELECT * FROM Patient WHERE city='Mumbai';

-- 9 Doctor patient appointment join
SELECT d.name,p.name,a.app_date FROM Doctor d JOIN Appointment a ON d.doc_id=a.doc_id JOIN Patient p ON a.patient_id=p.patient_id;

-- 10 Delete appointments fees below 200
DELETE FROM Appointment WHERE fees<200;
