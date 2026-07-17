WITH customer_summary AS (
SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    MAX(CASE WHEN discount_amount > 0 THEN 1 ELSE 0 END) AS used_coupon
FROM `zomato-502418.Dataset1.Order`
WHERE order_status = 'Delivered'
GROUP BY customer_id
)

SELECT
    CASE
        WHEN used_coupon = 1 THEN 'Coupon Users'
        ELSE 'Non-Coupon Users'
    END AS customer_group,

    COUNT(*) AS total_customers,

    COUNTIF(total_orders > 1) AS repeat_customers,

    ROUND(
        COUNTIF(total_orders > 1) * 100.0 / COUNT(*),
        2
    ) AS retention_rate
FROM customer_summary
GROUP BY customer_group;