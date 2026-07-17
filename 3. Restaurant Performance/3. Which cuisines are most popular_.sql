select a.cusisne, Round(sum(b.order_amount),2) as Total_revenue from zomato-502418.Dataset1.Restaurants a
join zomato-502418.Dataset1.Order b on a.restaurant_id = b.restaurant_id
where order_status = 'Delivered'
group by a.cusisne
order by sum(b.order_amount) desc