SELECT
    *
FROM {{ source('tpch_sample', 'ORDERS') }} 
--FROM {{ source('tpch_sample', 'ORDERS') }} where UPDATE_TS > '2021-02-10 00:00:00.000'
