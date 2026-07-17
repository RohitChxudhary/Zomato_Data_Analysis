WITH latest_date AS (
    SELECT MAX(DATE(order_timestamp)) AS max_date
    FROM `zomato-502418.Dataset1.Order`
),

churned_customers AS (
    SELECT
        customer_id
    FROM `zomato-502418.Dataset1.Order`,
    latest_date
    WHERE order_status='Delivered'
    GROUP BY customer_id, max_date
    HAVING DATE_DIFF(max_date, MAX(DATE(order_timestamp)), DAY) > 90
)

SELECT
    ROUND(
        SUM(order_amount + delivery_fee - discount_amount),
        2
    ) AS estimated_revenue_lost
FROM `zomato-502418.Dataset1.Order`
WHERE customer_id IN (
    SELECT customer_id
    FROM churned_customers
)
AND order_status='Delivered';