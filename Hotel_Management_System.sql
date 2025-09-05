CREATE DATABASE hospital_management_system;
USE hospital_management_system;

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    Contact VARCHAR(10),
    Address VARCHAR(200)
);

INSERT INTO Patient 
(Patient_ID, Name, DOB, Gender, Contact, Address) 
VALUES
(1, 'Ishaan Desai', '1992-01-15', 'Male', '9811112233', 'Surat, Gujarat'),
(2, 'Kavya Reddy', '1999-07-09', 'Female', '9822223344', 'Visakhapatnam, Andhra Pradesh'),
(3, 'Devansh Choudhary', '1987-11-03', 'Male', '9833334455', 'Bhopal, Madhya Pradesh'),
(4, 'Ritika Kulkarni', '1994-05-20', 'Female', '9844445566', 'Nagpur, Maharashtra'),
(5, 'Siddharth Jain', '2000-09-27', 'Male', '9855556677', 'Indore, Madhya Pradesh'),
(6, 'Tanvi Bansal', '1991-12-12', 'Female', '9866667788', 'Lucknow, Uttar Pradesh'),
(7, 'Aditya Shetty', '1986-04-04', 'Male', '9877778899', 'Mangalore, Karnataka'),
(8, 'Pooja Bhatt', '1997-02-28', 'Female', '9888889900', 'Vadodara, Gujarat'),
(9, 'Harsh Vora', '1993-08-16', 'Male', '9899990011', 'Chandigarh, Punjab'),
(10, 'Shruti Nanda', '1989-03-10', 'Female', '9900001122', 'Ranchi, Jharkhand');

CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Specialization VARCHAR(20),
    Availability VARCHAR(100)
);

INSERT INTO Doctor 
(Doctor_ID, Name, Specialization, Availability) 
VALUES
(101, 'Dr. Rajesh Khanna', 'Cardiologist', 'Mon-Fri 10:00 AM - 2:00 PM'),
(102, 'Dr. Meera Sethi', 'Dermatologist', 'Tue-Thu 11:00 AM - 4:00 PM'),
(103, 'Dr. Anil Verma', 'Orthopedic', 'Mon-Wed-Fri 9:00 AM - 1:00 PM'),
(104, 'Dr. Nisha Kapoor', 'Gynecologist', 'Mon-Sat 2:00 PM - 6:00 PM'),
(105, 'Dr. Arvind Nair', 'Neurologist', 'Wed-Fri 10:00 AM - 3:00 PM'),
(106, 'Dr. Kavita Bansal', 'Pediatrician', 'Mon-Sat 9:30 AM - 1:30 PM'),
(107, 'Dr. Sameer Deshmukh', 'Psychiatrist', 'Tue-Thu-Sat 3:00 PM - 7:00 PM'),
(108, 'Dr. Ritu Malhotra', 'ENT Specialist', 'Mon-Fri 12:00 PM - 5:00 PM'),
(109, 'Dr. Vikram Singh', 'Oncologist', 'Mon-Wed-Fri 11:00 AM - 2:00 PM'),
(110, 'Dr. Shalini Iyer', 'General Physician', 'Mon-Sun 9:00 AM - 12:00 PM');

CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Date DATE,
    Time TIME,
    Status VARCHAR(15),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

INSERT INTO Appointment 
(Appointment_ID, Patient_ID, Doctor_ID, Date, Time, Status) 
VALUES
(1011, 2, 101, '2025-09-12', '11:00:00', 'Scheduled'),
(1012, 5, 103, '2025-09-13', '09:30:00', 'Completed'),
(1013, 7, 104, '2025-09-13', '15:15:00', 'Scheduled'),
(1014, 1, 106, '2025-09-14', '10:45:00', 'Cancelled'),
(1015, 9, 102, '2025-09-14', '13:00:00', 'Scheduled'),
(1016, 3, 109, '2025-09-15', '12:30:00', 'Scheduled'),
(1017, 6, 108, '2025-09-15', '16:00:00', 'Completed'),
(1018, 10, 105, '2025-09-16', '11:45:00', 'Scheduled'),
(1019, 8, 107, '2025-09-16', '14:20:00', 'Cancelled'),
(1020, 4, 110, '2025-09-17', '10:10:00', 'Scheduled');

SELECT * FROM Patient;

SELECT * FROM Doctor;

SELECT * FROM Appointment;

SELECT * 
FROM Appointment 
WHERE Date >= CURRENT_DATE();

SELECT 
    a.Appointment_ID,
    p.Name AS PatientName,
    d.Name AS DoctorName,
    d.Specialization,
    a.Date,
    a.Time,
    a.Status
FROM Appointment a
JOIN Patient p ON a.Patient_ID = p.Patient_ID
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
ORDER BY a.Date, a.Time;

SELECT 
    a.Appointment_ID,
    d.Name AS DoctorName,
    d.Specialization,
    a.Date,
    a.Time,
    a.Status
FROM Appointment a
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
WHERE a.Patient_ID = 102
ORDER BY a.Date DESC;

SELECT Name, Specialization 
FROM Doctor 
ORDER BY Specialization;

SELECT 
    d.Name AS DoctorName,
    d.Specialization,
    COUNT(a.Appointment_ID) AS TotalAppointments
FROM Doctor d
LEFT JOIN Appointment a ON d.Doctor_ID = a.Doctor_ID
GROUP BY d.Doctor_ID, d.Name, d.Specialization
ORDER BY TotalAppointments DESC;

SELECT DISTINCT p.Name AS PatientName
FROM Appointment a
JOIN Patient p ON a.Patient_ID = p.Patient_ID
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
WHERE d.Specialization = 'Neurologist';

UPDATE Patient
SET Contact = '9014532667'
WHERE Patient_ID = 103;

DELETE FROM Appointment
WHERE Appointment_ID = 1014 AND Status = 'Cancelled';

SELECT *
FROM Appointment
WHERE Doctor_ID = 1015 AND Date = '2025-09-14' AND Time = '13:00:00';