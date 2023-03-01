/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

WITH special_f as (
    SELECT title, unnest(special_features) as SF
    from film),

profits as (
    SELECT film.title, SUM(payment.amount) as profit
    FROM film
    JOIN inventory using (film_id)
    JOIN rental using (inventory_id)
    JOIN payment using (rental_id)
    GROUP BY film.title
    ORDER BY profit desc)

SELECT special_f.SF as special_feature, sum(profits.profit) as profit
FROM special_f
LEFT JOIN profits using (title)
GROUP BY special_feature
ORDER BY special_feature;
