

        insert into DATAVAULTDEMO_DB.SS_RAW_VLT.hub_suppliers ("SUPPLIER_PK", "SUPPLIERID", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "SUPPLIER_PK", "SUPPLIERID", "LOAD_DATE", "RECORD_SOURCE"
            from DATAVAULTDEMO_DB.SS_RAW_VLT.hub_suppliers__dbt_tmp
        );