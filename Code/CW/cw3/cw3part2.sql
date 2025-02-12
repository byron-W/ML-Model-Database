USE movie_schema;
#4
INSERT INTO actor VALUES 
	(2, "Andy", "Griffin", 1926),
    (3, "Walter", "Matthau", 1920),
    (71, "Mel", "Brooks", 1926),
    (72, "Audrey", "Hepburn", 1929), 
    (73, "Walter", "Matthau", 1920),
    (74, "Cary", "Grant", 1904);
INSERT INTO movie (mID, title, release_year) VALUES
	(1, "A Face in the Crowd", 1957),
    (5, "Charade", 1963);
INSERT INTO cast VALUES
	(1, 2, "Larry Rodes"),
    (1, 3, "Mel Miller"),
    (5, 72, "Regina Lampert"),
    (5, 73, "Carson Dyle"),
    (5, 74, "Brian Cruikshank");

#5.1
INSERT INTO movie VALUES
	(100, "12 Angry Men",1957, 9, NULL);
#5.2
INSERT INTO movie VALUES
    (5, "Funny Face", 1957, 7, NULL);
#5.3
INSERT INTO movie VALUES
    (7, "Oppenheimer", 2023, 8.3, NULL),
    (8, "Barbie", 2023, 6.8, NULL);
#5.4
INSERT INTO cast VALUES
	(10, 7, "Regina");

#6.1
UPDATE movie SET myrank = 0;
#6.2
SET sql_safe_updates=0;
UPDATE movie SET myrank = 0;
#6.3
UPDATE movie SET myrank = 10 
	WHERE title = 'Oppenheimer';
    
#7.1
DELETE FROM cast;
DELETE FROM actor;
#7.2
INSERT INTO actor VALUES 
	(2, "Andy", "Griffin", 1926),
    (3, "Walter", "Matthau", 1920),
    (71, "Mel", "Brooks", 1926),
    (72, "Audrey", "Hepburn", 1929), 
    (73, "Walter", "Matthau", 1920),
    (74, "Cary", "Grant", 1904);
INSERT INTO cast VALUES
	(1, 2, "Larry Rodes"),
    (1, 3, "Mel Miller"),
    (5, 72, "Regina Lampert"),
    (5, 73, "Carson Dyle"),
    (5, 74, "Brian Cruikshank");

#7.3
DELETE FROM movie WHERE release_year = 1957;
DELETE FROM cast WHERE aID = 2;
# 7.4
INSERT INTO cast VALUES
	(1, 2, "Larry Rodes");
INSERT INTO movie VALUES
	(1, 'A Face in the Crowd', 1957, NULL, NULL);