
  create or replace  view DATAVAULTDEMO_DB.SS_RAW.raw_suppliers  as (
    SELECT
    *
FROM DATAVAULTDEMO_DB.SS.SUPPLIERS 
--FROM DATAVAULTDEMO_DB.SS.SUPPLIERS where UPDATE_TS > '2021-02-10 00:00:00.000'
  );
