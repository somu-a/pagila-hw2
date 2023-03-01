/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT film.title from customer, rental, inventory, film
WHERE customer.customer_id = rental.customer_id and rental.inventory_id = inventory.inventory_id and inventory.film_id = film.film_id and customer.customer_id = 1
GROUP BY film.title
HAVING count(*) > 1
ORDER BY film.title;
