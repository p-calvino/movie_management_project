-- List all the actors born before 1980.

SELECT *
FROM main_actors_tbl
WHERE year_of_birth < 1980;

-- How many movies did Nolan direct ?

SELECT COUNT(*)
FROM directors_tbl
JOIN movies_tbl
ON directors_tbl.id = movies_tbl.director_id
WHERE directors_tbl.name LIKE "%Christopher Nolan%";

-- Among all the movies of James Cameron, how many were female actors ?

SELECT COUNT(*)
FROM directors_tbl
JOIN movies_tbl
ON directors_tbl.id = movies_tbl.director_id
JOIN movie_actors_tbl
ON movies_tbl.id = movie_actors_tbl.movie_id
JOIN main_actors_tbl
ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
WHERE directors_tbl.name LIKE "%James Cameron%"
AND main_actors_tbl.sex LIKE "F";

-- How many directors did Leonardo DiCaprio worked with ?

SELECT COUNT(*)
FROM directors_tbl
JOIN movies_tbl
ON directors_tbl.id = movies_tbl.director_id
JOIN movie_actors_tbl
ON movies_tbl.id = movie_actors_tbl.movie_id
JOIN main_actors_tbl
ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
WHERE directors_tbl.id
AND main_actors_tbl.name LIKE "%Leonardo DiCaprio%";

-- Who is the oldest director ?

SELECT name
FROM directors_tbl
ORDER BY year_of_birth ASC
LIMIT 1;

-- What is the earliest movie of the first director ?

SELECT title
FROM movies_tbl
JOIN directors_tbl
ON directors_tbl.id = movies_tbl.director_id
ORDER BY directors_tbl.id ASC, movies_tbl.release_year ASC
LIMIT 1;

-- What is the latest movie of the youngest actor ?

SELECT title
FROM movies_tbl
JOIN movie_actors_tbl
ON movie_actors_tbl.movie_id = movies_tbl.id
JOIN directors_tbl
ON directors_tbl.id = movies_tbl.director_id
JOIN main_actors_tbl
ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
ORDER BY main_actors_tbl.year_of_birth DESC, movies_tbl.release_year DESC
LIMIT 1;













