USE sakila;

-- relasi one too many one nya adalah languange many nya adalah film  
SELECT * FROM film;
SELECT * FROM language;

SELECT film_id, title, name FROM film f -- left table--
JOIN language  l -- right table --
-- by default JOIN saja berarti inner join 
ON f.language_id = l.language_id;

-- connector table digunakan untuk relasi many to many

SELECT title, length FROM film
WHERE length < (SELECT AVG(length) AS avg_length FROM film);
-- subquery hanya bisa mereturn 1 kolom saja

SELECT * FROM payment
WHERE customer_id IN
(SELECT customer_id FROM customer WHERE active = 1);

SELECT * FROM payment p
JOIN customer c
ON c.customer_id = p.customer_id;
