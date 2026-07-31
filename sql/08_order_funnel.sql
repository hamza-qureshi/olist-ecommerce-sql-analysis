use olist;


with cte as (
select count(*) as total_num_orders,
 
sum(case
when order_status='delivered' then 1
else 0
end) as delivered,

sum(case when order_status='canceled' then 1 
else 0 
end) as canceled

from orders
)

select *,
round( delivered/total_num_orders * 100 , 2) as delivery_rate,
round( canceled/total_num_orders * 100 , 2) as canceled_rate
from cte