-- Q1 - Retrieve the total number of orders placed 
SELECT 
    COUNT(order_id) AS total_orders
FROM
    orders;
    
-- Q2 -Calculate the total revenue generated from pizza sales.
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS total_slaes
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
    
-- Q3 - Identify the highest-priced pizza.
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1

 -- Q4 - Identify the most common pizza size ordered.
SELECT 
    pizzas.size, COUNT(order_details_id) AS order_count
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC

-- Q5 - List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quant
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quant DESC
LIMIT 5

-- Q6 - Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pizza_types.category, SUM(order_details.quantity) AS quant
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quant DESC
LIMIT 5

-- Q7 -Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS hour, COUNT(order_id)
FROM
    orders
GROUP BY HOUR(order_time)

-- Q8 - Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category

-- Q9 - Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(quantity), 2) AS avg_pizza_sales_per_day
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity

-- Q10 -Determine the top 3 most ordered pizza types based on revenue. 
SELECT 
    pizza_types.name,
    SUM(pizzas.price * order_details.quantity) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3

-- Q11 - Calculate the percentage contribution of each pizza type to total revenue. 
SELECT 
    pizza_types.category,
    (SUM(pizzas.price * order_details.quantity) / (SELECT 
            SUM(order_details.quantity * pizzas.price)
        FROM
            order_details
                JOIN
            pizzas ON pizzas.pizza_id = order_details.pizza_id)) * 100 AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category

-- Q12 - Analyze the cumulative revenue generated over time.
select order_date , sum(revenue) over (order by order_date) as cum_revenue
from
(select orders.order_date ,SUM(order_details.quantity * pizzas.price) as revenue
from order_details JOIN pizzas 
ON pizzas.pizza_id = order_details.pizza_id
join orders 
on orders.order_id = order_details.order_id
group by orders.order_date) as sales

-- Q13 - Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select category, name , revenue ,rn
from
(
select category, name , revenue ,rank() over (partition by category order by revenue desc) as rn
from
(select pizza_types.category , pizza_types. name
 ,SUM(order_details.quantity * pizzas.price) as revenue
 from pizza_types join pizzas
 on pizza_types.pizza_type_id = pizzas.pizza_type_id
 join order_details
 on order_details.pizza_id = pizzas.pizza_id
 group by pizza_types.category , pizza_types. name) as a
 ) as b where rn < 4
 
-- Q14 - Find the total quantity of pizzas ordered that contain the word "chicken" in their name
SELECT 
    pt.name, SUM(od.quantity)
FROM
    pizza_types AS pt
        LEFT JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
        LEFT JOIN
    order_details AS od ON od.pizza_id = p.pizza_id
WHERE
    pt.name LIKE '%chicken%'
GROUP BY pt.name

 -- Q-15: List all pizza types and their total revenue, including those that were never sold.
 SELECT 
    pt.name, SUM(od.quantity * p.price) AS total_revenue
FROM
    order_details od
        RIGHT JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        RIGHT JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
HAVING SUM(od.quantity * p.price) IS NULL
    OR SUM(od.quantity * p.price) = 0;

 

