SELECT
    CASE
        WHEN discount_amount > 0 THEN 'Coupon User'
        ELSE 'Non-Coupon User'
    END AS customer_type,

    COUNT(order_id) AS total_orders,

    ROUND(AVG(order_amount + delivery_fee - discount_amount), 2) AS avg_order_value,

    ROUND(SUM(order_amount + delivery_fee - discount_amount), 2) AS total_revenue

FROM `zomato-502418.Dataset1.Order`
WHERE order_status = 'Delivered'
GROUP BY customer_type
ORDER BY total_revenue DESC;