{%- set source_model = "v_stg_shippers" -%}
{%- set src_pk = "SHIPPER_PK" -%}
{%- set src_nk = "SHIPPERID" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}