-- Top 3 most ordered pizza type base on revenue.
SELECT pizza_types.name,
sum(order_details.quantity * pizza.price) as revenue
FROM pizza_types
JOIN pizza
ON pizza.pizza_type_id= pizza_types.pizza_type_id  
JOIN order_details
ON order_details.pizza_id = pizza.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue desc 
LIMIT  3;