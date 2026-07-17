with cte as (
  select a.restaurant_name, round(sum(b.order_amount)) as Total_amount from zomato-502418.Dataset1.Restaurants a 
  join zomato-502418.Dataset1.Order b on a.restaurant_id = b.restaurant_id
  where b.order_status = 'Delivered'
  group by all
  order by round(sum(b.order_amount)) asc
)

select restaurant_name from (
  Select restaurant_name, Total_amount, row_number() over(order by Total_amount asc) as rnk from cte ) b
where rnk <= 5
