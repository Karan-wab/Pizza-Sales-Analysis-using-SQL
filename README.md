# Pizza Sales Analysis using SQL

## 1. Project Goal
The goal of this project is to analyze a year's worth of sales data from a pizza restaurant to identify trends and extract actionable insights. By answering a series of business questions using SQL, this analysis aims to help the business understand its performance and make data-driven decisions to optimize sales and operations.

---

## 2. Key Features
* **Sales Performance Analysis**: Calculating total orders, total revenue, and cumulative revenue over time.
* **Product Insights**: Identifying the highest-priced pizzas, top-selling pizza types by quantity and revenue, and the most common pizza sizes.
* **Operational Analysis**: Determining the busiest hours of the day and calculating the average number of pizzas ordered per day.
* **Category-Level Reporting**: Analyzing sales performance for different pizza categories (e.g., Classic, Veggie, Chicken) and identifying top performers within each.

---

## 3. Tech Stack & Tools
* **Database/Language**: SQL (The provided queries are written in a standard dialect compatible with systems like MySQL, PostgreSQL, or SQL Server).
* **Dataset**: Four CSV files providing relational data on orders, pizza types, and order details.

---

## 4. File Descriptions
* `orders.csv`: Contains data on each order placed, including `order_id`, `date`, and `time`.
* `order_details.csv`: A linking table that details the contents of each order, including which pizzas were ordered and the quantity.
* `pizzas.csv`: Contains details for each pizza, including its unique ID, size, and price.
* `pizza_types.csv`: A dimension table with information on each pizza's name, category, and ingredients.
* `Questions.txt`: A text file listing all the business questions that the SQL analysis aims to answer.
* `Pizza Sales Analysis using SQL.sql`: The main SQL script containing all the queries used to perform the analysis and answer the business questions.

---

## 5. Methodology
The analysis was conducted by writing a series of SQL queries to explore the dataset and answer specific questions. The approach involved:
1.  **Data Import**: The four CSV files were imported into a relational database, creating a schema with appropriate primary and foreign key relationships.
2.  **Querying**: SQL queries were written to join the tables and perform calculations and aggregations to address the questions in `Questions.txt`.
3.  **Structured Analysis**: The questions and queries were organized into three levels of complexity:
    * **Basic**: Focused on high-level metrics (e.g., total orders, total revenue).
    * **Intermediate**: Explored patterns and distributions (e.g., orders by hour, sales by category).
    * **Advanced**: Performed more complex calculations (e.g., percentage contribution to revenue, top sellers within each category).

---

## 6. How to Run
1.  Set up a new database in your preferred SQL client (e.g., MySQL Workbench, DBeaver, PostgreSQL).
2.  Import the four CSV files (`orders.csv`, `order_details.csv`, `pizzas.csv`, `pizza_types.csv`) as tables into your database.
3.  Open the `Pizza Sales Analysis using SQL.sql` script.
4.  Run the queries individually or as a whole script to generate the results for each of the business questions.

---

## 7. Key Insights from the Analysis
The SQL queries are designed to answer critical business questions such as:
* What are our busiest hours and days? (Helps with staffing).
* Which are our best-selling and worst-selling pizzas? (Informs menu engineering and promotions).
* What is the total revenue generated, and how does it trend over time? (Tracks overall business health).
* Which pizza category (e.g., Veggie, Supreme) is the most popular? (Guides marketing efforts).
* What are our top 3 highest-revenue pizzas in each category? (Identifies high-value products to promote).
