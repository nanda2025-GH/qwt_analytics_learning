{{config (materialized='table')}}
select 
OrderID 
,LineNo 
,ShipperID 
,CustomerID 
,ProductID 
,EmployeeID 
,split_part(ShipmentDate,' ',1):: date as ShipmentDate
,Status 
 from 
{{source('qwt_raw','raw_shipments')}}