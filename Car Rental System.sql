create database Car_Rental_System;
use Car_Rental_System;

CREATE TABLE Car (
    Car_ID INT PRIMARY KEY,
    Model VARCHAR(50),
    Category VARCHAR(30),
    Manufacturer VARCHAR(50),
    Availability_Status VARCHAR(20) 
);

INSERT INTO Car (Car_ID, Model, Category, Manufacturer, Availability_Status) 
VALUES
(1, 'Honda City', 'Sedan', 'Honda', 'Available'),
(2, 'Hyundai Creta', 'SUV', 'Hyundai', 'Rented'),
(3, 'Maruti Swift', 'Hatchback', 'Maruti Suzuki', 'Available'),
(4, 'Toyota Fortuner', 'SUV', 'Toyota', 'Available'),
(5, 'Tata Nexon EV', 'Electric', 'Tata Motors', 'Under_Maintenance'),
(6, 'Mahindra XUV700', 'SUV', 'Mahindra', 'Available'),
(7, 'Kia Seltos', 'SUV', 'Kia', 'Rented'),
(8, 'Volkswagen Polo', 'Hatchback', 'Volkswagen', 'Available'),
(9, 'Skoda Octavia', 'Sedan', 'Skoda', 'Available'),
(10, 'MG Hector', 'SUV', 'MG Motors', 'Rented');


CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    License_Number VARCHAR(20) UNIQUE,
    Contact VARCHAR(15),
    Email VARCHAR(50)
);

INSERT INTO Customer (Customer_ID, Name, License_Number, Contact, Email) 
VALUES
(101, 'Aarav Sharma', 'DL12345', '9811112233', 'aarav.sharma@email.com'),
(102, 'Neha Kapoor', 'DL67890', '9822223344', 'neha.kapoor@email.com'),
(103, 'Rohan Verma', 'DL54321', '9833334455', 'rohan.verma@email.com'),
(104, 'Simran Kaur', 'DL11111', '9844445566', 'simran.kaur@email.com'),
(105, 'Aditya Malhotra', 'DL22222', '9855556677', 'aditya.malhotra@email.com'),
(106, 'Kavya Reddy', 'DL33333', '9866667788', 'kavya.reddy@email.com'),
(107, 'Ishaan Desai', 'DL44444', '9877778899', 'ishaan.desai@email.com'),
(108, 'Tanvi Bansal', 'DL55555', '9888889900', 'tanvi.bansal@email.com'),
(109, 'Harsh Vora', 'DL66666', '9899990011', 'harsh.vora@email.com'),
(110, 'Shruti Nanda', 'DL77777', '9900001122', 'shruti.nanda@email.com');

CREATE TABLE Rental (
    Rental_ID INT PRIMARY KEY,
    Car_ID INT,
    Customer_ID INT,
    Rental_Date DATE,
    Return_Date DATE,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

INSERT INTO Rental (Rental_ID, Car_ID, Customer_ID, Rental_Date, Return_Date, Total_Amount) 
VALUES
(201, 2, 101, '2025-09-01', '2025-09-05', 8000.00),
(202, 3, 102, '2025-09-02', '2025-09-04', 5000.00),
(203, 4, 103, '2025-09-03', '2025-09-07', 12000.00),
(204, 6, 104, '2025-09-04', '2025-09-06', 7000.00),
(205, 7, 105, '2025-09-05', '2025-09-09', 9500.00),
(206, 8, 106, '2025-09-06', '2025-09-08', 4000.00),
(207, 9, 107, '2025-09-07', '2025-09-11', 11000.00),
(208, 10, 108, '2025-09-08', '2025-09-12', 13000.00),
(209, 1, 109, '2025-09-09', '2025-09-10', 3000.00),
(210, 5, 110, '2025-09-10', '2025-09-15', 15000.00);

CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(30),
    Contact VARCHAR(15)
);

INSERT INTO Staff (Staff_ID, Name, Role, Contact) 
VALUES
(301, 'Karan Malhotra', 'Manager', '9876543210'),
(302, 'Simran Kaur', 'Customer Support', '9865432109'),
(303, 'Rahul Mehta', 'Driver', '9854321098'),
(304, 'Anjali Menon', 'Receptionist', '9843210987'),
(305, 'Vikram Singh', 'Mechanic', '9832109876'),
(306, 'Ritika Deshmukh', 'Cleaner', '9821098765'),
(307, 'Sanjay Gupta', 'Driver', '9810987654'),
(308, 'Alisha Fernandes', 'Customer Support', '9809876543'),
(309, 'Mohit Bhandari', 'Security', '9798765432'),
(310, 'Rhea D’Souza', 'Manager', '9787654321');

SELECT * FROM Car WHERE Availability_Status = 'Available';

SELECT r.Rental_ID, c.Model, r.Rental_Date, r.Return_Date, r.Total_Amount
FROM Rental r
JOIN Car c ON r.Car_ID = c.Car_ID
WHERE r.Customer_ID = 101;

SELECT Name, Role, Contact FROM Staff;
