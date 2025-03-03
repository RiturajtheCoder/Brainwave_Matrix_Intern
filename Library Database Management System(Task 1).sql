-- Creating the database
Create database Library;

-- Selecting the database to write further queries
use library;


-- Create Author Table
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    BirthYear INT,
    Nationality VARCHAR(50)
);

-- Insert data into Author Table
INSERT INTO Author (AuthorID, FirstName, LastName, BirthYear, Nationality) VALUES
(1, 'F. Scott', 'Fitzgerald', 1896, 'American'),
(2, 'George', 'Orwell', 1903, 'British'),
(3, 'J.K.', 'Rowling', 1965, 'British'),
(4, 'Jane', 'Austen', 1775, 'British'),
(5, 'Mark', 'Twain', 1835, 'American'),
(6, 'Leo', 'Tolstoy', 1828, 'Russian'),
(7, 'Agatha', 'Christie', 1890, 'British'),
(8, 'Ernest', 'Hemingway', 1899, 'American'),
(9, 'Virginia', 'Woolf', 1882, 'British'),
(10, 'Charles', 'Dickens', 1812, 'British');


-- Create Category Table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Insert data into Category Table
INSERT INTO Category (CategoryID, CategoryName) VALUES
(1, 'Fiction'),
(2, 'Dystopian'),
(3, 'Fantasy'),
(4, 'Adventure'),
(5, 'Mystery'),
(6, 'Classic'),
(7, 'Romance'),
(8, 'Science Fiction'),
(9, 'Historical'),
(10, 'Horror');


-- Create Publisher Table
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

-- Insert data into Publisher Table
INSERT INTO Publisher (PublisherID, PublisherName, Address, Phone) VALUES
(1, 'Scribner', '123 Publisher St, NY', '123-456-7890'),
(2, 'Secker & Warburg', '456 Publisher Ave, London', '987-654-3210'),
(3, 'Bloomsbury', '789 Publisher Rd, London', '555-123-4567'),
(4, 'Penguin', '321 Publisher Ln, London', '555-987-6543'),
(5, 'HarperCollins', '654 Publisher Dr, NY', '555-456-7890'),
(6, 'Vintage', '987 Publisher Ave, NY', '555-321-6547'),
(7, 'Random House', '321 Random St, NY', '555-654-3210'),
(8, 'Macmillan', '456 Macmillan Rd, London', '555-789-1234'),
(9, 'Oxford University Press', '789 Oxford St, London', '555-234-5678'),
(10, 'Simon & Schuster', '321 Simon St, NY', '555-876-5432');


-- Create Book Table
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    AuthorID INT,
    CategoryID INT,
    PublisherID INT,
    ISBN VARCHAR(20),
    YearOfPublication INT,
    AvailableCopies INT,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

-- Insert data into Book Table
INSERT INTO Book (BookID, Title, AuthorID, CategoryID, PublisherID, ISBN, YearOfPublication, AvailableCopies) VALUES
(1, 'The Great Gatsby', 1, 1, 1, '9780743273565', 1925, 5),
(2, '1984', 2, 2, 2, '9780451524935', 1949, 3),
(3, "Harry Potter and the Philosopher's Stone", 3, 3, 3, '9780747532743', 1997, 10),
(4, 'Pride and Prejudice', 4, 1, 4, '9780141439518', 1813, 7),
(5, 'Adventures of Huckleberry Finn', 5, 4, 5, '9780142437179', 1884, 6),
(6, 'War and Peace', 6, 1, 6, '9781400079988', 1869, 4),
(7, 'Murder on the Orient Express', 7, 5, 7, '9780062073501', 1934, 8),
(8, 'The Old Man and the Sea', 8, 6, 8, '9780684801223', 1952, 9),
(9, 'Mrs Dalloway', 9, 1, 9, '9780156628709', 1925, 5),
(10, 'A Tale of Two Cities', 10, 1, 10, '9780141439600', 1859, 6);


-- Create Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    DateOfMembership DATE
);

-- Insert data into Customer Table
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Phone, Address, DateOfMembership) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', '123 Main St, NY', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '456 Elm St, LA', '2023-02-20'),
(3, 'Alice', 'Johnson', 'alice.johnson@email.com', '555-123-4567', '789 Oak St, Chicago', '2023-03-25'),
(4, 'Bob', 'Brown', 'bob.brown@email.com', '555-987-6543', '321 Pine St, Houston', '2023-04-10'),
(5, 'Carol', 'Davis', 'carol.davis@email.com', '555-456-7890', '654 Maple St, Phoenix', '2023-05-15'),
(6, 'David', 'Wilson', 'david.wilson@email.com', '555-321-6547', '987 Cedar St, Philadelphia', '2023-06-20'),
(7, 'Eve', 'Martinez', 'eve.martinez@email.com', '555-654-3210', '321 Birch St, San Antonio', '2023-07-25'),
(8, 'Frank', 'Anderson', 'frank.anderson@email.com', '555-789-1234', '456 Walnut St, San Diego', '2023-08-30'),
(9, 'Grace', 'Thomas', 'grace.thomas@email.com', '555-234-5678', '789 Cherry St, Dallas', '2023-09-05'),
(10, 'Henry', 'Garcia', 'henry.garcia@email.com', '555-876-5432', '321 Spruce St, San Jose', '2023-10-10');


-- Create Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert data into Staff Table
INSERT INTO Staff (StaffID, FirstName, LastName, Position, Salary) VALUES
(1, 'Alice', 'Johnson', 'Librarian', 50000.00),
(2, 'Bob', 'Smith', 'Assistant', 35000.00),
(3, 'Carol', 'Davis', 'Manager', 60000.00),
(4, 'David', 'Wilson', 'Clerk', 30000.00),
(5, 'Eve', 'Martinez', 'IT Support', 40000.00),
(6, 'Frank', 'Anderson', 'Security', 32000.00),
(7, 'Grace', 'Thomas', 'Cataloger', 38000.00),
(8, 'Henry', 'Garcia', 'Janitor', 28000.00),
(9, 'Irene', 'Clark', 'Assistant', 34000.00),
(10, 'Jack', 'White', 'Librarian', 52000.00);


-- Create Loan Table
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    BookID INT,
    CustomerID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Loan (LoanID, BookID, CustomerID, LoanDate, DueDate, ReturnDate) VALUES
(1, 1, 1, '2023-10-01', '2023-10-15', '2023-10-14'),
(2, 2, 2, '2023-10-02', '2023-10-16', NULL),
(3, 3, 3, '2023-10-03', '2023-10-17', '2023-10-16'),
(4, 4, 4, '2023-10-04', '2023-10-18', NULL),
(5, 5, 5, '2023-10-05', '2023-10-19', '2023-10-18'),
(6, 6, 6, '2023-10-06', '2023-10-20', NULL),
(7, 7, 7, '2023-10-07', '2023-10-21', '2023-10-20'),
(8, 8, 8, '2023-10-08', '2023-10-22', NULL),
(9, 9, 9, '2023-10-09', '2023-10-23', '2023-10-22'),
(10, 10, 10, '2023-10-10', '2023-10-24', NULL);


-- Create BookReturn Table
CREATE TABLE BookReturn (
    ReturnID INT PRIMARY KEY,
    LoanID INT,
    ReturnDate DATE,
    FineAmount DECIMAL(10, 2),
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
);

-- Insert data into BookReturn Table
INSERT INTO BookReturn (ReturnID, LoanID, ReturnDate, FineAmount) VALUES
(1, 1, '2023-10-14', 0.00),
(2, 3, '2023-10-16', 0.00),
(3, 5, '2023-10-18', 0.00),
(4, 7, '2023-10-20', 0.00),
(5, 9, '2023-10-22', 0.00),
(6, 2, '2023-10-17', 5.00),
(7, 4, '2023-10-19', 10.00),
(8, 6, '2023-10-21', 15.00),
(9, 8, '2023-10-23', 20.00),
(10, 10, '2023-10-25', 25.00);


-- Create Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert data into Payment Table
INSERT INTO Payment (PaymentID, CustomerID, PaymentDate, Amount, PaymentMethod) VALUES
(1, 1, '2023-10-14', 0.00, 'Cash'),
(2, 2, '2023-10-17', 5.00, 'Credit Card'),
(3, 3, '2023-10-16', 0.00, 'Cash'),
(4, 4, '2023-10-19', 10.00, 'Debit Card'),
(5, 5, '2023-10-18', 0.00, 'Cash'),
(6, 6, '2023-10-21', 15.00, 'Credit Card'),
(7, 7, '2023-10-20', 0.00, 'Cash'),
(8, 8, '2023-10-23', 20.00, 'Debit Card'),
(9, 9, '2023-10-22', 0.00, 'Cash'),
(10, 10, '2023-10-25', 25.00, 'Credit Card');


-- Create Reservation Table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    BookID INT,
    CustomerID INT,
    ReservationDate DATE,
    ReservationStatus VARCHAR(50),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert data into Reservation Table
INSERT INTO Reservation (ReservationID, BookID, CustomerID, ReservationDate, ReservationStatus) VALUES
(1, 1, 1, '2023-10-01', 'Active'),
(2, 2, 2, '2023-10-02', 'Cancelled'),
(3, 3, 3, '2023-10-03', 'Active'),
(4, 4, 4, '2023-10-04', 'Cancelled'),
(5, 5, 5, '2023-10-05', 'Active'),
(6, 6, 6, '2023-10-06', 'Cancelled'),
(7, 7, 7, '2023-10-07', 'Active'),
(8, 8, 8, '2023-10-08', 'Cancelled'),
(9, 9, 9, '2023-10-09', 'Active'),
(10, 10, 10, '2023-10-10', 'Cancelled');