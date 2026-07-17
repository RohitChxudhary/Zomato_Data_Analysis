SELECT round(sum(order_amount),2) as Revenue_Lost from zomato-502418.Dataset1.Order
where order_status ='Refunded'