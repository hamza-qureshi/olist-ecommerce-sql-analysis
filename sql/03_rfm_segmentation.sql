use olist;

with metric AS (
select c.customer_unique_id AS customer,
datediff(( SELECT MAX(order_purchase_timestamp) FROM orders),
max(order_purchase_timestamp)) AS recency,
count(distinct o.order_id) as frequency,
round(sum(oi.price + oi.freight_value),2) as monetary
from orders o
join order_items oi
ON o.order_id = oi.order_id
JOIN customers c
ON o.customer_id = c.customer_id
where o.order_status = 'delivered'
group by c.customer_unique_id
),
score as(
select *,
NTile(5)over(order by recency desc) as r_score,
NTile(5)over(order by frequency) as f_score,
NTile(5)over(order by monetary) as m_score
from metric
)

Select *,
case 
when r_score >=4 AND f_score >=4  THEN 'Gold'
when r_score >=3 AND f_score >=3  THEN 'Silver'
when r_score >=4 AND f_score <=2  THEN 'New'
when r_score <=2 AND f_score >=4  THEN 'At-risk'
when r_score <=2 AND f_score <=2 THEN 'Lost'
ELSE 'Others'
END AS rating
from score 