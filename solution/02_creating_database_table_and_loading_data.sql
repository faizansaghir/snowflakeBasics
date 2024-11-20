CREATE OR REPLACE DATABASE EXERCISE_DB;

CREATE TABLE EXERCISE_DB.PUBLIC.CUSTOMERS (
    ID INT,
    first_name varchar,
    last_name varchar,
    email varchar,
    age int,
    city varchar
);

USE DATABASE EXERCISE_DB;

COPY INTO CUSTOMERS
FROM s3://snowflake-assignments-mc/gettingstarted/customers.csv
    file_format = (type = csv
               field_delimiter = ','
               skip_header=1);
