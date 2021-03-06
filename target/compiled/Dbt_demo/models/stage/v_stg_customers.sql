










    -- Generated by dbtvault.



WITH source_data AS (

    SELECT

    CUSTOMERID,
    CUSTOMERNAME,
    CONTACT,
    ADDRESS,
    CITY,
    REGION,
    POSTALCODE,
    COUNTRY,
    CREATE_TS,
    UPDATE_TS

    FROM DATAVAULTDEMO_DB.SS_RAW.raw_customers
),

derived_columns AS (

    SELECT

    CUSTOMERID,
    CUSTOMERNAME,
    CONTACT,
    ADDRESS,
    CITY,
    REGION,
    POSTALCODE,
    COUNTRY,
    CREATE_TS,
    UPDATE_TS,
    'TPCH-CUSTOMERS' AS RECORD_SOURCE,
    CURRENT_TIMESTAMP() AS LOAD_DATE

    FROM source_data
),

hashed_columns AS (

    SELECT

    CUSTOMERID,
    CUSTOMERNAME,
    CONTACT,
    ADDRESS,
    CITY,
    REGION,
    POSTALCODE,
    COUNTRY,
    CREATE_TS,
    UPDATE_TS,
    RECORD_SOURCE,
    LOAD_DATE,

    CAST((MD5_BINARY(NULLIF(UPPER(TRIM(CAST(CUSTOMERID AS VARCHAR))), ''))) AS BINARY(16)) AS CUSTOMER_PK,
    CAST(MD5_BINARY(CONCAT_WS('||',
        IFNULL(NULLIF(UPPER(TRIM(CAST(ADDRESS AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST(CITY AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST(CONTACT AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST(COUNTRY AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST(CUSTOMERID AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST(CUSTOMERNAME AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST(POSTALCODE AS VARCHAR))), ''), '^^'),
        IFNULL(NULLIF(UPPER(TRIM(CAST(REGION AS VARCHAR))), ''), '^^')
    )) AS BINARY(16)) AS CUSTOMER_HASHDIFF

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    CUSTOMERID,
    CUSTOMERNAME,
    CONTACT,
    ADDRESS,
    CITY,
    REGION,
    POSTALCODE,
    COUNTRY,
    CREATE_TS,
    UPDATE_TS,
    RECORD_SOURCE,
    LOAD_DATE,
    CUSTOMER_PK,
    CUSTOMER_HASHDIFF

    FROM hashed_columns
)

SELECT * FROM columns_to_select