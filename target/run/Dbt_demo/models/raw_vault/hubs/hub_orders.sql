

        insert into DATAVAULTDEMO_DB.SS_RAW_VLT.hub_orders ("ORDER_PK", "ORDERID", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "ORDER_PK", "ORDERID", "LOAD_DATE", "RECORD_SOURCE"
            from DATAVAULTDEMO_DB.SS_RAW_VLT.hub_orders__dbt_tmp
        );