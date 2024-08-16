-- The distribution of orders by hours of the day.

SELECT hour(order_time) as hour, count(order_id) as order_count
FROM orders
GROUP BY hour(order_time);