INSERT INTO actor 
	VALUES ("1904CG", "Cary", "Grant", '1904-01-18', 1,0),
	("1907KH", "Katharine", "Hepburn", '1907-05-12', 1,0),
	("1915PL", "Priscilla", "Lane", '1915-06-12', 1,0),
	("1921AH", "Audrey", "Hepburn", '1921-05-04', 1,0),
	("1926PN", "Patricia", "Neal", '1926-01-20', 1,0),
	("1928GP", "George", "Peppard", '1928-10-01', 1,0),
	("1976CM", "Cillian", "Murphy", '1976-05-25', 0, 20000000),
	("1983EB", "Emily", "Blunt", '1983-02-23', 0,80000000), 
	("1990MR"," Margot", "Robbie", '1990-07-02', 0,60000000);
    
    
INSERT INTO movie (movie_id,title,genre,imdbrank,releaseyear)
 VALUES (1, "Arsenic and Old Lace", "comedy", 7.9, 1944),
 (2, "Oppenheimer", "biography", 8.3, 2023),
 (3, "Charade", "comedy", "7.8", 1963),
 (4, "Breakfast at Tiffanys", "comedy", NULL, 1961),
 (5, "Holiday", "musical", 7.7, 1938);

INSERT INTO mcast 
	VALUES (1, "1904CG", "Mortimer Brewster"),
	(1, "1915PL", "Elaine Harper"),
	(2, "1976CM", "J. Robert Oppenheimer"),
	(2, "1983EB", "Kitty Oppenheimer"),
	(4, "1921AH", "Holly Golightly"),
	(4, "1928GP", "Paul Varjak"),
	(4, "1926PN", "2E Failenson"),
	(5, "1904CG", "Johnny Case");