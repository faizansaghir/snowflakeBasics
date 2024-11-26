CREATE OR REPLACE STAGE stage_5
    url='s3://snowflake-assignments-mc/unstructureddata/';

CREATE OR REPLACE FILE FORMAT file_format_4
    type=JSON;

CREATE OR REPLACE TABLE json_raw(
    Raw Variant
);

COPY INTO json_raw
FROM @stage_5
    file_format=file_format_4;

SELECT * FROM json_raw;