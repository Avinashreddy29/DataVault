

-- Generated by dbtvault.

WITH source_data AS (
    SELECT a.CUSTOMER_PK, a.CUSTOMER_HASHDIFF, a.CUSTOMERID, a.CUSTOMERNAME, a.CONTACT, a.CITY, a.ADDRESS, a.REGION, a.COUNTRY, a.POSTALCODE, a.LOAD_DATE, a.RECORD_SOURCE
    FROM DATAVAULTDEMO_DB.SS_STG.v_stg_customers AS a
    WHERE __PERIOD_FILTER__
    
),

update_records AS (
    SELECT a.CUSTOMER_PK, a.CUSTOMER_HASHDIFF, a.CUSTOMERID, a.CUSTOMERNAME, a.CONTACT, a.CITY, a.ADDRESS, a.REGION, a.COUNTRY, a.POSTALCODE, a.LOAD_DATE, a.RECORD_SOURCE
    FROM DATAVAULTDEMO_DB.SS_RAW_VLT.sat_customers as a
    JOIN source_data as b
    ON a.CUSTOMER_PK = b.CUSTOMER_PK
),

latest_records AS (
    SELECT c.CUSTOMER_PK, c.CUSTOMER_HASHDIFF, c.LOAD_DATE,
           CASE WHEN RANK()
           OVER (PARTITION BY c.CUSTOMER_PK
           ORDER BY c.LOAD_DATE DESC) = 1
    THEN 'Y' ELSE 'N' END AS latest
    FROM update_records as c
    QUALIFY latest = 'Y'
),

records_to_insert AS (
    SELECT DISTINCT e.CUSTOMER_PK, e.CUSTOMER_HASHDIFF, e.CUSTOMERID, e.CUSTOMERNAME, e.CONTACT, e.CITY, e.ADDRESS, e.REGION, e.COUNTRY, e.POSTALCODE, e.LOAD_DATE, e.RECORD_SOURCE
    FROM source_data AS e
    LEFT JOIN latest_records
    ON latest_records.CUSTOMER_HASHDIFF = e.CUSTOMER_HASHDIFF
    WHERE latest_records.CUSTOMER_HASHDIFF IS NULL
)

SELECT * FROM records_to_insert