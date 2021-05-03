

        insert into DATAVAULTDEMO_DB.SS_RAW_VLT.link_order_prod ("ORDER_PRODUCT_PK", "PRODUCT_PK", "ORDER_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "ORDER_PRODUCT_PK", "PRODUCT_PK", "ORDER_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DATAVAULTDEMO_DB.SS_RAW_VLT.link_order_prod__dbt_tmp
        );