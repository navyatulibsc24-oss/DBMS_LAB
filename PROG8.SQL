CREATE DATABASE CompanyDB;
USE CompanyDB;

-- ======================================================================
-- Step 2: Create Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- OUTPUT:
-- (Run DESC Employees; to verify structure)
-- WRITE YOUR OUTPUT BELOW
DESC Employees;


-- ======================================================================
-- Step 3: Insert Sample Data
INSERT INTO Employees (EmpName, Department, Salary) VALUES
('John', 'IT', 55000),
('Alice', 'HR', 48000),
('Bob', 'Finance', 60000);

-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify data)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM Employees;


-- ======================================================================
-- Task 1: Create a Basic Procedure
-- Create a procedure named `DisplayEmployees` that retrieves all records from the Employees table.
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //
CREATE PROCEDURE DisplayEmployees()
BEGIN
    SELECT * FROM Employees;
END;
//
DELIMITER ;


-- CALL DisplayEmployees();
-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
CALL DisplayEmployees();



-- ======================================================================
-- Task 2: Procedure for INSERT Operation
-- Create a procedure named `AddEmployee` that inserts a new employee record.
-- Parameters: (p_name VARCHAR(50), p_dept VARCHAR(50), p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //
CREATE PROCEDURE AddEmployee(
    IN p_name VARCHAR(50),
    IN p_dept VARCHAR(50),
    IN p_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO Employees (EmpName, Department, Salary)
    VALUES (p_name, p_dept, p_salary);
END;
//
DELIMITER ;


-- CALL AddEmployee('David', 'Marketing', 52000);
-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify insertion)
-- WRITE YOUR OUTPUT BELOW
CALL AddEmployee('David', 'Marketing', 52000);
SELECT * FROM Employees;



-- ======================================================================
-- Task 3: Procedure for UPDATE Operation
-- Create a procedure named `UpdateSalary` to update an employee’s salary based on EmpID.
-- Parameters: (p_empid INT, p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //
CREATE PROCEDURE UpdateSalary(
    IN p_empid INT,
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employees
    SET Salary = p_salary
    WHERE EmpID = p_empid;
END;
//
DELIMITER ;


-- CALL UpdateSalary(2, 50000);
-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify update)
-- WRITE YOUR OUTPUT BELOW
CALL UpdateSalary(2, 50000);
SELECT * FROM Employees;



-- ======================================================================
-- Task 4: Procedure for DELETE Operation
-- Create a procedure named `RemoveEmployee` to delete an employee record based on EmpID.
-- Parameters: (p_empid INT)
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //
CREATE PROCEDURE RemoveEmployee(
    IN p_empid INT
)
BEGIN
    DELETE FROM Employees
    WHERE EmpID = p_empid;
END;
//
DELIMITER ;


-- CALL RemoveEmployee(3);
-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify deletion)
-- WRITE YOUR OUTPUT BELOW
CALL RemoveEmployee(3);
SELECT * FROM Employees;



-- ======================================================================
-- END OF EXPERIMENT