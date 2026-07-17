WITH latest_date AS (
    SELECT MAX(DATE(order_timestamp)) AS max_date
    FROM `zomato-502418.Dataset1.Order`
),

customer_last_order AS (
    SELECT
        customer_id,
        MAX(DATE(order_timestamp)) AS last_order_date
    FROM `zomato-502418.Dataset1.Order`
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
)

SELECT
    c.city,
    COUNT(*) AS churned_customers
FROM customer_last_order clo
JOIN `zomato-502418.Dataset1.Customer` c
ON clo.customer_id = c.customer_id,
latest_date
WHERE DATE_DIFF(max_date, last_order_date, DAY) > 90
GROUP BY c.city
ORDER BY churned_customers DESC;