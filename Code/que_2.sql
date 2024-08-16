-- The total revenue generated from pizza sales 
SELECT 
    ROUND(SUM(order_details.quantity * pizza.price),
            2) AS total_sales
FROM
    order_details
        JOIN
    pizza ON pizza.pizza_id = order_details.pizza_id