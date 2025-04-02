USE wsevdata;
#1.1
SELECT COUNT(VehicleID) FROM inventory;
#1.2
SELECT PostalCode, COUNT(VehicleID)
	FROM inventory LEFT JOIN modeldetails ON inventory.make = modeldetails.make AND inventory.make = modeldetails.make
    WHERE EVType LIKE '%EV%'
    GROUP BY PostalCode
	ORDER BY COUNT(VehicleID) DESC
    LIMIT 1;
#1.3
SELECT inventory.Model, COUNT(VehicleID)
	FROM inventory LEFT JOIN modeldetails ON inventory.make = modeldetails.make AND inventory.make = modeldetails.make
    WHERE EVType LIKE '%BEV%'
    GROUP BY inventory.Model
	ORDER BY COUNT(VehicleID) DESC
    LIMIT 1;
#1.4
SELECT EVType, COUNT(*) * 100 / SUM(COUNT(*)) over() AS Total_Percentage
	FROM modeldetails LEFT JOIN inventory on modeldetails.Make = inventory.Make AND modeldetails.Model = inventory.Model
	GROUP BY EVType;
#1.5
SELECT Make, COUNT(*) * 100 / (SELECT COUNT(*) FROM inventory) as Percentage_Market
	FROM inventory
	GROUP BY Make
	ORDER BY COUNT(*) DESC
	LIMIT 1;
#1.6
SELECT make, MIN(ElectricRange), MAX(ElectricRange) FROM inventory
	GROUP BY make;
#1.7
SELECT inventory.make, inventory.model, EVType, MIN(ElectricRange), MAX(ElectricRange) 
	FROM modeldetails LEFT JOIN inventory on modeldetails.Make = inventory.Make AND modeldetails.Model = inventory.Model
	GROUP BY inventory.make, inventory.model, EVType;
#1.8
SELECT City, COUNT(*) AS EV_TOTAL
	FROM location LEFT JOIN inventory on location.PostalCode = inventory.PostalCode
	LEFT JOIN modeldetails on inventory.Make = modeldetails.Make AND inventory.Model = modeldetails.Model
	GROUP BY City
	ORDER BY COUNT(EVType) DESC
	LIMIT 1;
#2.1
CREATE VIEW EVNZ AS
    SELECT inventory.make, inventory.model, ElectricRange, EVType
    FROM inventory LEFT JOIN modeldetails ON inventory.Make = modeldetails.Make AND inventory.Model = modeldetails.Model
    WHERE ElectricRange > 0;
#2.2
SELECT MIN(ElectricRange), MAX(ElectricRange), AVG(ElectricRange), EVType FROM EVNZ
	GROUP BY EVType;
#2.3
SELECT MIN(ElectricRange), MAX(ElectricRange), AVG(ElectricRange), EVType
    FROM inventory LEFT JOIN modeldetails ON inventory.Make = modeldetails.Make AND inventory.Model = modeldetails.Model
    GROUP BY EVType;
#2.4
SELECT '2.2' AS Problem, MIN(ElectricRange), MAX(ElectricRange), AVG(ElectricRange), EVType FROM EVNZ
	GROUP BY EVType
UNION
SELECT '2.3' as Problem, MIN(ElectricRange), MAX(ElectricRange), AVG(ElectricRange), EVType
    FROM inventory LEFT JOIN modeldetails ON inventory.Make = modeldetails.Make AND inventory.Model = modeldetails.Model
    GROUP BY EVType;
    
