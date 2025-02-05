CREATE DATABASE hw3;
USE hw3;

CREATE TABLE IF NOT EXISTS accidents (
    report_ID SMALLINT UNSIGNED,
    date DATE,
    place VARCHAR(30),
    PRIMARY KEY (report_ID)
);
CREATE TABLE IF NOT EXISTS customer (
    customer_ID SMALLINT UNSIGNED,
    name VARCHAR(30),
    address VARCHAR(30),
    license_no INT UNSIGNED,
    model VARCHAR(20),
    PRIMARY KEY (customer_ID)
);
CREATE TABLE IF NOT EXISTS participated (
    customer_ID SMALLINT UNSIGNED,
    report_ID SMALLINT UNSIGNED,
    PRIMARY KEY (customer_ID , report_ID),
    FOREIGN KEY (customer_ID)
        REFERENCES customer (customer_ID),
    FOREIGN KEY (report_ID)
        REFERENCES accidents (report_ID)
);
CREATE TABLE IF NOT EXISTS policy (
    policy_ID SMALLINT UNSIGNED,
    PRIMARY KEY (policy_ID)
);
CREATE TABLE IF NOT EXISTS covers (
    customer_ID SMALLINT UNSIGNED,
    policy_ID SMALLINT UNSIGNED,
    PRIMARY KEY (customer_ID , policy_ID),
    FOREIGN KEY (customer_ID)
        REFERENCES customer (customer_ID),
    FOREIGN KEY (policy_ID)
        REFERENCES policy (policy_ID)
);
CREATE TABLE IF NOT EXISTS premium_payment (
    policy_ID SMALLINT UNSIGNED,
    payment_no INT UNSIGNED,
    due_date DATE,
    amount INT UNSIGNED,
    received_on DATE,
    PRIMARY KEY (policy_ID , payment_no),
    FOREIGN KEY (policy_ID)
        REFERENCES policy (policy_ID)
);