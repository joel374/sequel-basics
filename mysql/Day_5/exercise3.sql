-- Problem 1
SELECT first_name, last_name FROM actor;

-- Problem 2
SELECT actor_id, first_name, last_name FROM actor WHERE first_name LIKE 'joe%';

-- Problem 3
SELECT address, district, city_id 
FROM address 
-- WHERE district='California'or district="Alberta" or district="Mekka" ;
WHERE district IN ("California",'Alberta','Mekka');

-- Problem 4
SELECT COUNT(*) FROM actor WHERE last_name Like '%WOOD';

-- Problem 5

SELECT SUM(amount) as sum, COUNT(customer_id) as count, customer_id 
FROM payment 
GROUP BY customer_id HAVING count > 20 ORDER BY count DESC;
-- having digunakan untuk memfilter 

-- Problem 6
SELECT SUM(amount) as sum,COUNT(customer_id) as count,customer_id FROM payment
GROUP BY customer_id ORDER BY count DESC LIMIT 3;








