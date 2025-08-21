SELECT * from pizza_sales
--1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
--2. Average Order Value
SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS average_revenue_per_order FROM pizza_sales 
--3. Total Pizzas Sold
SELECT SUM(quantity) AS total_pizzas_sold FROM pizza_sales
--4. Total Orders
SELECT COUNT(DISTINCT order_id) from pizza_sales
--5. Average Pizzas Per Order
SELECT cast(SUM(quantity) as decimal(10,2)) / cast(COUNT(DISTINCT order_id) as decimal(10,2)) AS average_pizzas_per_order FROM pizza_sales
--B. Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
--C. Monthly Trend for Total Orders
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)

select pizza_category , count(pizza_category) from pizza_sales
GROUP BY pizza_category

-- D. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

-- E. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size
-- top 5 pizza names by revenue,quantity and orders
SELECT TOP 5 pizza_name, SUM(total_price) AS total_price
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_price DESC;

SELECT TOP 5 pizza_name, SUM(quantity) AS quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY quantity DESC;

SELECT TOP 5 pizza_name, count(distinct order_id) AS order_id
FROM pizza_sales
GROUP BY pizza_name
ORDER BY order_id DESC;

-- buttom 5 pizza names by revenue,quantity and orders
SELECT TOP 5 pizza_name, SUM(total_price) AS total_price
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_price ;

SELECT TOP 5 pizza_name, SUM(quantity) AS quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY quantity ;

SELECT TOP 5 pizza_name, count(distinct order_id) AS order_id
FROM pizza_sales
GROUP BY pizza_name
ORDER BY order_id ;
