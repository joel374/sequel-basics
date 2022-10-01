CREATE DATABASE practice_db_2202;

USE practice_db_2202;

SHOW DATABASES;

CREATE TABLE students(
    full_name VARCHAR(60) NOT NULL,
    grade INT NOT NULL
);

SHOW TABLES;
DROP TABLE products;
CREATE TABLE products 
(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
product_name VARCHAR (45) NOT NULL, 
price INT NOT NULL, 
stock INT NOT NULL DEFAULT 0);

-- CRUD Queries
-- Insert data (Create)
INSERT INTO products VALUES (0, "Leci", 5000, 5);
SELECT * FROM products;
INSERT INTO products (product_name, price)
VALUES ("Jeruk", 10000);

-- Delete data
DELETE FROM products WHERE id = 3;

-- Update data
UPDATE products SET price = 7000 WHERE id = 1;

SELECT COUNT(*) FROM passengers WHERE Age BETWEEN 20 AND 29;
SELECT MAX(Fare) as avgfare, Pclass FROM passengers GROUP BY Pclass;
SELECT * FROM passengers LIMIT 10 OFFSET 10;
SELECT * FROM passengers ORDER BY Fare DESC;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;

SELECT * FROM products;
SELECT * FROM products WHERE id = 1;