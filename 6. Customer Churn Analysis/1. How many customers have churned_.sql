with last as (
  SELECT max(order_timestamp) as last_txn_date from zomato-502418.Dataset1.Order
)
,
cust_last as (
  SELECT customer_id, max(order_timestamp) as max_txn_date from zomato-502418.Dataset1.Order
  group by all
)

SELECT count(*) Curn_custoemr from cust_last a
cross join last b
where date_diff(b.last_txn_date,a.max_txn_date,day) > 90