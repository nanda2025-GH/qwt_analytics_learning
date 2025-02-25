
{{config (materialized = 'view', schema = 'reporting_dev')}}
select  
e.officecity ,
c.companyname,
c.contactname,
count(o.orderid) total_order,
count(o.quantity) total_quantity,
sum(o.linesalesamount) total_sales,
avg(o.margin) as avg_margin
from 
{{ref('fct_orders')}} O
INNER JOIN {{ref('dim_customers')}} c
ON O.CUSTOMERID=C.CUSTOMERID
INNER JOIN {{ref('dim_employees')}} e
ON E.EMPLOYEE_ID=O.EMPLOYEEID
where e.officecity='{{var('v_city','Paris')}}'
group by 1,2,3
