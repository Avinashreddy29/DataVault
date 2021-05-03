-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT CUSTOMER_PK, CUSTOMERID, LOAD_DATE, RECORD_SOURCE,
           ROW_NUMBER() OVER(
               PARTITION BY CUSTOMER_PK
               ORDER BY LOAD_DATE ASC
           ) AS row_number
    FROM DATAVAULTDEMO_DB.SS_STG.v_stg_customers
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a.CUSTOMER_PK, a.CUSTOMERID, a.LOAD_DATE, a.RECORD_SOURCE
    FROM row_rank_1 AS a
    LEFT JOIN DATAVAULTDEMO_DB.SS_RAW_VLT.hub_customers AS d
    ON a.CUSTOMER_PK = d.CUSTOMER_PK
    WHERE d.CUSTOMER_PK IS NULL
)

SELECT * FROM records_to_insert