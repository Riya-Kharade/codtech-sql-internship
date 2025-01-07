-- Create the Database
CREATE DATABASE HotelBookingSystem;
USE HotelBookingSystem;

-- Create Tables

-- Rooms Table
CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber VARCHAR(10) UNIQUE NOT NULL,
    RoomType VARCHAR(50) NOT NULL,
    Capacity INT NOT NULL,
    PricePerNight FLOAT NOT NULL,
    Availability BOOLEAN DEFAULT TRUE
);

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address VARCHAR(255)
);

-- Reservations Table
CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    RoomID INT,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    TotalAmount FLOAT NOT NULL,
    Status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    ReservationID INT,
    PaymentDate DATE NOT NULL,
    AmountPaid FLOAT NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    PaymentStatus VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
);

-- Insert Sample Data

-- Insert Rooms
INSERT INTO Rooms (RoomNumber, RoomType, Capacity, PricePerNight, Availability) VALUES
('101', 'Single', 1, 1000.00, TRUE),
('102', 'Double', 2, 2000.00, TRUE),
('201', 'Suite', 4, 5000.00, TRUE),
('202', 'Single', 1, 1200.00, FALSE);

-- Insert Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('riya', 'kharade', 'riya@gmail.com', '8275005788', 'koLHpur'),
('manisha', 'shinde', 'manisha@gmail.com', '987654321', 'sangli');

-- Insert Reservations
INSERT INTO Reservations (CustomerID, RoomID, CheckInDate, CheckOutDate, TotalAmount, Status) VALUES
(1, 1, '2024-06-05', '2024-06-10', 5000.00, 'Confirmed'),
(2, 2, '2024-06-12', '2024-06-15', 6000.00, 'Confirmed');

-- Insert Payments
INSERT INTO Payments (ReservationID, PaymentDate, AmountPaid, PaymentMethod, PaymentStatus) VALUES
(1, '2024-06-05', 5000.00, 'Credit Card', 'Paid'),
(2, '2024-06-12', 6000.00, 'Cash', 'Paid');

-- Queries

-- Fetch data
SELECT r.RoomID, r.RoomNumber, r.RoomType, r.PricePerNight 
FROM Rooms r
WHERE r.Availability = TRUE AND r.RoomID NOT IN (
    SELECT RoomID 
    FROM Reservations 
    WHERE (CheckInDate <= '2024-06-10' AND CheckOutDate >= '2024-06-05')
);

-- Retrieve Customer Booking History
SELECT c.CustomerID, c.FirstName, c.LastName, r.ReservationID, r.CheckInDate, r.CheckOutDate, r.TotalAmount, r.Status 
FROM Customers c
JOIN Reservations r ON c.CustomerID = r.CustomerID
WHERE c.CustomerID = 1;

-- Calculate Total 
SELECT SUM(p.AmountPaid) AS TotalRevenue
FROM Payments p
JOIN Reservations r ON p.ReservationID = r.ReservationID
WHERE p.PaymentStatus = 'Paid' AND p.PaymentDate BETWEEN '2024-06-01' AND '2024-06-30';

-- Check Payment Status for All Reservations
SELECT r.ReservationID, c.FirstName, c.LastName, p.AmountPaid, p.PaymentMethod, p.PaymentStatus
FROM Reservations r
JOIN Payments p ON r.ReservationID = p.ReservationID
JOIN Customers c ON r.CustomerID = c.CustomerID;

-- Generate a Summary of Room Occupancy and Availability
SELECT r.RoomID, r.RoomNumber, r.RoomType,
       COUNT(res.ReservationID) AS TimesBooked,
       CASE WHEN r.Availability = TRUE THEN 'Available' ELSE 'Occupied' END AS CurrentStatus
FROM Rooms r
LEFT JOIN Reservations res ON r.RoomID = res.RoomID
GROUP BY r.RoomID, r.RoomNumber, r.RoomType, r.Availability;

-- List All Reservations for a Specific Room
SELECT r.ReservationID, c.FirstName, c.LastName, r.CheckInDate, r.CheckOutDate, r.TotalAmount, r.Status
FROM Reservations r
JOIN Customers c ON r.CustomerID = c.CustomerID
WHERE r.RoomID = 1;

-- Update Room Availability (Mark a Room as Unavailable)
UPDATE Rooms
SET Availability = FALSE
WHERE RoomID = 3;

-- Update Payment Status
UPDATE Payments
SET PaymentStatus = 'Paid'
WHERE PaymentID = 1;


