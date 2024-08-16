-- The quantity of each pizza categories ordered

SELECT pizza_types.category, sum(order_details.quantity) as quantity
FROM pizza_types
JOIN pizza
ON pizza_types.pizza_type_id = pizza.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizza.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity desc;
