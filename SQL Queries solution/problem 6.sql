#Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    PIZZA_TYPE.category,
    SUM(order_details.quantity) AS TOTAL_QUANTITY
FROM
    PIZZA_TYPE
        JOIN
    pizzas ON PIZZA_TYPE.PIZZA_TYPE_ID = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY PIZZA_TYPE.category;
