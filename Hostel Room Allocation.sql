create database Hostel_room_allocation;
use Hostel_room_allocation;
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender varchar(20),
    Course VARCHAR(100),
    Year INT
);

INSERT INTO Student (Student_ID, Name, Gender, Course, Year) 
VALUES(1001, 'Anjali Menon', 'Female', 'Information Technology', 1),
(1002, 'Karan Oberoi', 'Male','Electronics and Communication', 2),
(1003, 'Dhruv Saxena','Male','Architecture', 3),
(1004, 'Priya Mathur', 'Female', 'Political Science', 4),
(1005, 'Nandita Bose', 'Female', 'Statistics', 2),
(1006, 'Vivek Chatterjee', 'Male','Environmental Science', 1),
(1007, 'Alisha Fernandes', 'Female', 'Law', 3),
(1008, 'Mohit Bhandari', 'Male', 'Philosophy', 4),
(1009, 'Disha Kapoor', 'Female', 'Chemistry', 2),
(1010,'Siddharth Sharma','Male','Fine Arts', 1);

CREATE TABLE Room (
    Room_ID INT PRIMARY KEY,
    Room_Type VARCHAR(50),
    Capacity INT,
    Occupancy_Status varchar(30) DEFAULT 'Vacant'
);

INSERT INTO Room (Room_ID, Room_Type, Capacity, Occupancy_Status)
VALUES(101, 'Single', 1, 'Occupied'),
(102, 'Triple',3, 'Vacant'),
(103, 'Double', 2, 'Occupied'),
(104, 'Double', 2, 'Vacant'),
(105, 'Single', 1, 'Occupied'),
(106, 'Triple', 3, 'Occupied'),
(107, 'Single', 1, 'Vacant'),
(108, 'Double', 2, 'Occupied'),
(109, 'Single', 1, 'Vacant'),
(110,'Triple',3,'Occupied');

CREATE TABLE Allocation (
    Allocation_ID INT PRIMARY KEY,
    Student_ID INT,
    Room_ID INT,
    CheckIn_Date DATE,
    CheckOut_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

INSERT INTO Allocation (Allocation_ID, Student_ID, Room_ID, CheckIn_Date, CheckOut_Date)
VALUES(200, 1001, 101, '2025-04-03','2025-12-30'),       
(201, 1002, 102, '2025-01-16', '2025-11-09'),       
(202, 1003, 105, '2024-08-25', '2024-12-24'),       
(203, 1004, 104, '2022-09-15','2023-06-15'),      
(204, 1005, 105, '2023-07-19', '2024-01-12'),
(205, 1006, 106, '2024-011-10', NULL),      
(206, 1007, 103, '2025-02-02', NULL),       
(207, 1008, 108, '2022-06-04', '2024-10-13'),    
(208, 1009, 110, '2023-011-03',NULL);       

SELECT student.Name, room.Room_ID, room.Room_Type
FROM Allocation 
JOIN Student ON allocation.Student_ID = student.Student_ID
JOIN Room ON allocation.Room_ID = room.Room_ID
WHERE allocation.CheckOut_Date IS NULL;
