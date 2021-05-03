

-- Generated by dbtvault.

WITH source_data AS (
    SELECT a.SHIPPER_PK, a.SHIPPER_HASHDIFF, a.SHIPPERID, a.COMPANYNAME, a.PHONE, a.LOAD_DATE, a.RECORD_SOURCE
    FROM DATAVAULTDEMO_DB.SS_STG.v_stg_shippers AS a
    WHERE __PERIOD_FILTER__
    
),

update_records AS (
    SELECT a.SHIPPER_PK, a.SHIPPER_HASHDIFF, a.SHIPPERID, a.COMPANYNAME, a.PHONE, a.LOAD_DATE, a.RECORD_SOURCE
    FROM DATAVAULTDEMO_DB.SS_RAW_VLT.sat_shippers as a
    JOIN source_data as b
    ON a.SHIPPER_PK = b.SHIPPER_PK
),

latest_records AS (
    SELECT c.SHIPPER_PK, c.SHIPPER_HASHDIFF, c.LOAD_DATE,
           CASE WHEN RANK()
           OVER (PARTITION BY c.SHIPPER_PK
           ORDER BY c.LOAD_DATE DESC) = 1
    THEN 'Y' ELSE 'N' END AS latest
    FROM update_records as c
    QUALIFY latest = 'Y'
),

records_to_insert AS (
    SELECT DISTINCT e.SHIPPER_PK, e.SHIPPER_HASHDIFF, e.SHIPPERID, e.COMPANYNAME, e.PHONE, e.LOAD_DATE, e.RECORD_SOURCE
    FROM source_data AS e
    LEFT JOIN latest_records
    ON latest_records.SHIPPER_HASHDIFF = e.SHIPPER_HASHDIFF
    WHERE latest_records.SHIPPER_HASHDIFF IS NULL
)

SELECT * FROM records_to_insert