Use olist;

with cte AS (
Select  date_format(o.order_purchase_timestamp, '%Y-%m') AS Months, 
 round(sum(p.payment_value)) as Sales
from orders o 
Join order_payments p 
ON o.order_id = p.order_id
group by date_format(o.order_purchase_timestamp, '%Y-%m')  
order by Months
 ),
 
cte2 AS 
 (
 select Months, 
 Sales,
 lag(sales,1,sales) over(order by Months) As prv_sales
 from cte
  )
 
 select * , round((sales - prv_sales)/prv_sales * 100,2) as Mom_Growth
 from cte2

