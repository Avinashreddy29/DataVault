
  create or replace  view DATAVAULTDEMO_DB.SS_RAW.raw_products  as (
    SELECT
    *
FROM DATAVAULTDEMO_DB.SS.PRODUCTS 
--FROM DATAVAULTDEMO_DB.SS.PRODUCTS where UPDATE_TS > '2021-02-10 00:00:00.000'
  );
