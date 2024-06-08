# Analyze the cumulative revenue generated over time.

select date, round(revenue,2) as Sales, round(sum(revenue) over(order by date),2) as CT from (
SELECT 
    orders.date,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    order_details
        JOIN
    orders ON order_details.order_id = orders.order_id
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
group by orders.date) as table1;