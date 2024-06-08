#Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    PIZZA_TYPE.pizza_name,
    ROUND(SUM(order_details.quantity * pizzas.price) / (SELECT 
                    SUM(order_details.quantity * pizzas.price)
                FROM
                    order_details
                        JOIN
                    pizzas ON order_details.pizza_id = pizzas.pizza_id) * 100,
            2) AS revenue
FROM
    PIZZA_TYPE
        JOIN
    pizzas ON PIZZA_TYPE.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY PIZZA_TYPE.pizza_name
ORDER BY revenue DESC;