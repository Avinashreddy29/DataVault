-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT ORDER_PK, ORDERID, LOAD_DATE, RECORD_SOURCE,
           ROW_NUMBER() OVER(
               PARTITION BY ORDER_PK
               ORDER BY LOAD_DATE ASC
           ) AS row_number
    FROM DATAVAULTDEMO_DB.SS_STG.v_stg_orders
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a.ORDER_PK, a.ORDERID, a.LOAD_DATE, a.RECORD_SOURCE
    FROM row_rank_1 AS a
    LEFT JOIN DATAVAULTDEMO_DB.SS_RAW_VLT.hub_orders AS d
    ON a.ORDER_PK = d.ORDER_PK
    WHERE d.ORDER_PK IS NULL
)

SELECT * FROM records_to_insert