#Exercises
USE moviedb;
#2.1
SELECT * FROM actor;
SELECT * FROM movie;
SELECT * FROM mcast;
#2.2
SELECT first_name FROM actor;
#2.3
SELECT first_name FROM actor 
	WHERE first_name LIKE "m%";
#2.4
SELECT first_name, last_name FROM actor
	WHERE YEAR(DOB) < 1950;
#2.5
SELECT last_name FROM actor 
	WHERE first_name = "Patricia" AND YEAR(DOB)< 1950;
#2.7
SELECT last_name FROM actor
	ORDER BY last_name ASC;
SELECT DISTINCT last_name FROM actor
	ORDER BY last_name ASC;
#2.8
SELECT title, YEAR(curdate())-releaseyear as years_ago FROM movie;
#2.10
SELECT COUNT(last_name) FROM actor;
SELECT COUNT(DISTINCT last_name) FROM actor;
#2.11
SELECT COUNT(DISTINCT aid) FROM mcast;
#2.12
SELECT COUNT(movie_id) FROM movie 
	WHERE releaseyear < 1950;
#3.1
SELECT first_name FROM actor 
	WHERE YEAR(DOB) < 1930 OR YEAR(DOB) > 1950; # can use NOT BETWEEN instead
#3.2
SELECT * FROM actor
	WHERE first_name = "Margot" OR first_name = "George";
#4
SELECT first_name, last_name, title FROM actor, movie, mcast
	WHERE mcast.aid = actor.aid AND movie.movie_id = mcast.movie_id;
#5.1
SELECT title FROM movie
	WHERE imdbrank IS NULL;
#5.2
SELECT title FROM movie
	WHERE imdbrank IS NOT NULL;
#6.1
SELECT AVG(imdbrank) FROM movie;
#6.2
SELECT MIN(imdbrank) FROM movie;
#6.3
SELECT MAX(imdbrank) FROM movie;
#6.4
SELECT MAX(imdbrank) as largest_rank FROM movie;
#6.5
SELECT AVG(imdbrank) as avg_function FROM movie;
SELECT SUM(imdbrank) / COUNT(imdbrank) as avg_manual FROM movie;
#7.1
SELECT AVG(imdbrank) FROM movie
	GROUP BY genre;
#7.2
SELECT AVG(imdbrank) FROM movie
	WHERE NOT genre = "comedy" GROUP BY genre;
#7.3
SELECT title, COUNT(*) AS num_actor FROM mcast, movie
	WHERE movie.movie_id = mcast.movie_id GROUP BY title ORDER BY num_actor ASC;
#7.4
SELECT title, COUNT(*) as num_actors FROM mcast, movie
	WHERE movie.movie_id = mcast.movie_id GROUP BY title HAVING num_actors >= 2;