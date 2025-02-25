{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA','TRANSFORMING_DEV'))}}

select
p.productid,
p.productname,
c.categoryname,
s.companyname as suppliercompany,
s.contactname as suppliercontact,
s.city as suppliercity,
p.quantityperunit,
p.UnitCost,
p.UnitPrice,
p.UNITSONORDER,
to_decimal(p.unitprice -p.UnitCost,9,2) as profit,
iff(p.UNITSONORDER>p.UNITSINSTOCK, 'Not Available', 'Available') as productavailability
from
{{ref("stg_products")}} as p
left join
{{ref('trf_suppliers')}} as s on
p.supplierid = s.supplierid
left join
{{ref('lkp_categories')}} as c on
c.categoryid = p.categoryid