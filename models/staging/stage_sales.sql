-- calling marco

{{config(materialized ='view')}}

select 
    order_id,
    product_name ,
    amount ,
    country ,
    order_date ,
    discount ,
    {{dynamic_partition('order_date','MONTH')}} --Dynamic partition

FROM `sales-analytics-510816.sales_dataset.raw_sales`   