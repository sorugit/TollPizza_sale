#Identify the highest-priced pizza.

SELECT 
    PIZZA_TYPE.pizza_name AS NAME, pizzas.price AS AMOUNT
FROM
    PIZZA_TYPE
        JOIN
    pizzas ON PIZZA_TYPE.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;
