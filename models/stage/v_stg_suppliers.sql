{%- set yaml_metadata -%}
source_model: 'raw_suppliers'
derived_columns:
   RECORD_SOURCE: '!TPCH-SUPPLIERS'
   LOAD_DATE    :  CURRENT_TIMESTAMP()
hashed_columns:
   SUPPLIER_PK: 'SUPPLIERID'
   SUPPLIER_HASHDIFF:
     is_hashdiff: true
     columns:
       - 'SUPPLIERID'
       - 'COMPANYNAME'
       - 'ADDRESS'
       - 'REGION'
       - 'COUNTRY'
       - 'POSTALCODE'
       - 'CONTACTNAME'
       - 'CONTACTTITLE'
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


