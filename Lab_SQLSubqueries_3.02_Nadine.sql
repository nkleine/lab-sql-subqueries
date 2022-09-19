-- Lab 3.02
USE sakila;

-- Task 1: How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT * FROM inventory;
SELECT * FROM film;

SELECT COUNT(film_id)
FROM inventory
WHERE film_id = (SELECT film_id FROM film
WHERE title = 'Hunchback Impossible');

-- Answer: There are 6 copies of Hunchback Impossible.

-- Task 2: List all films whose length is longer than the average of all the films.
SELECT * FROM film;
SELECT AVG(length) FROM film;

SELECT title, length FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- Answer: 489 films are longer than the average of all the films.

-- Task 3: Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name, last_name FROM actor
WHERE actor_id IN (
	SELECT actor_id FROM film_actor
	WHERE film_id IN (
		SELECT film_id FROM film 
        WHERE title = 'Alone Trip'
	)
);

-- Answer: There are 8 actors playing in Alone Trip.

-- Task 4: Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
   -- Identify all movies categorized as family films.
   
SELECT title FROM film
WHERE film_id IN
(SELECT film_id FROM film_category
WHERE category_id IN
(SELECT category_id FROM category
WHERE name = 'Family'));

-- Answer: They are 69 movies in the category Family.

-- Task 5: Get name and email from customers from Canada using subqueries. Do the same with joins. 
    -- Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
    -- that will help you get the relevant information.
-- using subqueries:
SELECT first_name, last_name, email FROM customer
WHERE address_id
IN (SELECT address_id FROM address
WHERE city_id
IN (SELECT city_id FROM city
WHERE country_id
IN (SELECT country_id FROM country
WHERE country = 'Canada')));

-- Answer: There are 5 customers from Canada.

-- using JOIN:
SELECT first_name, last_name, email FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
WHERE country = 'CANADA';

-- Answer: There are 5 customers from Canada.

-- Task 6: Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. 
    -- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.


-- Task 7: Films rented by most profitable customer. 
    -- You can use the customer table and payment table to find the most profitable customer 
    -- ie the customer that has made the largest sum of payments


-- Task 8: Customers who spent more than the average payments.
