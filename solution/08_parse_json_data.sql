SELECT * FROM json_raw;

SELECT raw:first_name::String first_name,
    raw:last_name::String last_name,
    raw:Skills Skills
FROM json_raw;

SELECT raw:first_name::String first_name,
    raw:last_name::String last_name,
    raw:Skills[0]::String skills_1,
    raw:Skills[1]::String skills_2
FROM json_raw;

CREATE OR REPLACE TABLE json_processed AS
SELECT raw:first_name::String first_name,
    raw:last_name::String last_name,
    raw:Skills[0]::String skills_1,
    raw:Skills[1]::String skills_2
FROM json_raw;

SELECT * FROM json_processed
WHERE first_name='Florina';