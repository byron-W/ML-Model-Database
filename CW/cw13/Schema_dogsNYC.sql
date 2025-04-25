CREATE SCHEMA NYC;
USE NYC;

CREATE TABLE dogsNYC (
    d_name VARCHAR(50),
    gender VARCHAR(1),
    birthyear year,
    breed VARCHAR(50),
    zipcode VARCHAR(6),
    license_issuedate DATE,
    license_expiredate DATE,
    extract_year YEAR
);




