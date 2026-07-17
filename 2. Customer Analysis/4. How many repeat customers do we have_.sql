SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        customer_id
    FROM `zomato-502418.Dataset1.Order`
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
);