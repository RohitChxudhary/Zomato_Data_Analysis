SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    ROUND(SUM(o.order_amount + o.delivery_fee - o.discount_amount), 2) AS total_revenue,
    COUNT(o.order_id) AS total_orders
FROM `zomato-502418.Dataset1.Order` o
JOIN `zomato-502418.Dataset1.Customer` c
ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY total_revenue DESC
LIMIT 20;