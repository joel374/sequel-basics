-- Problem 1
INSERT INTO `sakila`.`actor` (`first_name`, `last_name`) VALUES (' JHONNY ', 'DAVIS');

use sakila;
-- Problem 2
INSERT INTO `sakila`.`actor` (`first_name`, `last_name`) VALUES 
('ADAM', 'DAVIS'),
('JEREMY', 'DAVIS'),
('CRAIG', 'DAVIS'),
('STEVE', 'DAVIS ');

select * from actor;

-- Problem 3
SELECT COUNT(last_name) as count FROM actor WHERE last_name="DAVIS";

-- Problem 4
DELETE FROM actor WHERE first_name="JEREMY" and last_name='DAVIS'; 

-- Problem 5
UPDATE actor 
SET last_name="GORGE" 
WHERE last_name="DAVIS";

-- Problem 6
SELECT 
COUNT(*) AS count_film, a.actor_id, a.first_name, a.last_name
FROM film_actor fa
JOIN actor a ON a.actor_id = fa.actor_id
GROUP BY actor_id
ORDER BY count_film DESC
LIMIT 10;

-- SELECT 
-- COUNT(*) AS count_films, a.actor_id, a.first_name, a.last_name
-- FROM film_actor fa
-- JOIN actor a ON a.actor_id = fa.actor_id
-- GROUP BY actor_id
-- ORDER BY count_films DESC
-- LIMIT 10;