CREATE OR REPLACE TABLE EMPLOYEES (
    customer_id int,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    age int,
    department varchar(50)
);

CREATE OR REPLACE STAGE stage_4
    url='s3://snowflake-assignments-mc/copyoptions/example2';

CREATE OR REPLACE FILE FORMAT file_format_3
    TYPE=CSV,
    FIELD_DELIMITER=',',
    SKIP_HEADER=1;

LIST @stage_4;

COPY INTO EMPLOYEES
FROM @stage_4
    file_format=file_format_3,
    validation_mode=RETURN_ERRORS;

COPY INTO EMPLOYEES
FROM @stage_4
    file_format=file_format_3,
    truncatecolumns=True;