{{config (materialized='table')}}
select 
md5(officehashkey || re.empid) as empofficehashkey,
current_timestamp as loaddate,
ho.recordsource as recordsource,
ho.officehashkey,
re.empid
 from 
{{ref('stg_hub_offices')}} ho
inner join {{source('qwt_raw','raw_employee')}} re 
on ho.officeid=re.officeid