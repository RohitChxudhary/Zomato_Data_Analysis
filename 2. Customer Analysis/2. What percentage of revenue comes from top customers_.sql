WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(order_amount + delivery_fee - discount_amount) AS revenue
    FROM `zomato-502418.Dataset1.Order`
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
),

top20 AS (
    SELECT SUM(revenue) AS top20_revenue
    FROM (
        SELECT revenue
        FROM customer_revenue
        ORDER BY revenue DESC
        LIMIT 20
    )
),

overall AS (
    SELECT SUM(revenue) AS total_revenue
    FROM customer_revenue
)

SELECT
    ROUND(
        (top20.top20_revenue / overall.total_revenue) * 100,
        2
    ) AS revenue_percentage_from_top20
FROM top20, overall;