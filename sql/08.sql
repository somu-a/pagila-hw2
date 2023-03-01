/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH g_rates as (
    SELECT title
    FROM film
    WHERE rating = 'G'),

special_feature as (
    SELECT title, unnest(special_features) as SF
    FROM film)

SELECT title from g_rates
JOIN special_feature using (title)
WHERE special_feature.SF = 'Trailers'
ORDER BY title;


