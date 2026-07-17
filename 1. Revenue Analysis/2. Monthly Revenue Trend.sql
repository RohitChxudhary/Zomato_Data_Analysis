SELECT
    FORMAT_DATE('%Y-%m', DATE(order_timestamp)) AS month,
    ROUND(SUM(order_amount + delivery_fee - discount_amount), 2) AS revenue
FROM zomato-502418.Dataset1.Order
WHERE order_status = 'Delivered'
GROUP BY month
ORDER BY month;