-- The cumulative revenue generated over time.
SELECT order_date,
sum(revenue) OVER(ORDER BY order_date) AS cummulative_revenue
FROM 
  (SELECT orders.order_date,
  sum(order_details.quantity*pizza.price) AS revenue
  FROM order_details
  JOIN pizza
  ON order_details.pizza_id = pizza.pizza_id
  JOIN orders
  ON order_details.order_id = orders.order_id
  GROUP BY orders.order_date) AS sales;
  
  