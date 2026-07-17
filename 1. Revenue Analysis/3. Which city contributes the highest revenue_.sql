SELECT
    c.city,
    SUM(o.order_amount + o.delivery_fee - o.discount_amount) AS Revenue
FROM zomato-502418.Dataset1.Order o
JOIN zomato-502418.Dataset1.Customer c
ON o.customer_id = c.customer_id
WHERE o.order_status='Delivered'
GROUP BY c.city
ORDER BY Revenue DESC;