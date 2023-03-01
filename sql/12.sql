/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

WITH BHS as (
    SELECT title from (
        SELECT title, unnest(special_features) as SF
        FROM film) as "special_features"
    WHERE SF = 'Behind the Scenes'), 

trailer as (
    SELECT title 
    FROM (
        SELECT title, unnest(special_features) as SF
        FROM film) as "special_features"  
    WHERE SF = 'Trailers') 

SELECT BHS.title
FROM BHS, trailer
WHERE BHS.title = trailer.title ORDER BY BHS.title;
