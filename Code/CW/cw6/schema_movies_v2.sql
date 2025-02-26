CREATE SCHEMA if not exists movieDBv2;
USE movieDBv2;

CREATE TABLE if not exists movie(
    movie_id int NOT NULL,
    title VARCHAR(50) NOT NULL,
    releaseyear YEAR,
    genre varchar(30),
    imdbrank float,
    PRIMARY KEY (movie_id)
);
CREATE TABLE IF NOT EXISTS actor (
    aid varchar(20) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    DOB DATE,
    DECEASED Boolean,
    networth decimal(14,2),
    PRIMARY KEY (aid)
);
CREATE TABLE IF NOT EXISTS mcast (
    movie_id int NOT NULL,
    aid varchar(20) NOT NULL,
    arole varchar(50),
    PRIMARY KEY (movie_id,aid),
    FOREIGN KEY (movie_id)
        REFERENCES movie (movie_id),
    FOREIGN KEY (aid)
        REFERENCES actor (aid)
);


SELECT count(*) 
FROM actor NATURAL LEFT JOIN mcast;

SELECT * 
FROM actor LEFT JOIN mcast using(aid);

