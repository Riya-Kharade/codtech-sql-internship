-- Step 1: Create the Database
CREATE DATABASE AdvancedAnalysisDB;

-- Step 2: Use the Created Database
USE AdvancedAnalysisDB;

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

-- Step 7: Create the Salaries Table
CREATE TABLE Salaries (
    EmployeeID INT,
    Salary INT,
    Bonus INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Step 8: Insert Data into Salaries Table
INSERT INTO Salaries (EmployeeID, Salary, Bonus) VALUES
(1, 70000, 5000),
(2, 80000, 7000),
(3, 75000, 6000),
(4, 72000, 5500),
(5, 68000, 4000);

-- Step 9: Subquery - Find Employees Earning Above the Average Salary
SELECT Name, Salary
FROM Employees
JOIN Salaries ON Employees.EmployeeID = Salaries.EmployeeID
WHERE Salary > (SELECT AVG(Salary) FROM Salaries);

-- Step 10: Common Table Expression (CTE) - Calculate Total Compensation and Rank
WITH Compensation AS (
    SELECT 
        Employees.Name,
        Salaries.Salary,
        Salaries.Bonus,
        (Salaries.Salary + Salaries.Bonus) AS TotalCompensation
    FROM Employees
    JOIN Salaries ON Employees.EmployeeID = Salaries.EmployeeID
)
SELECT Name, TotalCompensation, RANK() OVER (ORDER BY TotalCompensation DESC) AS Rank
FROM Compensation;

-- Step 11: Window Function - Average Salary Per Department and Deviation
SELECT 
    Employees.Name,
    Departments.DepartmentName,
    Salaries.Salary,
    AVG(Salaries.Salary) OVER (PARTITION BY Departments.DepartmentName) AS AvgSalary,
    Salaries.Salary - AVG(Salaries.Salary) OVER (PARTITION BY Departments.DepartmentName) AS Deviation
FROM Employees
LEFT JOIN Salaries ON Employees.EmployeeID = Salaries.EmployeeID
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- Step 12: Clean Up (Optional)
-- Drop Tables and Database
DROP TABLE Salaries;
DROP TABLE Employees;
DROP TABLE Departments;
DROP DATABASE AdvancedAnalysisDB;
