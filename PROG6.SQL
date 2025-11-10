CREATE DATABASE HospitalDB;
USE HospitalDB;

-- ======================================================================
-- Step 2: Create Tables
-- Create the relational schema for Patients and Visits.

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    doctor_id INT,
    diagnosis VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- OUTPUT:
-- (After creating tables, run DESC Patients; and DESC Visits; to verify structure.)
-- WRITE YOUR OUTPUT BELOW



-- ======================================================================
-- Step 3: Insert Sample Data
-- Insert sample records into both tables.
-- Add at least 5 patients and 8–10 visit records with varying diagnoses and treatment costs.
-- WRITE YOUR QUERIES BELOW
INSERT INTO Patients (patient_name, age, gender)
VALUES
('Rohan Kumar', 30, 'Male'),
('Priya Singh', 25, 'Female'),
('Amit Patel', 45, 'Male'),
('Neha Sharma', 35, 'Female'),
('Rahul Verma', 50, 'Male');

INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost)
VALUES
(1, '2025-01-10', 101, 'Fever', 150.00),
(2, '2025-02-12', 102, 'Flu', 220.00),
(3, '2025-03-05', 101, 'Diabetes', 350.00),
(4, '2025-03-10', 103, 'Migraine', 180.00),
(5, '2025-03-20', 104, 'Fever', 130.00),
(1, '2025-04-15', 101, 'Cold', 100.00),
(2, '2025-04-18', 105, 'Flu', 250.00),
(3, '2025-05-10', 102, 'Diabetes', 400.00),
(4, '2025-06-02', 103, 'Allergy', 210.00),
(5, '2025-06-15', 104, 'Fever', 180.00);


-- OUTPUT:
-- (Run SELECT * FROM Patients; and SELECT * FROM Visits; to verify inserted data.)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM Patients;
SELECT * FROM Visits;



-- ======================================================================
-- QUICK INTRODUCTION (for notes)
-- GROUP BY: Groups rows sharing a value and performs aggregate functions like SUM(), COUNT(), AVG().
-- HAVING: Filters grouped data after aggregation.
-- ORDER BY: Sorts query results (ASC by default, DESC for descending order).
-- INDEXING: Improves query performance by creating a quick lookup on key columns.

-- ======================================================================
-- STUDENT ACTIVITY TASKS
-- ======================================================================

-- Task 1: Grouping Data by Diagnosis
-- Group the data based on diagnosis and calculate the average treatment cost for each diagnosis.
-- WRITE YOUR QUERY BELOW

SELECT diagnosis, AVG(treatment_cost) AS avg_treatment_cost
FROM Visits
GROUP BY diagnosis;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW



-- ======================================================================
-- Task 2: Filtering with HAVING Clause
-- Filter the grouped data to show only diagnoses where the average treatment cost is greater than 200.
-- WRITE YOUR QUERY BELOW

SELECT diagnosis, AVG(treatment_cost) AS avg_treatment_cost
FROM Visits
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW



-- ======================================================================
-- Task 3: Sorting the Results
-- Sort the results from Task 1 in descending order of average treatment cost.
-- WRITE YOUR QUERY BELOW

SELECT diagnosis, AVG(treatment_cost) AS avg_treatment_cost
FROM Visits
GROUP BY diagnosis
ORDER BY avg_treatment_cost DESC;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW



-- ======================================================================
-- Task 4: Optimizing with Indexes
-- Create an index on the patient_id column in the Visits table to improve performance.
-- Then run a query that retrieves all visits for a particular patient.
-- WRITE YOUR QUERIES BELOW

CREATE INDEX idx_patient_id ON Visits(patient_id);
SHOW INDEX FROM Visits;
SELECT * FROM Visits
WHERE patient_id = 1;


-- OUTPUT:
-- (Verify index creation using SHOW INDEX FROM Visits;)
-- WRITE YOUR OUTPUT BELOW



-- ======================================================================
-- END OF EXPERIMENT