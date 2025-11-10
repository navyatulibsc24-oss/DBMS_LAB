-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Jesse P H
-- USN: 1RUA24SCS0045
-- SECTION: A 
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- 'root@localhost', 'RVU-PC-24', '8.4.6', '2025-09-29 04:16:46'



-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
create database lab3;
use lab3;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    BirthDate DATE,
    HireDate DATE
);

INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
SELECT * FROM Employees;
SELECT * FROM Orders;

-- Output: 
-- OrderID, OrderDate, TotalAmount, EmployeeID
-- '1', '2024-07-15', '250.00', '1'
-- '2', '2024-08-10', '175.50', '2'
-- '3', '2024-09-01', '300.00', '3'
-- '4', '2024-09-10', '450.75', '1'
-- '5', '2024-08-25', '123.40', '4'


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
SELECT FirstName, LastName, Salary, ROUND(Salary) AS RoundedSalary FROM Employees;

-- Output: 
-- FirstName, LastName, Salary, RoundedSalary
-- 'John', 'Doe', '55000.30', '55000'
-- 'Jane', 'Smith', '65000.50', '65001'
-- 'Alice', 'Johnson', '72000.10', '72000'
-- 'Bob', 'Brown', '48000.90', '48001'

/* b. Absolute Values: Show absolute values of salaries */
SELECT FirstName, LastName, Salary, ABS(Salary) AS AbsoluteSalary FROM Employees;

-- Output: 
-- FirstName, LastName, Salary, AbsoluteSalary
-- 'John', 'Doe', '55000.30', '55000.30'
-- 'Jane', 'Smith', '65000.50', '65000.50'
-- 'Alice', 'Johnson', '72000.10', '72000.10'
-- 'Bob', 'Brown', '48000.90', '48000.90'

/* c. Ceiling Values: Get ceiling values of order amounts */
SELECT OrderID, TotalAmount, CEIL(TotalAmount) AS CeilAmount FROM Orders;

-- Output: 
-- OrderID, TotalAmount, CeilAmount
-- '1', '250.00', '250'
-- '2', '175.50', '176'
-- '3', '300.00', '300'
-- '4', '450.75', '451'
-- '5', '123.40', '124'

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- Output: 
-- TotalEmployees
-- '4'

/* b. Sum of Salaries: Calculate total salary expense */
SELECT SUM(Salary) AS TotalSalary FROM Employees;

-- Output: 
-- TotalSalary
-- '240001.80'

/* c. Average Order Amount: Find average order value */
SELECT AVG(TotalAmount) AS AvgOrderAmount FROM Orders;

-- Output: 
-- AvgOrderAmount
-- '259.930000'

/* d. Max/Min Salary: Find highest and lowest salaries */
SELECT MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary FROM Employees;

-- Output: 
-- MaxSalary, MinSalary
-- '72000.10', '48000.90'

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT FirstName, UPPER(FirstName) AS UpperName, LOWER(FirstName) AS LowerName FROM Employees;
-- Output: 
-- FirstName, UpperName, LowerName
-- 'John', 'JOHN', 'john'
-- 'Jane', 'JANE', 'jane'
-- 'Alice', 'ALICE', 'alice'
-- 'Bob', 'BOB', 'bob'

/* b. Concatenate Names: Create full names */
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Employees;

-- Output: 
-- FullName
-- 'John Doe'
-- 'Jane Smith'
-- 'Alice Johnson'
-- 'Bob Brown'

/* c. Extract Substring: Get first 3 characters of first names */
SELECT FirstName, SUBSTRING(FirstName, 1, 3) AS SubName FROM Employees;

-- Output: 
-- FirstName, SubName
-- 'John', 'Joh'
-- 'Jane', 'Jan'
-- 'Alice', 'Ali'
-- 'Bob', 'Bob'

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
SELECT STR_TO_DATE('2025-12-31', '%Y-%m-%d') AS ConvertedDate;

-- Output: 
-- ConvertedDate
-- '2025-12-31'

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
SELECT NOW() AS CurrentDateTime;

-- Output: 
-- CurrentDateTime
-- '2025-09-29 10:20:58'

/* b. Extract Year: Get year from order dates */
SELECT OrderID, OrderDate, YEAR(OrderDate) AS OrderYear FROM Orders;

-- Output: 
-- OrderID, OrderDate, OrderYear
-- '1', '2024-07-15', 2024
-- '2', '2024-08-10', 2024
-- '3', '2024-09-01', 2024
-- '4', '2024-09-10', 2024
-- '5', '2024-08-25', 2024

/* c. Add Months: Add 3 months to order dates */
SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS NewDate FROM Orders;

-- Output: 
-- OrderID, OrderDate, NewDate
-- '1', '2024-07-15', '2024-10-15'
-- '2', '2024-08-10', '2024-11-10'
-- '3', '2024-09-01', '2024-12-01'
-- '4', '2024-09-10', '2024-12-10'
-- '5', '2024-08-25', '2024-11-25'

/* d. Days Since Order: Calculate days between order date and now */
SELECT OrderID, OrderDate, DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder FROM Orders;

-- Output: 
-- OrderID, OrderDate, DaysSinceOrder
-- '1', '2024-07-15', '441'
-- '2', '2024-08-10', '415'
-- '3', '2024-09-01', '393'
-- '4', '2024-09-10', '384'
-- '5', '2024-08-25', '400'

-- END of the Task -- 