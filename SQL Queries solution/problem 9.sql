# Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(total), 0) AS average
FROM
    (SELECT 
        orders.date, SUM(order_details.quantity) AS total
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.date) AS table1;