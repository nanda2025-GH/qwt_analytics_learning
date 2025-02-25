select orderid,count(LineNo) as linecnt
from 
{{ref("fct_orders")}}
group by 1
having not (linecnt>=1)