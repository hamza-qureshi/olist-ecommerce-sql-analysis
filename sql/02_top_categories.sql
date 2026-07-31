Use olist;

SELECT product_category_name, 
count(distinct oi.order_id) As orders, 
round(sum(price+freight_value),2) as Revenue
from order_items oi
JOIN products p
ON oi.product_id = p.product_id
Join orders o 
on oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
group by product_category_name
order by Revenue desc
Limit 10;


