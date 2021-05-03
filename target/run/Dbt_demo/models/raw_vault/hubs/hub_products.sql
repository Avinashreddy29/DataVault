

        insert into DATAVAULTDEMO_DB.SS_RAW_VLT.hub_products ("PRODUCT_PK", "PRODUCTID", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "PRODUCT_PK", "PRODUCTID", "LOAD_DATE", "RECORD_SOURCE"
            from DATAVAULTDEMO_DB.SS_RAW_VLT.hub_products__dbt_tmp
        );