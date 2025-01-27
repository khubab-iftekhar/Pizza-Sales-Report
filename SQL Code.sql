CREATE DATABASE Pizza_DB;
USE Pizza_DB;

CREATE TABLE pizza_table (
	pizza_id INT PRIMARY KEY,
	order_id INT,
    pizza_name_id VARCHAR(50),
	quantity INT,
    order_date DATE,
    order_time DATETIME,
    unit_price DECIMAL(10,5),
    total_price DECIMAL(10,5),
    pizza_size	VARCHAR(10),
    pizza_category	VARCHAR(50),
    pizza_ingredients LONGTEXT,
	pizza_name VARCHAR(100)

);
ALTER TABLE pizza_table
MODIFY order_time TIME;

USE Pizza_DB;
ALTER TABLE pizza_table
DROP PRIMARY KEY;
SELECT * FROM pizza_table;

-- WORKING ON PROJECT ONWARDS

-- 1. TOTAL REVENUE

SELECT SUM(total_price) AS Total_Revenue FROM pizza_table;

-- 2. AVERAGE ORDER VALUE 

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_value FROM pizza_table;

-- 3. TOTAL PIZZAS SALES

SELECT (SUM(quantity)) AS Total_pizza_sales FROM pizza_table;

-- 4. TOTAL NUMBER OF ORDER PLACED

SELECT COUNT(DISTINCT order_id) AS Total_order_placed FROM pizza_table;

-- 5. AVERAGE PIZZAS PER ORDER

SELECT (SUM(quantity) / COUNT( DISTINCT order_id)) AS Average_Pizza_Per_Order FROM pizza_table;

-- CHARTS REQUIREMENT

-- 1. DAILY TRENDS FOR TOTAL ORDERS

SELECT DAYNAME(order_date) AS order_day , COUNT(DISTINCT order_id) AS Total_Orders FROM Pizza_table
GROUP BY DAYNAME(order_date);

-- 2.HOURLY TRENDS OF TOTAL ORDERS

SELECT 
    HOUR(order_time) AS order_hours, 
    COUNT(DISTINCT order_id) AS Total_Orders 
FROM 
    pizza_table
GROUP BY 
    HOUR(order_time);

-- 3. percentage of sales by pizz catogery

SELECT pizza_category, SUM(total_price) AS total_sales , SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_table) AS PERC_total_Revenue
FROM pizza_table 
GROUP BY pizza_category;

-- for month of january

SELECT pizza_category, SUM(total_price) AS total_sales , SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_table WHERE MONTH(order_date) = 1) AS PERC_total_Revenue
FROM pizza_table 
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

-- 4.PERCENTAGE OF SALES BY PIZZA SIZE

SELECT pizza_size, SUM(total_price) AS total_sales , SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_table) AS PERC_total_Revenue
FROM pizza_table 
GROUP BY pizza_size;

-- 5. TOTAL PIZZA SOLD BY PIZZA CATOGERY

SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_table
GROUP BY pizza_category;

-- 6. Top 5 Best Sellers by Total Pizzas Sold

SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_table
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;

-- 7 . Bottom 5 Best Sellers by Total Pizzas Sold

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_table
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;