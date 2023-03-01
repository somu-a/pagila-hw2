/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

WITH actor_names as (
    SELECT film.title, (actor.first_name || ' ' || actor.last_name) as "Actor Name" 
    FROM film
    JOIN film_actor using (film_id)
    JOIN actor using (actor_id)),

special_f as (
    SELECT title, unnest(special_features) as SF
    from film)

SELECT "Actor Name"
from actor_names
WHERE actor_names.title in (
    SELECT title 
    FROM special_f WHERE SF = 'Behind the Scenes')
GROUP BY "Actor Name"
ORDER BY "Actor Name";
