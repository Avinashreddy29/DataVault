
  create or replace  view DATAVAULTDEMO_DB.SS_RAW.raw_customers  as (
    SELECT
    *
FROM DATAVAULTDEMO_DB.SS.CUSTOMERS 
--FROM DATAVAULTDEMO_DB.SS.CUSTOMERS where UPDATE_TS > '2021-02-10 00:00:00.000'
  );
