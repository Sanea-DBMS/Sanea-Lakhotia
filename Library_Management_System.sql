CREATE DATABASE library_management_system;
USE library_management_system;

CREATE TABLE library_book (
	Book_ID INT PRIMARY KEY,
    Title VARCHAR(100), 
    Author VARCHAR(20), 
    Publisher VARCHAR(20), 
    ISBN VARCHAR(50), 
    Category VARCHAR(50), 
    Copies_Available INT
);

INSERT INTO library_book
(Book_ID, Title, Author, Publisher, ISBN, Category, Copies_Available) 
VALUES
(1, 'Deep Learning with Python', 'François Chollet', 'Manning Publications', '9781617294433', 'Artificial Intelligence', 6),
(2, '1984', 'George Orwell', 'Secker & Warburg', '9780451524935', 'Fiction', 4),
(3, 'The Theory of Everything', 'Stephen Hawking', 'Jaico Publishing', '9788179925911', 'Science', 5),
(4, 'Thinking, Fast and Slow', 'Daniel Kahneman', 'Straus and Giroux', '9780374533557', 'Psychology', 7),
(5, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton', '9781503290563', 'Classic', 3),
(6, 'Artificial Intelligence: A Modern Approach', 'Stuart Russell', 'Pearson', '9780136042594', 'Computer Science', 4),
(7, 'Rich Dad Poor Dad', 'Robert T. Kiyosaki', 'Warner Books', '9781612680194', 'Finance', 8),
(8, 'The Alchemist', 'Paulo Coelho', 'HarperOne', '9780061122415', 'Fiction', 6),
(9, 'Zero to One', 'Peter Thiel', 'Crown Business', '9780804139298', 'Business', 5),
(10, 'Ikigai: The Japanese Secret to a Long and Happy Life', 'Héctor García', 'Penguin Books', '9781786330895', 'Self-Help', 9);

CREATE TABLE library_member (
	Member_ID INT PRIMARY KEY, 
    Name VARCHAR(30), 
    Department VARCHAR(50), 
    Membership_Date DATE, 
    Contact VARCHAR(10)
);

INSERT INTO library_member
(Member_ID, Name, Department, Membership_Date, Contact) 
VALUES
(211, 'Neha Kapoor', 'Economics', '2022-03-11', '9822001101'),
(212, 'Arjun Reddy', 'Law', '2021-10-07', '9822001102'),
(213, 'Sanya Malhotra', 'Fine Arts', '2023-04-22', '9822001103'),
(214, 'Kartik Iyer', 'Electronics', '2022-07-19', '9822001104'),
(215, 'Ritika Singh', 'Sociology', '2021-09-15', '9822001105'),
(216, 'Manish Kumar', 'Chemistry', '2023-02-02', '9822001106'),
(217, 'Aditi Chauhan', 'Political Science', '2022-11-28', '9822001107'),
(218, 'Varun Mishra', 'Philosophy', '2021-12-30', '9822001108'),
(219, 'Shreya Banerjee', 'Statistics', '2022-05-14', '9822001109'),
(220, 'Raghav Sethi', 'Environmental Science', '2023-06-01', '9822001110');

CREATE TABLE library_transaction (
	Transaction_ID INT PRIMARY KEY, 
    Book_ID INT, 
    Member_ID INT, 
    Issue_Date DATE, 
    Return_Date DATE, 
    Fine DECIMAL(6,2),
    FOREIGN KEY (Book_ID) REFERENCES library_book(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES library_member(Member_ID)
);

INSERT INTO library_transaction 
(Transaction_ID, Book_ID, Member_ID, Issue_Date, Return_Date, Fine) 
VALUES
(311, 2, 219, '2025-09-01', '2025-09-10', 0.00),
(312, 8, 214, '2025-09-02', '2025-09-18', 5.00),
(313, 10, 213, '2025-09-03', '2025-09-08', 0.00),
(314, 6, 217, '2025-09-04', '2025-09-20', 10.00),
(315, 1, 220, '2025-09-05', '2025-09-12', 0.00),
(316, 5, 212, '2025-09-06', '2025-09-25', 20.00),
(317, 9, 216, '2025-09-07', '2025-09-14', 0.00),
(318, 4, 218, '2025-09-08', '2025-09-22', 15.00),
(319, 7, 211, '2025-09-09', '2025-09-15', 0.00),
(320, 3, 215, '2025-09-10', '2025-09-19', 0.00);

SELECT * FROM library_book;

SELECT * FROM library_member;

SELECT * FROM library_transaction;

SELECT *
FROM library_book
WHERE Copies_Available > 0;

SELECT lm.Name, lb.Title
FROM library_transaction lt
JOIN library_member lm ON lt.Member_ID = lm.Member_ID
JOIN library_book lb ON lt.Book_ID = lb.Book_ID
WHERE lt.Return_Date IS NULL;

SELECT lm.Name, lb.Title, lt.Fine
FROM library_transaction lt
JOIN library_member lm ON lt.Member_ID = lm.Member_ID
JOIN library_book lb ON lt.Book_ID = lb.Book_ID
WHERE lt.Fine > 0;

SELECT Fine, Book_ID, Member_ID, Issue_Date, Return_Date
FROM library_transaction
WHERE Fine > 0;

SELECT Name
FROM library_member;

SELECT Title
FROM library_book;

SELECT Fine
FROM library_transaction;

SELECT
    Member_ID,
    Name,
    Department,
    Membership_Date
FROM
    library_member
ORDER BY
    Name ASC;