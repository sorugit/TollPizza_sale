# Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    PIZZA_TYPE.pizza_name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    PIZZA_TYPE
        JOIN
    pizzas ON PIZZA_TYPE.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY PIZZA_TYPE.pizza_name
ORDER BY revenue DESC
LIMIT 3;