-- SAKILA
-- 1. Jumlah actor yang pernah main film category "Comedy" dan "Action"
-- 2. Rata-rata amount payment dari customer yang berasal dari store 1
-- 3. List customer yang berasal dari France

-- WORLD
-- 4. Rata-rata populasi kota setiap negara
-- 5. List nama kota dan nama negara yang negaranya sebuah republic
-- 6. List nama negara region Southeast Asia yang memiliki GNP
--    di atas rata-rata region-nya sendiri

USE sakila;

-- SAKILA
-- 1.
SELECT COUNT(DISTINCT(actor_id))
FROM film_actor
JOIN  film_category ON film_category.film_id = film_actor.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE category.name='Action' OR category.name='Comedy' ;

-- 2
SELECT AVG(amount) 
FROM payment
JOIN customer ON customer.customer_id = payment.customer_id
WHERE store_id=1;

-- 3 
SELECT customer_id, first_name,last_name, country.country 
FROM customer
JOIN address ON address.address_id=customer.address_id
JOIN city ON city.city_id = address.city_id
JOIN country ON country.country_id=city.country_id
WHERE country.country='France';

-- WORLD
-- 4
USE world;

SELECT country.Name, city.Name, AVG(city.Population)
FROM city
JOIN country ON country.Code= city.CountryCode
GROUP BY CountryCode;

-- 5
SELECT country.name, city.name FROM country
JOIN city ON city.CountryCode = country.code
WHERE GovernmentForm='Republic';

-- 6

SELECT Name FROM Country
WHERE GNP > (
SELECT * FROM average_sea_gnp
)AND Region="Southeast Asia"
