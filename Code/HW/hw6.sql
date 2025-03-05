USE horse_racing_v2;

#1
CREATE VIEW horse_jockey AS
	SELECT h_id, h_name, jockey, prize FROM horse NATURAL LEFT JOIN horse_race;

#2
SELECT h_name AS horse_name FROM horse_jockey
	WHERE jockey = "Declan Cannon";

#3
SELECT h_name AS horse_name, SUM(prize) AS total_winnings FROM horse_jockey
	GROUP BY h_name;
#4
SELECT h_name AS horse_name, SUM(prize) AS total_winnings FROM horse NATURAL JOIN horse_race
	GROUP BY h_name;
    
#5
SELECT h_name, r_name, r_date FROM horse NATURAL JOIN race NATURAL JOIN horse_race AS A 
	WHERE r_date = 
		(SELECT MAX(r_date) FROM race NATURAL JOIN horse_race AS B 
        WHERE A.h_id = B.h_ID);

#6.1
ALTER TABLE horse ADD CONSTRAINT foal_check
	CHECK(foaled BETWEEN '1990-12-31' AND '2100-01-01');
#6.2
ALTER TABLE horse ADD CONSTRAINT gender_check
	CHECK(gender IN ('foal', 'yearling', 'colt', 'gelding', 'mare', 'filly', 'stallion'));
#6.3
INSERT INTO horse VALUES (7, 'Random Horse Name', 'colt', 'Goldencents', 'Jumby Bay', 'active', 'brown', 'USA', '1900-01-01'); 
-- Error Code: 3819. Check constraint 'foal_check' is violated.
INSERT INTO horse VALUES (7, 'Random Horse Name', 'Gender', 'Goldencents', 'Jumby Bay', 'active', 'brown', 'USA', '2000-01-01'); 
-- Error Code: 3819. Check constraint 'gender_check' is violated.