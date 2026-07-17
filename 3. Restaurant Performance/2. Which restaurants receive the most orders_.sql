SELECT restaurant_id, count(distinct order_id) as Total_order from zomato-502418.Dataset1.Order
where order_status = 'Delivered'
group by restaurant_id
order by count(distinct order_id) desc
limit 1