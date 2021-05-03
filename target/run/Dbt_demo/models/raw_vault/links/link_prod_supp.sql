

        insert into DATAVAULTDEMO_DB.SS_RAW_VLT.link_prod_supp ("PRODUCT_SUPPLIER_PK", "PRODUCT_PK", "SUPPLIER_PK", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "PRODUCT_SUPPLIER_PK", "PRODUCT_PK", "SUPPLIER_PK", "LOAD_DATE", "RECORD_SOURCE"
            from DATAVAULTDEMO_DB.SS_RAW_VLT.link_prod_supp__dbt_tmp
        );