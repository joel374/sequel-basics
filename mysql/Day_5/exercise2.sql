-- Problem 1
CREATE TABLE branch(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
branch_name VARCHAR(45) NOT NULL,
pic VARCHAR(45) NOT NULL,
address VARCHAR(45) NOT NULL,
city VARCHAR(45) NOT NULL,
province VARCHAR(45) NOT NULL);

INSERT INTO `purwadhika_branch`.`branch` 
(`branch_name`, `pic`, `address`, `city`, `province`) 
VALUES ('BSD', 'THOMAS', 'GREEN OFFICE PARK 9', 'BSD', 'TANGERANG');

INSERT INTO `purwadhika_branch`.`branch` 
(`branch_name`, `pic`, `address`, `city`, `province`) 
VALUES ('JKT', 'BUDI', 'MSIG TOWER', 'JAKARTA SELATAN', 'JAKARTA');

INSERT INTO `purwadhika_branch`.`branch` 
(`branch_name`, `pic`, `address`, `city`, `province`) 
VALUES ('BTM', 'ANGEL', 'NONGSA', 'BATAM', 'KEP. RIAU');

-- Problem 2
UPDATE branch
SET pic="Dono"
WHERE id=1;

-- Problem 3
INSERT INTO `purwadhika_branch`.`branch` 
(`branch_name`, `pic`, `address`, `city`, `province`) 
VALUES ('BLI', 'Tono', 'Gianyar', 'Gianyar', 'Bali');


SELECT * FROM branch;