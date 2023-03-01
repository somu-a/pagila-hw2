/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH special_f as (
    SELECT title, unnest(special_features) as SF
    FROM film)

SELECT special_f.SF as special_features, count(special_f.SF)
FROM special_f
GROUP BY special_features
ORDER BY special_features;
