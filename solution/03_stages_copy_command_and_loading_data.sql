-- Solution 1

CREATE OR REPLACE STAGE EXERCISE_DB.PUBLIC.STAGE_1
    url='s3://snowflake-assignments-mc/loadingdata/',
    file_format = (
        type='CSV',
        skip_header=1,
        field_delimiter=';'
    );

DESC STAGE EXERCISE_DB.PUBLIC.STAGE_1;

LIST @EXERCISE_DB.PUBLIC.STAGE_1;

COPY INTO EXERCISE_DB.PUBLIC.CUSTOMERS from @EXERCISE_DB.PUBLIC.STAGE_1;


-- Solution 2

-- create stage object
CREATE OR REPLACE STAGE EXERCISE_DB.public.aws_stage
    url='s3://snowflake-assignments-mc/loadingdata';

-- List files in stage
LIST @EXERCISE_DB.public.aws_stage;

-- Load the data
COPY INTO EXERCISE_DB.PUBLIC.CUSTOMERS
    FROM @aws_stage
    file_format= (type = csv field_delimiter=';' skip_header=1)