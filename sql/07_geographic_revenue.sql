select 
c.customer_state,
count(distinct o.order_id) as Num_of_orders,
round(sum(oi.price + oi.freight_value),2) as Revenue,
round(avg(freight_value),2) as Avg_freight
from orders o 
join customers c
on o.customer_id = c.customer_id
Join order_items oi
on oi.order_id = o.order_id
where o.order_status = 'delivered'
group by c.customer_state
order by Revenue desc
limit 50 