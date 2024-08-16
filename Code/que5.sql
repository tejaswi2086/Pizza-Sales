-- The top 5 most ordered pizza types along their quantities.

SELECT pizza_types.name, SUM(order_details.quantity) as quantity
FROM pizza_types
JOIN pizza
ON pizza_types.pizza_type_id =  pizza.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizza.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity desc
LIMIT 5;

