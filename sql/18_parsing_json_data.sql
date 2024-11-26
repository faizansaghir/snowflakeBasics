// Second step: Parse & Analyse Raw JSON

   // Selecting attribute/column

SELECT RAW_FILE:city FROM OUR_FIRST_DB.PUBLIC.JSON_RAW;

// Instead of column name, we can access it using column number
SELECT $1:first_name FROM OUR_FIRST_DB.PUBLIC.JSON_RAW;


   // Selecting attribute/column - formattted
// If we do not cast, any value we select be it string or int, will be of type Variant only
SELECT RAW_FILE:first_name::string as first_name  FROM OUR_FIRST_DB.PUBLIC.JSON_RAW;

SELECT RAW_FILE:id::int as id  FROM OUR_FIRST_DB.PUBLIC.JSON_RAW;

SELECT
    RAW_FILE:id::int as id,
    RAW_FILE:first_name::STRING as first_name,
    RAW_FILE:last_name::STRING as last_name,
    RAW_FILE:gender::STRING as gender

FROM OUR_FIRST_DB.PUBLIC.JSON_RAW;



   // Handling nested data

SELECT RAW_FILE:job as job  FROM OUR_FIRST_DB.PUBLIC.JSON_RAW;


SELECT
      RAW_FILE:job.salary::INT as salary
FROM OUR_FIRST_DB.PUBLIC.JSON_RAW;



SELECT
    RAW_FILE:first_name::STRING as first_name,
    RAW_FILE:job.salary::INT as salary,
    RAW_FILE:job.title::STRING as title
FROM OUR_FIRST_DB.PUBLIC.JSON_RAW;
