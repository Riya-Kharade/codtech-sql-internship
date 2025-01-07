/*Create Database LibraryDB*/
CREATE DATABASE LibraryDB;
USE LibraryDB;

/*Create Table Books*/
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    CopiesAvailable INT
);

/*Create Table Members*/

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

/*Create Table Transactions*/

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

/*Insert data in  Books Table*/

INSERT INTO Books (Title, Author, Genre, CopiesAvailable)
VALUES ('I dont love you anymore', 'RitWik Singh', 40);

/*Insert data in Members Table*/

INSERT INTO Members (Name, Email, Phone)
VALUES ('Riya Kharade', 'riya@gmail.com', '87356');


/*Retrive data*/

SELECT * FROM Books;
SELECT * FROM Members;

/*Update data in  Bookstable*/

UPDATE Books SET CopiesAvailable = CopiesAvailable - 1 WHERE BookID = 1;

/*Delete data in  Transactions*/
DELETE FROM Transactions WHERE TransactionID = 1;