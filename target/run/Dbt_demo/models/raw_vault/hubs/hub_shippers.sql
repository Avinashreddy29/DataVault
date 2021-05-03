

        insert into DATAVAULTDEMO_DB.SS_RAW_VLT.hub_shippers ("SHIPPER_PK", "SHIPPERID", "LOAD_DATE", "RECORD_SOURCE")
        (
            select "SHIPPER_PK", "SHIPPERID", "LOAD_DATE", "RECORD_SOURCE"
            from DATAVAULTDEMO_DB.SS_RAW_VLT.hub_shippers__dbt_tmp
        );