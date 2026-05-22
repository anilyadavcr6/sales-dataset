
select * from sales_data;
#TOTAL REVENUE
SELECT 
      ROUND(SUM(Sales_Amount),2) AS total_revenue
FROM sales_data;
#TOTAL ORDERS
SELECT 
      COUNT(*) AS total_orders
FROM sales_data;
#TOTAL QUANTITY SOLD
SELECT 
      SUM(Quantity_Sold) AS total_quantity
FROM sales_data;
#AVERAGE ORDER values
SELECT 
      ROUND(AVG(Sales_Amount),2) AS avg_order_value
FROM sales_data;
#TOP SELLING PRODUCTS
SELECT 
      Product_ID,
      SUM(Quantity_Sold) AS total_quantity
FROM sales_data
GROUP BY Product_ID
ORDER BY total_quantity DESC
LIMIT 10;
#TOP REVENUE GENRATING CATGORIES
SELECT 
      Product_Category,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY Product_Category
ORDER BY revenue DESC;
#MOST PROFITABLE PRODUCTS
SELECT 
      Product_ID,
      
      ROUND(
      SUM(
      (Unit_Price - Unit_Cost)
      * Quantity_Sold
      ),2
      ) AS total_profit
      
FROM sales_data
GROUP BY Product_ID
ORDER BY total_profit DESC
LIMIT 10;
#REGIONWISE REVENUE
SELECT 
      Region,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY Region
ORDER BY revenue DESC;
#REGION WISE PROFIT
SELECT 
      Region,
      
      ROUND(
      SUM(
      (Unit_Price - Unit_Cost)
      * Quantity_Sold
      ),2
      ) AS total_profit
      
FROM sales_data
GROUP BY Region
ORDER BY total_profit DESC;
#TOP PERFORMING SALES REPRESENTATIVE
SELECT 
      Sales_Rep,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY Sales_Rep
ORDER BY revenue DESC
LIMIT 10;
#SALES REP WISE PROFIT
SELECT 
      Sales_Rep,
      
      ROUND(
      SUM(
      (Unit_Price - Unit_Cost)
      * Quantity_Sold
      ),2
      ) AS total_profit
      
FROM sales_data
GROUP BY Sales_Rep
ORDER BY total_profit DESC;
#CUSTOMER TYPE ANALYSIS
SELECT 
      Customer_Type,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY Customer_Type;
#AVERAGE CUSTOMER SPENDING
SELECT 
      Customer_Type,
      ROUND(AVG(Sales_Amount),2) AS avg_spending
FROM sales_data
GROUP BY Customer_Type;
#PAYMENT METHOD ANALYSIS
SELECT 
      Payment_Method,
      COUNT(*) AS total_transactions,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY Payment_Method
ORDER BY revenue DESC;
#ONLINE VS OFFLINE SALES
SELECT 
      Sales_Channel,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY Sales_Channel;
#MONTHLY REVENUE TREND
SELECT 
      MONTH(Sale_Date) AS month_number,
      MONTHNAME(Sale_Date) AS month_name,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY MONTH(Sale_Date), MONTHNAME(Sale_Date)
ORDER BY month_number;
#DAILY REVENUE TREND
SELECT 
      Sale_Date,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY Sale_Date
ORDER BY Sale_Date;
#BEST SALES MONTH
SELECT 
      MONTHNAME(Sale_Date) AS month_name,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY MONTHNAME(Sale_Date)
ORDER BY revenue DESC
LIMIT 1;
#DISCOUNT IMPACT ON SALES
SELECT 
      Discount,
      ROUND(SUM(Sales_Amount),2) AS revenue
FROM sales_data
GROUP BY Discount
ORDER BY revenue DESC;
#AVERAGE DISCOUNT
SELECT 
      ROUND(AVG(Discount),2) AS avg_discount
FROM sales_data;
#RUNNING REVNUE TREND
SELECT 
      Sale_Date,
      Sales_Amount,
      
      SUM(Sales_Amount) OVER(
      ORDER BY Sale_Date
      ) AS running_revenue
      
FROM sales_data;
#REGION REVENUE RANKING
SELECT 
      Region,
      ROUND(SUM(Sales_Amount),2) AS revenue,
      
      RANK() OVER(
      ORDER BY SUM(Sales_Amount) DESC
      ) AS revenue_rank
      
FROM sales_data
GROUP BY Region;
#DENSE RANK SALES REPRESENTATIVE
SELECT 
      Sales_Rep,
      ROUND(SUM(Sales_Amount),2) AS revenue,
      
      DENSE_RANK() OVER(
      ORDER BY SUM(Sales_Amount) DESC
      ) AS dense_rank_no
      
FROM sales_data
GROUP BY Sales_Rep;
#TOP 3 REGIONS BY REVENUE
SELECT *
FROM (
      SELECT 
            Region,
            ROUND(SUM(Sales_Amount),2) AS revenue,
            
            RANK() OVER(
            ORDER BY SUM(Sales_Amount) DESC
            ) AS ranking
            
      FROM sales_data
      GROUP BY Region
) ranked

WHERE ranking <=3;
#ORDERS ABOVE AVERAGE REVENUE
SELECT *
FROM sales_data
WHERE Sales_Amount > (
      SELECT AVG(Sales_Amount)
      FROM sales_data
);
#HIGH REVENUE REGIONS USING CTE
WITH regional_sales AS (

      SELECT 
            Region,
            ROUND(SUM(Sales_Amount),2) AS revenue
            
      FROM sales_data
      GROUP BY Region
)

SELECT *
FROM regional_sales
WHERE revenue > 500000;
#CREATE SALES SUMMARY VIEW
CREATE VIEW sales_summary AS

SELECT 
      Product_Category,
      ROUND(SUM(Sales_Amount),2) AS revenue,
      SUM(Quantity_Sold) AS total_quantity
      
FROM sales_data
GROUP BY Product_Category;
#DUPLICATE RECORD CHECK
SELECT 
      Product_ID,
      Sale_Date,
      COUNT(*) AS duplicate_count
      
FROM sales_data
GROUP BY Product_ID, Sale_Date
HAVING COUNT(*) > 1;
#NULL VALUE CHECK
SELECT *
FROM sales_data
WHERE Sales_Amount IS NULL
OR Quantity_Sold IS NULL
OR Product_Category IS NULL;
#NEGATIVE VALUE VALIDATION
SELECT *
FROM sales_data
WHERE Sales_Amount < 0
OR Quantity_Sold < 0
OR Unit_Cost < 0
OR Unit_Price < 0;