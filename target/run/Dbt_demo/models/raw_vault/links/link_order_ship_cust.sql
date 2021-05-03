

        insert into DATAVAULTDEMO_DB.SS_RAW_VLT.link_order_ship_cust ("ORDER_SHIPPER_CUSTOMER_PK", "SHIPPER_PK", "CUSTOMER_PK", "ORDER_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "ORDER_SHIPPER_CUSTOMER_PK", "SHIPPER_PK", "CUSTOMER_PK", "ORDER_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DATAVAULTDEMO_DB.SS_RAW_VLT.link_order_ship_cust__dbt_tmp
        );