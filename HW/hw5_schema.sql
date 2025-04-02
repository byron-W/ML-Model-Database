CREATE SCHEMA horse_racing;
USE horse_racing;

CREATE TABLE horse(
h_ID int PRIMARY KEY, 
h_name varchar(50),
gender varchar(10),    # gender: foal, yearling, colt, gelding, mare, filly, stallion
sire varchar(50),      # mother of a horse 
dam varchar(50),       # father of a horse
h_status varchar(50),  # retired or active
color varchar(50),     # color of a horse
country varchar(50),
foaled DATE 
);

CREATE TABLE race(
r_ID int PRIMARY KEY,
r_name varchar(50),
track varchar(50),
r_date DATE
);

CREATE TABLE horse_race(
h_ID int,
r_ID int,
jockey varchar(50),
PRIMARY KEY(h_id, r_id),
FOREIGN KEY(h_id) references horse(h_id),
FOREIGN KEY(r_id) references race(r_id)
);

INSERT INTO horse VALUES 
(1, "Mystik Dan", "colt", "Goldencents", "Maam", "active", "bay", "USA", '2021-03-04',4161860),
(2, "Going To Vegas","filly", "Goldencents", "Hard-to-resist","retired", "bay","USA",'2017-04-19'),
(3, "Agoo","gelding","Munnings"," Grandacious","active","bay","USA", '2021-04-01'),
(4,"Miracle On Central","gelding","Karakontie "," Charcuterie", "active","bay","USA", NULL);

INSERT INTO race VALUES
(21,"Maiden Special Weight","Keeneland",'2023-10-22'),
(22,"Smarty Jones Stakes", "Oaklawn Park",'2024-01-01'),
(23,"Maiden Optional Claiming", "Fair Grounds",'2025-02-07'); 

INSERT INTO horse_race VALUES
(1,21,"Brian Hernandez Jr."),
(3,21,"Declan Cannon"),
(1,22,"Julien Leparoux"),
(4,23,"Declan Cannon");


