create database Car_Rental_System
use Car_Rental_System
CREATE TABLE Vehicle (
    vehicleID INT PRIMARY KEY IDENTITY(1,1),
    make VARCHAR(100),
    model VARCHAR(50),
    year INT,
    dailyRate DECIMAL(10, 2),
    status VARCHAR(50) CHECK (status IN ('available', 'notAvailable')),
    passengerCapacity INT,
    engineCapacity INT
);
INSERT INTO Vehicle (make, model, year, dailyRate, status, passengerCapacity, engineCapacity)
VALUES ('Toyota', 'Camry', 2020, 50.00, 'available', 5, 2000);

INSERT INTO Vehicle (make, model, year, dailyRate, status, passengerCapacity, engineCapacity)
VALUES ('Honda', 'Civic', 2018, 40.00, 'available', 6, 1800);

INSERT INTO Vehicle (make, model, year, dailyRate, status, passengerCapacity, engineCapacity)
VALUES ('Ford', 'Fusion', 2019, 45.00, 'notAvailable', 7, 2200);

select * from Vehicle

CREATE TABLE Customer (
    customerID INT PRIMARY KEY IDENTITY(1,1),
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phoneNumber VARCHAR(20)
);
INSERT INTO Customer (firstName, lastName, email, phoneNumber)
VALUES ('John', 'Doe', 'john.doe@example.com', '123-456-7890');

INSERT INTO Customer (firstName, lastName, email, phoneNumber)
VALUES ('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210');

INSERT INTO Customer (firstName, lastName, email, phoneNumber)
VALUES ('Alice', 'Johnson', 'alice.johnson@example.com', '456-789-0123');

select * from Customer;

INSERT INTO Customer (firstName, lastName, email, phoneNumber)
VALUES ('Al', 'Johny', 'alice.johnson@example.com', '956-789-0124');


CREATE TABLE Lease (
    leaseID INT PRIMARY KEY IDENTITY(1,1),
    vehicleID INT,
    customerID INT,
    startDate DATE,
    endDate DATE,
    type VARCHAR(50),
    FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);


INSERT INTO Lease (vehicleID, customerID, startDate, endDate, type)
VALUES (1, 1, '2024-03-01', '2024-03-10', 'DailyLease');

INSERT INTO Lease (vehicleID, customerID, startDate, endDate, type)
VALUES (2, 2, '2024-03-05', '2024-04-05', 'MonthlyLease');

INSERT INTO Lease (vehicleID, customerID, startDate, endDate, type)
VALUES (3, 3, '2024-03-10', '2024-03-15', 'DailyLease');

select * from Lease;


CREATE TABLE Payment (
    paymentID INT PRIMARY KEY IDENTITY(1,1),
    leaseID INT,
    paymentDate DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (leaseID) REFERENCES Lease(leaseID)
);


INSERT INTO Payment (leaseID, paymentDate, amount)
VALUES (1, '2024-03-05', 500.00);

INSERT INTO Payment (leaseID, paymentDate, amount)
VALUES (2, '2024-03-10', 1000.00);

INSERT INTO Payment (leaseID, paymentDate, amount)
VALUES (3, '2024-03-15', 300.00);

select * from Payment