{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA','TRANSFORMING_DEV'))}}
 
select
get(XMLGET(supplierinfo, 'SupplierID'),'$') as supplierid,
get(XMLGET(supplierinfo, 'CompanyName'),'$')::varchar as CompanyName,
get(XMLGET(supplierinfo, 'ContactName'),'$')::varchar as ContactName,
get(XMLGET(supplierinfo, 'Address'),'$')::varchar as Address,
get(XMLGET(supplierinfo, 'City'),'$')::varchar as City,
get(XMLGET(supplierinfo, 'PostalCode'),'$')::varchar as PostalCode,
get(XMLGET(supplierinfo, 'Country'),'$')::varchar as Country,
get(XMLGET(supplierinfo, 'Phone'),'$')::varchar as Phone,
get(XMLGET(supplierinfo, 'Fax'),'$')::varchar as Fax
from
{{ref("stg_suppliers")}}
