{%- set source_model = "v_stg_orders" -%}
{%- set src_pk = "ORDER_PK" -%}
{%- set src_hashdiff = "ORDER_HASHDIFF" -%}
{%- set src_payload = ["ORDERID","ORDERDATE", "SHIPDATE", "SHIPADDRESS", "SHIPCITY", "SHIPREGION",
                       "SHIPCOUNTRY", "SHIPPOSTALCODE"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ config(materialized='vault_insert_by_period', timestamp_field='LOAD_DATE', period='day',
          date_source_models=source_model) }}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}
