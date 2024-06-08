-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(pizza_name)
FROM
    PIZZA_TYPE
GROUP BY category;