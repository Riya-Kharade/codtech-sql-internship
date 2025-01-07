-- Step 1: Create the Database
CREATE DATABASE SampleDB;

-- Step 2: Use the Created Database
USE SampleDB;

-- Step 3: Create the Table
CREATE TABLE Emps4 (
    IdEmp INT PRIMARY KEY,
    EmpName VARCHAR(100),
    DeptName VARCHAR(50),
    Sal INT
);

-- Step 4: Insert Data into the Table
INSERT INTO Emps4 (IdEmp, EmpName, DeptName, Sal) VALUES
(1, 'Kate', 'Admin', 2000);

-- Step 5: Verify Data
SELECT * FROM Emps4;
