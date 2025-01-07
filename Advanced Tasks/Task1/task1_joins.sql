-- Step 1: Create the Database
CREATE DATABASE UniversityDB;

-- Step 2: Use the Created Database
USE UniversityDB;

-- Step 3: Create the Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT
);

-- Step 4: Insert Data into Employees Table
INSERT INTO Employees (EmployeeID, Name, DepartmentID) VALUES
(1, 'Riya', 201),
(2, 'Pratik', 202),
(3, 'Shravani', 203),
(4, 'Kartik', 204),
(5, 'Pratiksha', NULL);

-- Step 5: Create the Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Step 6: Insert Data into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(201, 'Computer'),
(202, 'Information Technology'),
(203, 'Electrical'),
(205, 'Mechanical');

-- Step 7: Select
	SELECT * FROM Employees;
    
-- Step 8: Select

    SELECT * FROM Departments;

-- Step 9: INNER JOIN Query
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- Step 10: LEFT JOIN Query
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- Step 11: RIGHT JOIN Query
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- Step 12: FULL JOIN Query
-- Full Join (Standard for databases that support FULL JOIN)
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
FULL JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

-- Step 13: drop tables
DROP TABLE Employees;
DROP TABLE Departments;

-- Step 14: Drop Database
DROP DATABASE UniversityDB;

