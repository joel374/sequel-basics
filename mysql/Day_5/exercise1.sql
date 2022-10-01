-- Problem 1 --
CREATE DATABASE purwadhika_student;
CREATE DATABASE purwadhika_schedule;
CREATE DATABASE purwadhika_branch;

SET SQL_SAFE_UPDATES = 0;

-- Problem 2 --
SHOW DATABASES LIKE "purwadhika%";

-- Problem 3
DROP DATABASE purwadhika_schedule;

-- Problem 4
CREATE TABLE Students(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(45) NOT NULL,
first_name VARCHAR(45) NOT NULL,
address VARCHAR (45) NOT NULL,
city VARCHAR (45) NOT NULL);
	
-- Problem 5
ALTER TABLE Students ADD COLUMN email VARCHAR(45) NOT NULL;

-- Problem 6
ALTER TABLE Students Add COLUMN gender INT NOT NULL,
ADD COLUMN bacth_code INT NOT NULL, 
ADD COLUMN phone_number INT NOT NULL,
ADD COLUMN alternative_phone_number INT NOT NULL;

-- Problem 7
ALTER TABLE `purwadhika_student`.`students` 
CHANGE COLUMN `alternative_phone_number` `description` VARCHAR(45) NOT NULL;

-- Problem 8
ALTER TABLE Students
DROP gender;
