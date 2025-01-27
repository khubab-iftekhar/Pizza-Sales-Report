Pizza Sales Analysis Dashboard Using SQL and Excel

Objective

This project aims to analyze pizza sales data to derive meaningful insights about sales performance, customer preferences, and operational efficiencies. This analysis is performed using SQL for querying the data and Excel for visualizing the results.

Tools Used

SQL (MySQL Workbench): For extracting, transforming, and querying the data.

Microsoft Excel: For data cleaning, summarizing, and creating interactive dashboards.

Dataset Description

The dataset includes information about:

Pizza names and categories (e.g., family size, toppings).

Order dates and times.

Quantities ordered.

Sales revenue.

Customer details (where applicable).

Methodology

Step 1: Data Import and Cleaning

SQL Database Setup:

Imported the raw data into MySQL Workbench.

Ensured proper table relationships (e.g., Orders, Pizzas, Customers).

Data Cleaning in SQL:

Removed duplicate rows using DISTINCT.

Handled missing values by replacing them with appropriate defaults or averages using COALESCE.

Standardized data formats with DATE_FORMAT().

Excel Preprocessing:

Exported cleaned data from SQL to Excel for summarization.

Checked for inconsistencies and applied basic transformations (e.g., text-to-columns).

Step 2: Data Analysis with SQL

Key Queries Executed:

Total Sales Revenue:

SELECT SUM(sales_amount) AS total_revenue FROM orders;

Top-Selling Pizzas:

SELECT pizza_name, SUM(Quantity) AS total_sold
FROM orders
GROUP BY pizza_name
ORDER BY total_sold DESC;

Monthly Sales Trend:

SELECT MONTH(order_date) AS month, SUM(sales_amount) AS revenue
FROM orders
GROUP BY MONTH(order_date);

Category-Wise Sales:

SELECT category, SUM(sales_amount) AS category_revenue
FROM pizzas
INNER JOIN orders ON pizzas.pizza_id = orders.pizza_id
GROUP BY category;

Step 3: Data Visualization in Excel

Data Import:

Imported the results of SQL queries into Excel.

Consolidated results into separate sheets (e.g., Total Sales, Monthly Trends).

Pivot Tables:

Created pivot tables to summarize data dynamically.

Included slicers for filtering by category and date.

Interactive Dashboard:

Designed the dashboard layout:

Revenue Metrics: Total Revenue, Average Order Value.

Charts:

Bar chart for top-selling pizzas.

Line graph for monthly sales trends.

Pie chart for category-wise sales.

Filters: Added dropdowns for time and pizza category.

Insights Gained

Top-Selling Pizzas: The top three pizzas contributed over 50% of the sales.

Peak Sales Periods: Most sales occurred during weekends and evening hours.

Category Preferences: Family-sized pizzas generated the highest revenue.

Growth Trends: A consistent increase in sales during holiday seasons.

Conclusion

This project demonstrates how SQL can be used for effective data extraction and cleaning, while Excel is a powerful tool for summarization and visualization. The pizza sales dashboard enables stakeholders to monitor performance and make data-driven decisions for future strategies.

