USE horse_racing;

/* Part A 
For the horse_race relation, we're adding an attribute named "finish" that only takes small positive integers.
*/
ALTER TABLE horse_race
	ADD finish SMALLINT UNSIGNED;

/* Part B
For the horse_race relation, we're setting the finish variable equal to where each horse finished in their
respective races according to the instructions.
*/
UPDATE horse_race
	SET finish = 2 WHERE h_id = 1 AND r_id = 21;
UPDATE horse_race
	SET finish = 1 WHERE h_id = 3 AND r_id = 21;
UPDATE horse_race
	SET finish = 5 WHERE h_id = 1 AND r_id = 22;
UPDATE horse_race
	SET finish = 3 WHERE h_id = 4 AND r_id = 23;

/* Part C
From the horse relation, we're selecting all of the horse's names and colors that are retired.
*/
SELECT h_name, color FROM horse
	WHERE h_status = "retired";

/* Part D
From the horse relation, we're selecting all of the horse's names and calculating their age by 
subtracting the current year from the year they were born (foaled). Then we list them by age in 
ascending order.
*/
SELECT h_name, YEAR(curdate()) - YEAR(foaled) as age FROM horse
	ORDER BY age ASC;

/* Part E
From the horse_race relation, we're counting each distinct jockey.
*/
SELECT COUNT(DISTINCT jockey) FROM horse_race;

/* Part F
From the horse relation, we're averaging out all of the horses ages that are calculated by
subtracting the current year from the year they were born (foaled).
*/
SELECT AVG(YEAR(curdate()) - YEAR(foaled)) FROM horse;