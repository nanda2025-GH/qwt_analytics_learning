{{config (materialized='table')}}
select 
ho.officehashkey,
current_timestamp as loaddate,
ho.recordsource as recordsource,
ro.officeaddress,
ro.officepostalcode,
ro.officecity,
ro.officestateprovince,
ro.officephone,
ro.officefax,
ro.officecountry
 from 
{{ref('stg_hub_offices')}}  ho 
inner join  {{source('qwt_raw','raw_offices')}} ro 
on ho.officeid=ro.officeid