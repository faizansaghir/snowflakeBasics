
CREATE OR REPLACE TABLE EMPLOYEES (
    customer_id INT,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    age int,
    department varchar(50)
);

CREATE OR REPLACE STAGE STAGE_3
    url='s3://snowflake-assignments-mc/copyoptions/example1';

CREATE OR REPLACE FILE FORMAT file_format_2
    TYPE=csv,
    FIELD_DELIMITER=','
    SKIP_HEADER=1;

COPY INTO employees
FROM @stage_3
    file_format=file_format_2,
    validation_mode=RETURN_ERRORS;

COPY INTO employees
FROM @stage_3
    file_format=file_format_2,
    on_error=CONTINUE;