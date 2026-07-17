select restaurant_id, count(distinct case when order_status = 'Cancelled' then order_id  end)*100/count(distinct order_id) as Highest_cancellation_rate from zomato-502418.Dataset1.Order
group by all
order by count(distinct case when order_status = 'Cancelled' then order_id  end)*100/count(distinct order_id) desc
limit 1