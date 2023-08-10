USE sakila;

-- 1.How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT COUNT(fc.film_id) as number_of_film ,  c.name as category
FROM sakila.film_category fc  
JOIN sakila.category c  
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY number_of_film DESC;

-- 2.Display the total amount rung up by each staff member in August of 2005.

SELECT SUM(p.amount) as total_money, s.staff_id
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
WHERE payment_date lIKE '2005-08%'
GROUP BY p.staff_id;

-- 3.Which actor has appeared in the most films?
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(f.film_id) AS number_of_film
FROM actor a
JOIN film_actor f
ON a.actor_id = f.actor_id
GROUP BY actor_name
ORDER BY number_of_film DESC
LIMIT 1;

-- 4.Most active customer (the customer that has rented the most number of films)
SELECT c.customer_id, COUNT(r.rental_id) 
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY COUNT(r.rental_id) DESC
LIMIT 1;

-- 5.Display the first and last names, as well as the address, of each staff member.
SELECT CONCAT(s.first_name,' ',s.last_name) AS staff_name, CONCAT(a.address,', ',c.city) AS address 
FROM staff s
JOIN address a
ON a.address_id = s.address_id
JOIN city c
ON c.city_id = a.city_id
GROUP BY s.staff_id;

-- 6.List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(a. actor_id) as number_of_actor
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
JOIN film f
ON f.film_id = fa.film_id
GROUP BY f.title;

-- 7.Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT c.last_name, SUM(p.amount)
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name;

-- 8.List the titles of films per category.
SELECT f.title, c.name as category
FROM film f
JOIN film_category fc
USING (film_id)
JOIN category c 
USING (category_id);




