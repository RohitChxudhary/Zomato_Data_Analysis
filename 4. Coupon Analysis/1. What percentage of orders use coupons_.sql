SELECT
    COUNTIF(discount_amount > 0) AS coupon_orders,
    COUNT(*) AS total_orders,
    ROUND(
        COUNTIF(discount_amount > 0) * 100.0 / COUNT(*),
        2
    ) AS coupon_usage_percentage
FROM `zomato-502418.Dataset1.Order`
WHERE order_status = 'Delivered';