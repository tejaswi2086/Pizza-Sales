-- The top 3 most ordered pizza type based on revenue for each pizza category

SELECT  name, revenue
FROM 
(SELECT category, name, revenue,
rank() over(partition by category ORDER BY revenue desc) as rn
FROM 
(SELECT pizza_types.category, pizza_types.name,
sum(order_details.quantity * pizza.price) as revenue
FROM pizza_types JOIN pizza
ON pizza_types.pizza_type_id = pizza.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizza.pizza_id
GROUP BY pizza_types.category, pizza_types.name) as a) as b
where rn<= 3;