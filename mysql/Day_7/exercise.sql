-- no. 1
SELECT country_id, country FROM country
WHERE country IN ("China", "Bangladesh", "India");


-- no. 2 
SELECT *
FROM sakila.actor
WHERE last_name LIKE "%OD%"
ORDER BY last_name, first_name;

-- no. 3
ALTER TABLE sakila.actor 
ADD COLUMN middle_name VARCHAR(45) NOT NULL AFTER first_name;

-- no. 4
SELECT * FROM ()

SELECT COUNT(last_name) as count_last_name, COUNT(actor_id), last_name
FROM actor
GROUP BY last_name
HAVING count_last_name >= 2;

-- 5
SELECT first_name, last_name, address.*
FROM staff
JOIN address
ON address.address_id= staff.address_id; 

-- 6
SELECT COUNT(inventory.film_id), film.* 
FROM inventory 
JOIN film 
ON film.film_id=inventory.film_id
WHERE film.title='Hunchback Impossible';

-- 7
SELECT title, rental_duration FROM film ORDER BY rental_duration DESC;

-- 8
SELECT store_id, city.city , country.country 
FROM store
JOIN address
ON address.address_id=store.address_id
JOIN city
ON city.city_id = address.city_id
JOIN country
ON country.country_id= city.country_id;

-- 9 
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id IN (
SELECT actor_id FROM film_actor WHERE film_actor.film_id IN
(SELECT film_id FROM film WHERE film.title="Alone Trip"));

-- 10 
ALTER TABLE `sakila`.`actor` 
DROP COLUMN `middle_name`;

SELECT * FROM actor;