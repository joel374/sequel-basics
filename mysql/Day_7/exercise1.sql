CREATE DATABASE Day6_Group_Project;
USE Day6_Group_Project;

-- Branch
CREATE TABLE Branch (
  Branch_ID INT NOT NULL AUTO_INCREMENT,
  Location VARCHAR(45) NOT NULL,
  City VARCHAR(45) NOT NULL,
  Country VARCHAR(45) NOT NULL,
  PRIMARY KEY (Branch_ID));

INSERT INTO Branch(Location, City, Country)
VALUES 
("BSD", "Tangerang Selatan", "Indonesia"),
("Sudirman", "Jakarta", "Indonesia");

-- Member
CREATE TABLE Member(
  Member_id INT NOT NULL AUTO_INCREMENT,
  NIK INT NOT NULL,
  Name VARCHAR(45) NOT NULL,
  Place_of_Birth VARCHAR(45) NOT NULL,
  Date_of_Birth DATE NOT NULL,
  Address VARCHAR(45) NOT NULL,
  PRIMARY KEY (Member_id));
  
INSERT INTO Member ( NIK, Name, Place_of_Birth, Date_of_Birth, Address) 
VALUES ( '312298259', 'Deni', 'Jakarta', ' 1980-06-03', '47 MySakila Drive'),
( '321242525', 'Daniel', 'Yogyakarta', '1993-07-11', '1411 Lillydale Drive'),
( '312223424', 'Fitri', 'Bandung', '1998-01-14', '478 Joliet Way'),
( '327283759', 'Anggi', 'Jakarta', '1990-03-23', '613 Korolev Drive'),
( '398787472', 'Rian', 'Tangerang', '1992-02-17', '1531 Sal Drive');

-- Books
CREATE TABLE Books (
Book_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Title VARCHAR(50),
Author VARCHAR(50), 
Genre VARCHAR(50));

INSERT INTO Books (Book_id, Title, Author, Genre) 
VALUES ('001', 'Fundamentals of Wavelets', 'Goswami Jaideva', 'Science'),
('002', 'Books of Laughter', 'Jeremy Nowen', 'Comedy'),
('003', 'Data Science World', 'Son of Einstain', 'Science'),
('004', 'Superman The Novel', 'Thomas Newel', 'Action'),
('005', 'Superman is Dead', 'Jerinx', 'Musical'),
('006', 'Novel of the Dead', 'Deadman', 'Horror'),
('007', 'Physics & Philosophy', 'Heisenberg, Werner', 'Science'),
('008', 'New Machiavelli', 'Wells H. G.', 'Fiction'),
('009', 'Complete Sherlock Holmes 1', 'Sherlock Holmes', 'Mystery'),
('010', 'Complete Sherlock Holmes 2', 'Sherlock Holmes', 'Mystery');
DELETE FROM Books WHERE Book_id IN (001,002,003,004,005,006,007,008,009,010);

SELECT * FROM Books WHERE Genre="Science";


-- Staff
CREATE TABLE Staff (
  Staff_ID INT NOT NULL AUTO_INCREMENT,
  Branch_ID VARCHAR(45) NOT NULL,
  Name VARCHAR(45) NOT NULL,
  Schedule VARCHAR(45) NOT NULL,
  PRIMARY KEY (Staff_ID));

ALTER TABLE Staff
CHANGE Branch_ID Branch_ID INT NOT NULL;

INSERT INTO Staff (Branch_ID, Name, Schedule) 
VALUES (1,'Yuke', 'Pagi'),
(1,'Santi', 'Sore'),
(2,'Anna', 'Pagi'),
(2,'Dinda', 'Sore'); 

SELECT * FROM Staff;

-- Activities
CREATE TABLE Activities (
 ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 Member_id INT NOT NULL,
 Transaction_ID INT NOT NULL,
 Fine INT);
 
-- Transaction 
 CREATE TABLE Transaction (
 Branch_id INT NOT NULL,
 Member_id INT NOT NULL,
 Transaction_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 Staff_id INT NOT NULL,
 Total INT,
 Due_date DATE);
 
 -- Items
 CREATE TABLE Items (
 Items_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 Transaction_ID INT NOT NULL,
 Book_id INT NOT NULL);
 
 SELECT * FROM Transaction;
 INSERT INTO Transaction (Branch_id,  Member_id ,  Transaction_ID ,  Staff_id ,  Total ,  Due_date ) 
 VALUES ('1', '1', '1', '2', '3', '2022-09-21'), 
 ('1', '1', '2', '2', '1', '2022-09-21'),
 ('1', '1', '3', '2', '1', '2022-09-21'),
 ('1', '1', '4', '1', '1', '2022-09-22'), 
 ('2', '2', '5', '1', '1', '2022-09-22'),
 ('2', '3', '6', '2', '1', '2022-09-22');
 
 
INSERT INTO Items (Items_id, Transaction_ID, Book_id) 
VALUES ('1', '1', '001'),
 ('2', '1', '002'),
 ('3', '1', '003'),
 ('4', '2', '009'),
 ('5', '3', '010'),
 ('6', '4', '005'),
 ('7', '5', '007'),
 ('8', '6', '004');
 
SELECT * FROM Activities;
INSERT INTO Activities (ID, Member_id, Transaction_ID, Fine) 
VALUES ('1', '1', '1', '6000'),
 ('2', '1', '2','2000'),  
 ('3', '1', '3','2000'),
 ('4', '1', '4', '0'),
 ('5', '2', '5','0'),  
 ('6', '3', '6','0');

 SELECT * FROM Member;
 SELECT * FROM Activities;
 SELECT * FROM Transaction;
 SELECT * FROM Branch;
 SELECT * FROM Items;
 SELECT * FROM Staff;
 SELECT * FROM Books;
 
 -- Soal 1
 SELECT Mem.Member_id, NIK, Name, Address, Fine FROM Member AS Mem
 INNER JOIN Activities AS Act ON Act.Member_id = Mem.Member_id;
 
-- Soal 2
SELECT S.*, B.* FROM Staff AS S
INNER JOIN Branch AS B ON B.Branch_id = S.Branch_id; 

-- Soal 3
SELECT COUNT(*) FROM items WHERE transaction_ID IN (
SELECT transaction_ID FROM transaction WHERE member_ID = (
SELECT Member_ID FROM member WHERE Name = "Deni")
);

