/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

WITH rentals as (SELECT distinct film.title, rental.customer_id
    FROM film
    JOIN inventory using (film_id)
    JOIN rental using (inventory_id)),

us_customers as (SELECT customer.customer_id
    FROM customer
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country using (country_id)
    WHERE country.country_id = 103),

us_rents as (SELECT *
    FROM rentals
    WHERE rentals.customer_id in (SELECT * from us_customers))

SELECT distinct rentals.title
FROM rentals
LEFT JOIN us_rents using(customer_id)
WHERE rentals.title NOT IN (SELECT title from us_rents)
ORDER BY rentals.title;
