{% snapshot shipment_snapshot %}
{{
    config
    (
       target_database = 'QWT_ANALYTICS_DEV',
       schema = 'SNAPSHOT_DEV',

       unique_key = "OrderID||'-'||LineNo",
       strategy = 'timestamp',
       updated_at = 'ShipmentDate'
    )

}}
select * from {{ref('stg_shipments')}}

{% endsnapshot%}