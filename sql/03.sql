/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */

WITH most_profit as (
    SELECT film_id FROM film
    JOIN inventory using(film_id)
    JOIN rental on inventory.inventory_id = rental.inventory_id
    JOIN payment on rental.rental_id = payment.rental_id
    GROUP BY film.film_id
    ORDER BY sum(payment.amount) desc LIMIT 5)

SELECT customer.customer_id
FROM customer
JOIN rental using(customer_id)
JOIN inventory using(inventory_id)
JOIN film using(film_id)
WHERE film_id in (SELECT * FROM most_profit)
GROUP BY customer.customer_id
ORDER BY customer.customer_id;
