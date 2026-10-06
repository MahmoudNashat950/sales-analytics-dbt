select 
    country,
    product_name ,
    COUNT(order_id) as total_orders,
    SUM(amount) As total_revenue,
    {{dynamic_partition('order_date','MONTH')}}

from {{ ref('stage_sales')}} -- ref model
group by 1 ,2,5


   