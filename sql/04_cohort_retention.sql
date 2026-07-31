 
use olist;

with first_order as 
(
select c.customer_unique_id,
MIN(date_format(order_purchase_timestamp,'%Y-%m')) as cohort_month
from orders o
Join customers c
on o.customer_id = c.customer_id
where order_status = 'delivered'
group by c.customer_unique_id
),
activity AS 
(
select cm.customer_unique_id,
date_format(order_purchase_timestamp,'%Y-%m') as activ
from orders om 
Join customers cm
on om.customer_id = cm.customer_id
where order_status = 'delivered'
group by cm.customer_unique_id, activ
 ),
 
 diff AS
 (
Select 
f.cohort_month,
a.activ,
Period_diff(REPLACE(a.activ,'-',''),REPLACE(f.cohort_month,'-','')) AS
month_since_first_order,
count(distinct a.customer_unique_id) as active_user
from first_order f
Join activity a
ON f.customer_unique_id = a.customer_unique_id
group by cohort_month,activ
)


select 
d.cohort_month,
d.month_since_first_order,
d.active_user,
round(d.active_user /
first_value(d.active_user) 
OVER(partition by d.cohort_month order by d.month_since_first_order) * 100,2) as rentention_percentage
from diff d