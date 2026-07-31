Use olist ;

select 
CASE 
WHEN DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) < 8 THEN '0-7'
WHEN DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) < 15 THEN '8-15'
WHEN DATEDIFF(order_delivered_customer_date, order_purchase_timestamp) < 21 THEN '15-30'
ELSE '30+ days'
END AS Delivery_period,
count(*) as number_of_orders,
AVG(review_score) AS Avg_review
from orders o 
Join order_reviews r
On o.order_id = r.order_id
where order_status = 'delivered'
group by Delivery_period
order by Avg_review DESC 