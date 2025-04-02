CREATE SCHEMA if not exists movieDB;
USE movieDB;

CREATE TABLE if not exists movie(
    movie_id int NOT NULL,
    title VARCHAR(50) NOT NULL,
    releaseyear YEAR,
    genre varchar(30),
    imdbrank float,
    PRIMARY KEY (movie_id)
);
CREATE TABLE IF NOT EXISTS actor (
    aid VARCHAR(20) NOT NULL,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    DOB DATE,
    DECEASED BOOLEAN,
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



