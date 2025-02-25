-- incremental data load
{{ config(materialized="incremental", unique_key=['OrderID','LineNo'])}}
select 
ord_det.*
,ord.OrderDate
from
 {{ source("qwt_raw", "raw_orders") }} ord
inner join 
{{ source("qwt_raw", "raw_orderdetails") }} ord_det
on ord.OrderID=ord_det.OrderID
{% if is_incremental() %}
    where ord.orderdate > (select max(orderdate) from {{ this }})
{% endif %}
