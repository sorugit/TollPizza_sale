# Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select 
	pizza_name, revenue 
from 
	(select category, pizza_name, revenue, rank() over (partition by category order by revenue desc) as R1 from
(
SELECT 
    PIZZA_TYPE.category,
    PIZZA_TYPE.pizza_name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizzas
        JOIN
    PIZZA_TYPE ON pizzas.pizza_type_id = PIZZA_TYPE.pizza_type_id
        JOIN
    order_details
on pizzas.pizza_id = order_details.pizza_id
group by PIZZA_TYPE.category, PIZZA_TYPE.pizza_name ) as t1) as t2
where R1>=3;