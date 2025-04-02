DROP DATABASE if exists movie_schema;
CREATE DATABASE if not exists movie_schema;
USE movie_schema;
CREATE TABLE if not exists movie (
	mID SMALLINT UNSIGNED,
    title VARCHAR(30) NOT NULL,
    release_year YEAR, 
    PRIMARY KEY (mid)
);
CREATE TABLE if not exists actor (
	aID SMALLINT UNSIGNED,
    firstname VARCHAR(20),
    lastname VARCHAR(20),
    YOB YEAR, PRIMARY KEY (aID)
);
CREATE TABLE if not exists cast (
	mID SMALLINT UNSIGNED,
    aID SMALLINT UNSIGNED,
    arole VARCHAR(30),
    PRIMARY KEY(mID, aID),
    FOREIGN KEY (mID) 
		REFERENCES movie(mID),
    FOREIGN KEY (aID) 
		REFERENCES actor(aID)
);
CREATE TABLE if not exists country (
	cID SMALLINT UNSIGNED,
    country_name VARCHAR(20),
    PRIMARY KEY (cID)
);

#2 DROP ALL TABLES THEN RECOVER

#3.1
ALTER TABLE movie
	ADD imdbrank SMALLINT,
    ADD myrank SMALLINT;
#3.2
ALTER TABLE country
	DROP country_name;
#3.3
ALTER TABLE movie 
	MODIFY imdbrank FLOAT;
ALTER TABLE movie 
	MODIFY myrank FLOAT;
#3.4
ALTER TABLE country
	RENAME region;
#3.5
ALTER TABLE region
	RENAME COLUMN cID TO rID;

/* comment stuff */
-- comment more stuff
# comment even more stuff