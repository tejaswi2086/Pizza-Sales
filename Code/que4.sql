-- The most common pizza size ordered.

SELECT pizza.size, COUNT(order_details.order_details_id) as count_order
FROM pizza
JOIN order_details
ON pizza.pizza_id = order_details.pizza_id
GROUP BY pizza.size
ORDER BY count_order  desc;