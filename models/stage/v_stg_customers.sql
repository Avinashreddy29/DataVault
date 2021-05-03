{%- set yaml_metadata -%}
source_model: 'raw_customers'
derived_columns:
   RECORD_SOURCE: '!TPCH-CUSTOMERS'
   LOAD_DATE    :  CURRENT_TIMESTAMP()
hashed_columns:
   CUSTOMER_PK: 'CUSTOMERID'
   CUSTOMER_HASHDIFF:
     is_hashdiff: true
     columns:
       - 'CUSTOMERID'
       - 'CUSTOMERNAME'
       - 'CONTACT'
       - 'ADDRESS'
       - 'CITY'
       - 'REGION'
       - 'COUNTRY'
       - 'POSTALCODE'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{%- do log("metadata dict: " ~ metadata_dict, true) %}
{% set source_model = metadata_dict['source_model'] %}
{%- do log("source_model: " ~ source_model, true) %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{%- do log("derived_columns: " ~ derived_columns, true) %}
{% set hashed_columns = metadata_dict['hashed_columns'] %}
{%- do log("hashed_columns: " ~ hashed_columns, true) %}







    {{ dbtvault.stage(include_source_columns=true,



                      source_model=source_model,



                      derived_columns=derived_columns,



                      hashed_columns=hashed_columns,



                      ranked_columns=none) }}






