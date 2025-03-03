-- Creating the database
Create database Movie;

-- Selecting the database to write further queries
use movie;


-- Create Genres Table
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY AUTO_INCREMENT,
    GenreName VARCHAR(100) NOT NULL
);

-- Insert data into Genres Table
INSERT INTO Genres (GenreName) VALUES 
('Action'), 
('Comedy'), 
('Drama'), 
('Horror'), 
('Sci-Fi'),
('Romance'), 
('Thriller'), 
('Animation'), 
('Documentary'), 
('Fantasy');


-- Create Movies Table
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    GenreID INT,
    ReleaseYear INT,
    RentalRate DECIMAL(5, 2) NOT NULL,
    AvailableCopies INT NOT NULL,
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Insert into Movies table
INSERT INTO Movies (Title, GenreID, ReleaseYear, RentalRate, AvailableCopies) VALUES
('Inception', 1, 2010, 3.99, 5),
('The Dark Knight', 1, 2008, 4.99, 3),
('The Hangover', 2, 2009, 2.99, 7),
('Interstellar', 5, 2014, 5.99, 4),
('The Shawshank Redemption', 3, 1994, 3.49, 6),
('The Conjuring', 4, 2013, 4.49, 2),
('Toy Story 4', 8, 2019, 3.99, 8),
('The Notebook', 6, 2004, 2.99, 5),
('The Matrix', 5, 1999, 4.99, 3),
('Jurassic Park', 1, 1993, 3.99, 4);


-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Insert into Customers Table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('John', 'Doe', 'john.doe@email.com', '123-456-7890', '123 Main St, NY'),
('Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '456 Elm St, LA'),
('Alice', 'Johnson', 'alice.j@email.com', '555-123-4567', '789 Oak St, Chicago'),
('Bob', 'Brown', 'bob.b@email.com', '555-987-6543', '321 Pine St, Houston'),
('Carol', 'Davis', 'carol.d@email.com', '555-456-7890', '654 Maple St, Phoenix'),
('David', 'Wilson', 'david.w@email.com', '555-321-6547', '987 Cedar St, Philadelphia'),
('Eve', 'Martinez', 'eve.m@email.com', '555-654-3210', '321 Birch St, San Antonio'),
('Frank', 'Anderson', 'frank.a@email.com', '555-789-1234', '456 Walnut St, San Diego'),
('Grace', 'Thomas', 'grace.t@email.com', '555-234-5678', '789 Cherry St, Dallas'),
('Henry', 'Garcia', 'henry.g@email.com', '555-876-5432', '321 Spruce St, San Jose');


-- Create Rentals Table
CREATE TABLE Rentals (
    RentalID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    MovieID INT,
    RentalDate DATE NOT NULL,
    ReturnDate DATE,
    TotalCost DECIMAL(6, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Insert into Rentals Table
INSERT INTO Rentals (CustomerID, MovieID, RentalDate, ReturnDate, TotalCost) VALUES
(1, 1, '2023-10-01', '2023-10-05', 3.99),
(2, 3, '2023-10-02', NULL, 2.99),
(3, 5, '2023-10-03', '2023-10-10', 3.49),
(4, 7, '2023-10-04', NULL, 3.99),
(5, 9, '2023-10-05', '2023-10-12', 4.99),
(6, 2, '2023-10-06', NULL, 4.99),
(7, 4, '2023-10-07', '2023-10-14', 5.99),
(8, 6, '2023-10-08', NULL, 4.49),
(9, 8, '2023-10-09', '2023-10-16', 2.99),
(10, 10, '2023-10-10', NULL, 3.99);


-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    RentalID INT,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(6, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID)
);

-- Insert into Payments Table
INSERT INTO Payments (RentalID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2023-10-01', 3.99, 'Credit Card'),
(2, '2023-10-02', 2.99, 'Cash'),
(3, '2023-10-03', 3.49, 'Debit Card'),
(4, '2023-10-04', 3.99, 'Credit Card'),
(5, '2023-10-05', 4.99, 'Cash'),
(6, '2023-10-06', 4.99, 'Credit Card'),
(7, '2023-10-07', 5.99, 'Debit Card'),
(8, '2023-10-08', 4.49, 'Cash'),
(9, '2023-10-09', 2.99, 'Credit Card'),
(10, '2023-10-10', 3.99, 'Debit Card');


-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Position VARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(8, 2) NOT NULL
);

--Insert into Employees Table
INSERT INTO Employees (FirstName, LastName, Position, HireDate, Salary) VALUES
('Alice', 'Johnson', 'Manager', '2020-01-15', 60000.00),
('Bob', 'Smith', 'Clerk', '2021-03-20', 35000.00),
('Carol', 'Davis', 'IT Support', '2022-05-10', 40000.00),
('David', 'Wilson', 'Security', '2021-07-25', 32000.00),
('Eve', 'Martinez', 'Cataloger', '2023-02-15', 38000.00);


-- Create Reviews Table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT,
    CustomerID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--Insert into Reviews Table
INSERT INTO Reviews (MovieID, CustomerID, Rating, Comment, ReviewDate) VALUES
(1, 1, 5, 'Amazing movie!', '2023-10-06'),
(3, 2, 4, 'Very funny!', '2023-10-07'),
(5, 3, 5, 'A classic masterpiece.', '2023-10-11'),
(7, 4, 3, 'Good for kids.', '2023-10-12'),
(9, 5, 4, 'Mind-blowing sci-fi!', '2023-10-13');


-- Create LateFees Table
CREATE TABLE LateFees (
    LateFeeID INT PRIMARY KEY AUTO_INCREMENT,
    RentalID INT,
    LateFeeAmount DECIMAL(6, 2) NOT NULL,
    DueDate DATE NOT NULL,
    PaymentStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID)
);

-- Insert into LateFees
INSERT INTO LateFees (RentalID, LateFeeAmount, DueDate, PaymentStatus) VALUES
(2, 2.00, '2023-10-16', 'Unpaid'),
(4, 3.00, '2023-10-18', 'Paid'),
(6, 5.00, '2023-10-20', 'Unpaid'),
(8, 4.00, '2023-10-22', 'Paid'),
(10, 6.00, '2023-10-24', 'Unpaid');


-- Create Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT,
    TotalCopies INT NOT NULL,
    AvailableCopies INT NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Insert into Inventory Table
INSERT INTO Inventory (MovieID, TotalCopies, AvailableCopies)
VALUES
(1, 5, 3),
(2, 3, 1),
(3, 7, 5),
(4, 4, 2),
(5, 6, 4);


-- Create Discounts Table
CREATE TABLE Discounts (
    DiscountID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    DiscountAmount DECIMAL(6, 2) NOT NULL,
    ValidFrom DATE NOT NULL,
    ValidTo DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert into Discounts Table
INSERT INTO Discounts (CustomerID, DiscountAmount, ValidFrom, ValidTo)
VALUES
(1, 5.00, '2023-10-01', '2023-10-31'),
(3, 3.00, '2023-10-05', '2023-10-15'),
(5, 4.00, '2023-10-10', '2023-10-20'),
(7, 2.00, '2023-10-15', '2023-10-25'),
(9, 6.00, '2023-10-20', '2023-10-30');