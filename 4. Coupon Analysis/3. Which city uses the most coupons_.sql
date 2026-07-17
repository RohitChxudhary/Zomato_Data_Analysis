SELECT
    c.city,
    COUNT(o.order_id) AS coupon_orders
FROM `zomato-502418.Dataset1.Order` o
JOIN `zomato-502418.Dataset1.Customer` c
ON o.customer_id = c.customer_id
WHERE o.discount_amount > 0
AND o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY coupon_orders DESC
LIMIT 1;