WITH latest_date AS (
    SELECT MAX(DATE(order_timestamp)) AS max_date
    FROM `zomato-502418.Dataset1.Order`
),

customer_summary AS (
    SELECT
        customer_id,
        MAX(DATE(order_timestamp)) AS last_order,
        SUM(order_amount + delivery_fee - discount_amount) AS lifetime_revenue,
        COUNT(order_id) AS total_orders
    FROM `zomato-502418.Dataset1.Order`
    WHERE order_status='Delivered'
    GROUP BY customer_id
)

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    cs.total_orders,
    ROUND(cs.lifetime_revenue,2) AS lifetime_revenue,
    cs.last_order
FROM customer_summary cs
JOIN `zomato-502418.Dataset1.Customer` c
ON cs.customer_id = c.customer_id,
latest_date
WHERE DATE_DIFF(max_date, cs.last_order, DAY) > 90
ORDER BY lifetime_revenue DESC
LIMIT 20;