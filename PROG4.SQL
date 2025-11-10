CREATE DATABASE IF NOT EXISTS companyDB;
USE companyDB;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Employees_2023;
DROP TABLE IF EXISTS Employees_2022;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10,2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1, 'Alice', 28, 55000, 'HR', '2023-03-15', 'New York'),
(2, 'Bob', 35, 72000, 'IT', '2022-07-10', 'Los Angeles'),
(3, 'Charlie', 24, 48000, 'Finance', '2024-01-05', 'Chicago'),
(4, 'David', 31, 60000, 'IT', '2023-09-01', NULL),
(5, 'Eve', 29, 75000, 'HR', '2022-05-20', 'Boston');

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

SELECT 
    Name,
    Salary,
    Salary + (Salary * 0.10) AS Salary_With_Bonus
FROM Employees;

SELECT 
    Name,
    Salary,
    Salary - (Salary * 0.15) AS Salary_After_Tax
FROM Employees;

SELECT 
    Name,
    Salary AS Monthly_Salary,
    Salary * 12 AS Yearly_Salary
FROM Employees;

SELECT 
    Name,
    Age,
    MOD(Age, 5) AS Age_Remainder
FROM Employees;

SELECT *
FROM Employees
WHERE Age > 30 AND Salary > 50000;

SELECT *
FROM Employees
WHERE Department = 'HR' OR Salary > 70000;

SELECT *
FROM Employees
WHERE NOT Address = 'New York';

SELECT *
FROM Employees
WHERE Salary = 60000;

SELECT *
FROM Employees
WHERE Department <> 'IT';

SELECT *
FROM Employees
WHERE Age < 25 AND Salary > 50000;

SELECT *
FROM Employees
WHERE Age BETWEEN 25 AND 35;

SELECT *
FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');

SELECT *
FROM Employees
WHERE Name LIKE 'A%';

SELECT *
FROM Employees
WHERE Address IS NULL;

CREATE TABLE Employees_2023 AS
SELECT EmployeeID, Name, Department FROM Employees;

CREATE TABLE Employees_2022 (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO Employees_2022 (EmployeeID, Name, Department) VALUES
(1, 'Alice', 'HR'),
(2, 'Bob', 'IT'),
(6, 'Frank', 'Finance');

SELECT Name FROM Employees_2023 WHERE Department = 'HR'
UNION
SELECT Name FROM Employees_2022 WHERE Department = 'HR';

SELECT e23.Name
FROM Employees_2023 e23
INNER JOIN Employees_2022 e22 ON e23.Name = e22.Name
WHERE e23.Department = 'IT' AND e22.Department = 'IT';

SELECT e23.Name
FROM Employees_2023 e23
LEFT JOIN Employees_2022 e22 ON e23.Name = e22.Name
WHERE e22.Name IS NULL;

