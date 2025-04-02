USE moviedbv2;
#1
SELECT * FROM actor JOIN mcast;
SELECT * FROM actor NATURAL JOIN mcast;

#2.1
SELECT first_name, last_name, movie_id 
	FROM actor NATURAL JOIN mcast;
#2.2
SELECT first_name, last_name, aid FROM actor
	WHERE aid NOT IN 
    (SELECT aid FROM mcast);
#2.3
SELECT COUNT(DISTINCT aid) as num_actors, genre 
	FROM mcast NATURAL JOIN movie
	GROUP BY genre;


#3
SELECT first_name, last_name, title 
	FROM actor NATURAL LEFT JOIN (mcast NATURAL JOIN movie);

#4.1
CREATE VIEW actormovie AS
	SELECT first_name, last_name, DOB, title, releaseyear, genre, arole
    FROM actor NATURAL JOIN (mcast NATURAL JOIN movie);
#4.2
SELECT first_name, last_name, DOB, title, arole FROM actormovie
	WHERE releaseyear - YEAR(DOB) < 30;
#4.3
CREATE VIEW n_actor_per_movie AS
	SELECT COUNT(DISTINCT last_name) as num_actors, genre 
    FROM actormovie
	GROUP BY genre;
#4.4
CREATE VIEW initials AS
	SELECT first_name, last_name, concat(LEFT(first_name, 1), LEFT(last_name, 1)) as initial 
	FROM actormovie;
DROP VIEW initials;

#5-A
ALTER TABLE movie 
	ADD CHECK(movie_id IS NOT NULL);
# ALTER TABLE movie DROP CONSTRAINT movie_chk_3;
#5-B
ALTER TABLE actor 
	ADD CONSTRAINT common_sense1 
	CHECK(DOB between "1900-01-01" AND '2025-12-31');
# ALTER TABLE actor DROP CONSTRAINT common_sense1;
# Test
INSERT INTO actor VALUES 
	(7,'Test A', 'Test B', '2224-01-01',1,1);
#5-C
UPDATE movie SET genre = NULL 
	WHERE movie_id = 3;
ALTER TABLE movie
	ADD CHECK(genre in ('Comedy','Fantasy','drama','Biography','sci-fi','animation','musical'));

