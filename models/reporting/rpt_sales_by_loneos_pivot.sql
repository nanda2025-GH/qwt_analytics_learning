{{config (materialized = 'view', schema = 'reporting_dev')}}
{% set v_linenumbers = get_line_numbers() %}

SELECT 
ORDERID,
{% for LINENO in v_linenumbers -%}
SUM(CASE when LINENO =1 then linesalesamount end ) as line{{LINENO}}_sales,
{% endfor %}
/*,SUM(CASE when LINENO =2 then linesalesamount end ) line2_sales
,SUM(CASE when LINENO =3 then linesalesamount end ) line3_sales
, nvl(line1_sales,0)+nvl(line2_sales,0)+nvl(line3_sales,0) as total_sales
*/
sum(linesalesamount) as total_sales
from {{ref("fct_orders")}}
group by 1