

        insert into DATAVAULTDEMO_DB.SS_RAW_VLT.hub_customers ("CUSTOMER_PK", "CUSTOMERID", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "CUSTOMER_PK", "CUSTOMERID", "LOAD_DATE", "RECORD_SOURCE"
            from DATAVAULTDEMO_DB.SS_RAW_VLT.hub_customers__dbt_tmp
        );