SELECT
    ROUND(AVG(order_amount + delivery_fee - discount_amount), 2) AS average_order_value
FROM zomato-502418.Dataset1.Order
WHERE order_status = 'Delivered';