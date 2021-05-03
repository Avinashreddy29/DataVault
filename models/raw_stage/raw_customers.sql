SELECT
    *
FROM {{ source('tpch_sample', 'CUSTOMERS') }} 
--FROM {{ source('tpch_sample', 'CUSTOMERS') }} where UPDATE_TS > '2021-02-10 00:00:00.000'
