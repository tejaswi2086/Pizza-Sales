-- The average number of pizzas ordered per day
SELECT ROUND(avg(quantity),0) 
FROM
(SELECT orders.order_date, sum(order_details.quantity) as quantity
FROM orders 
JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY orders.order_date) as order_quantity