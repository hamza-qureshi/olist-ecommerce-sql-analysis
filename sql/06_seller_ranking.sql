select 
s.seller_id,
s.seller_state,
count(distinct o.order_id) as num_of_orders,
round(sum(oi.price),2) as revenue,
rank() over(order by sum(oi.price) desc) as ranking,
rank() over(partition by s.seller_state order by sum(oi.price) desc) as state_ranking
from sellers s
join order_items oi
ON s.seller_id = oi.seller_id
join orders o 
on o.order_id = oi.order_id
where o.order_status = 'delivered'  
group by s.seller_id, s.seller_state 
order by revenue desc
limit 20