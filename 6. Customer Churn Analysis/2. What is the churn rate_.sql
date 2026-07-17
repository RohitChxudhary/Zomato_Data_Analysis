with last as (
  SELECT max(order_timestamp) as last_txn_date from zomato-502418.Dataset1.Order
)
,
cust_last as (
  SELECT customer_id, max(order_timestamp) as max_txn_date from zomato-502418.Dataset1.Order
  group by all
)
,
churn_ as(
SELECT *,
Case when date_diff(b.last_txn_date,a.max_txn_date,day) > 90 then 1 else 0 end as Is_churn_tag from cust_last a
cross join last b
)

SELECT sum(Is_churn_tag)*100/count(*) as Churn_rate from churn_