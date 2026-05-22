Sales Data Analysis using SQL
Project Overview

This project focuses on performing end-to-end sales data analysis using SQL. The goal of this project is to analyze sales performance, customer behavior, product profitability, and regional business trends using real-world sales data.

The project demonstrates strong SQL skills including data cleaning, KPI analysis, business insights generation, window functions, CTEs, views, and advanced analytical queries.

This project is designed for Data Analyst portfolio building and showcases SQL problem-solving skills required in real business environments.

Dataset Information
Table Name

sales_data

Dataset Columns
Product_ID
Sale_Date
Sales_Rep
Region
Sales_Amount
Quantity_Sold
Product_Category
Unit_Cost
Unit_Price
Customer_Type
Discount
Payment_Method
Sales_Channel
Region_and_Sales_Rep
Objectives
Analyze overall sales performance
Identify top-performing products and regions
Measure profitability
Analyze customer purchasing behavior
Evaluate sales representatives’ performance
Study sales trends over time
Perform data cleaning and validation
Generate business insights using SQL
SQL Concepts Used
Basic SQL
SELECT
WHERE
ORDER BY
GROUP BY
LIMIT
Aggregate Functions
Intermediate SQL
CASE WHEN
Subqueries
Data Cleaning
Data Validation
Advanced SQL
Window Functions
RANK()
DENSE_RANK()
CTE (Common Table Expressions)
Views
Stored Procedures
Indexing
KPI Metrics Analyzed
Total Revenue
Total Orders
Total Quantity Sold
Average Order Value
Product Profitability
Region Wise Revenue
Region Wise Profit
Customer Type Revenue
Payment Method Analysis
Sales Channel Analysis
Monthly Revenue Trends
Business Problems Solved
Sales Analysis
Which region generates the highest revenue?
Which sales representative performs best?
Which product category drives maximum sales?
Profitability Analysis
Which products generate the highest profit?
Which regions are most profitable?
Customer Analysis
Which customer type contributes more revenue?
What is the average customer spending?
Operational Analysis
Which payment method is most used?
Which sales channel performs better?
Trend Analysis
Monthly sales trends
Daily revenue trends
Best sales month analysis
Data Cleaning Performed
NULL value detection
Duplicate record identification
Negative value validation
Data consistency checks
Revenue validation
Sample SQL Query
Total Revenue
SELECT 
      ROUND(SUM(Sales_Amount),2) AS total_revenue
FROM sales_data;
Top Revenue Regions
SELECT 
      Region,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY Region
ORDER BY revenue DESC;
Running Revenue Trend
SELECT 
      Sale_Date,
      Sales_Amount,

      SUM(Sales_Amount) OVER(
      ORDER BY Sale_Date
      ) AS running_revenue

FROM sales_data;
Project Structure
Sales-Data-Analysis-SQL/
│
├── Dataset/
│   └── sales_data.csv
│
├── SQL/
│   ├── Data_Cleaning.sql
│   ├── Basic_Queries.sql
│   ├── Advanced_Queries.sql
│   ├── KPI_Analysis.sql
│   └── Window_Functions.sql
│
├── README.md
│
└── Insights_Report.sql
Key Insights
Identified top-performing sales regions
Found the most profitable products
Analyzed customer spending patterns
Compared online and offline sales channels
Evaluated payment method preferences
Measured sales representative performance
Learning Outcomes

Through this project, I improved my understanding of:

SQL Query Optimization
Business Intelligence
Sales Analytics
Data Cleaning Techniques
Advanced SQL Functions
KPI Reporting
Business Data Analysis
Future Improvements

Author

Anil Kumar

Aspiring Data Analyst | SQL Enthusiast

Connect
GitHub
.
