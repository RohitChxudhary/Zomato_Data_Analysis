SELECT round(sum(order_amount),2) as Total_Revenue from zomato-502418.Dataset1.Order
where order_status = 'Delivered'