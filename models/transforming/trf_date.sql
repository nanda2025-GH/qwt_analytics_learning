{{ config(materialized="table", schema=env_var('DBT_TRANSFORMSCHEMA','TRANSFORMING_DEV')) }}
-- {% set min_order_date = "2007-04-19" %}
-- {% set max_order_date = "2012-04-01" %}
{% set v_min_order_dt = get_min_order_date() %}
{% set v_max_order_dt = get_max_order_date() %}

{{ dbt_date.get_date_dimension(v_min_order_dt, v_max_order_dt) }}
