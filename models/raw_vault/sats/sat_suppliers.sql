{%- set source_model = "v_stg_suppliers" -%}
{%- set src_pk = "SUPPLIER_PK" -%}
{%- set src_hashdiff = "SUPPLIER_HASHDIFF" -%}
{%- set src_payload = ["SUPPLIERID","COMPANYNAME", "CONTACTNAME", "CONTACTTITLE", "ADDRESS", "REGION",
                       "COUNTRY", "POSTALCODE"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ config(materialized='vault_insert_by_period', timestamp_field='LOAD_DATE', period='day',
          date_source_models=source_model) }}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}
