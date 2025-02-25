{{config(materialized = 'view', schema = 'salesmart_dev')}}
 
SELECT
 *
from
{{ref('trf_products')}} 
