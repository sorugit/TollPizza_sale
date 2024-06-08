-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    PIZZA_TYPE.pizza_name,
    SUM(order_details.quantity) AS SOLD_QUANTITY
FROM
    PIZZA_TYPE
        JOIN
    pizzas ON PIZZA_TYPE.PIZZA_TYPE_ID = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY PIZZA_TYPE.pizza_name
ORDER BY SOLD_QUANTITY DESC
LIMIT 5;
