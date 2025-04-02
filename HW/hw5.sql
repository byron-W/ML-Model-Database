USE horse_racing;

#Problem A
SELECT h_name as Horse FROM horse
	WHERE h_ID IN 
    (SELECT h_id FROM horse_race
		WHERE jockey = 'Declan Cannon');

#Problem B
SELECT h_name AS Horse, 
	(SELECT COUNT(*) 
		FROM horse_race 
		WHERE horse_race.h_ID = horse.h_ID AND finish = 1) 
			as First_Place_Wins
	FROM horse
	ORDER BY First_Place_Wins DESC;

#Problem C
SELECT jockey, COUNT(*) AS num_races
	FROM horse_race
	GROUP BY jockey
	HAVING num_races = (SELECT MAX(races)
						FROM (SELECT COUNT(*) AS races
							FROM horse_race
							GROUP BY jockey) AS counts);