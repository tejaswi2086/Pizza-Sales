-- The percentage contribution of each pizza type to revenue.

SELECT 
    pizza_types.category,
    ROUND(SUM(order_details.quantity * pizza.price) / (SELECT 
                    ROUND(SUM(order_details.quantity * pizza.price), 2) AS total_sales
                FROM
                    order_details
                        JOIN
                    pizza ON pizza.pizza_id = order_details.pizza_id) * 100,
            2) AS revenue
FROM
    pizza_types
        JOIN
    pizza ON pizza_types.pizza_type_id = pizza.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizza.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC; 
	
         
 