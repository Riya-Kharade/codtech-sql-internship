-- Step 1: Create the Database
CREATE DATABASE SampleDB;

-- Step 2: Connect to the Created Database
\c SampleDB;

-- Step 3: Create the Table
CREATE TABLE Emps4 (
    IdEmp INT PRIMARY KEY,
    EmpName VARCHAR(100),
    DeptName VARCHAR(50),
    Sal INT
);

-- Step 4: Verify the Table Structure
SELECT * FROM information_schema.tables WHERE table_name = 'emps4';

-- Note: Data will be migrated from MySQL into this table.
