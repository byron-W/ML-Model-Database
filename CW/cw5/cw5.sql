USE movieDBv2;

#1
SELECT DISTINCT A.first_name, A.last_name
FROM actor AS A, actor AS B
WHERE A.networth > B.networth AND B.DOB > 1930;

#2.1
SELECT genre, AVG(imdbrank) AS average_rank FROM movie
GROUP BY genre;
#2.2
SELECT movie_id, genre, AVG(imdbrank) AS average_rank FROM movie
GROUP BY genre;
#2.3
SELECT genre, MIN(releaseyear) FROM movie
WHERE NOT title = 'Oppenheimer'
GROUP BY genre;
#2.4
SELECT COUNT(movie_id), imdbrank FROM movie
GROUP BY imdbrank
ORDER BY imdbrank DESC;

#3.1
SELECT genre, MIN(imdbrank) as smallest_rank
FROM movie
GROUP BY genre
HAVING genre <> "Comedy"
ORDER BY smallest_rank ASC;
#3.2
SELECT genre, COUNT(*)
FROM movie
WHERE title <> "Charade"
GROUP BY genre;
#3.3
SELECT genre, AVG(imdbrank) as mean
FROM movie
GROUP BY genre
HAVING mean > 5;

#4.1
SELECT first_name, last_name
FROM actor
WHERE DECEASED = TRUE AND aid IN 
	(SELECT aid 
    FROM mcast 
    WHERE movie_id IN 
    (SELECT movie_id 
    FROM movie 
    WHERE genre = "comedy"));
#4.2
SELECT movie_id, COUNT(*)
FROM mcast
GROUP BY movie_id;
#4.2
SELECT movie_id, COUNT(*)
FROM mcast
GROUP BY movie_id 
HAVING movie_id in
	(SELECT movie_id
    FROM movie
    WHERE genre = "comedy");
    
#5
SELECT genre, avg_rank
FROM (SELECT genre, avg(imdbrank) AS avg_rank
	FROM movie
    GROUP BY genre) as A
WHERE avg_rank > 5;

#6
SELECT title, imdbrank, (imdbrank - (SELECT MIN(imdbrank) FROM movie)/(SELECT MAX(imdbrank) FROM movie) - (SELECT MIN(imdbrank) FROM movie)) as norm_rank
FROM movie;