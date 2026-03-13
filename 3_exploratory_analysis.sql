-- =========================================
-- ECOMMERCE SALES SQL PROJECT
-- PHASE 3: EXPLORATORY DATA ANALYSIS
-- =========================================

-- Calculate total revenue
SELECT 
SUM(Price * Quantity * (1 - Discount)) AS Total_Revenue
FROM sales;

-- Revenue by product category
SELECT 
ProductCategory,
SUM(Price * Quantity * (1 - Discount)) AS Revenue
FROM sales
GROUP BY ProductCategory
ORDER BY Revenue DESC;

-- Payment method popularity
SELECT 
PaymentMethod,
COUNT(*) AS Total_Transactions
FROM sales
GROUP BY PaymentMethod
ORDER BY Total_Transactions DESC;

-- Monthly revenue trend
SELECT 
YEAR(TransactionDate) AS Year,
MONTH(TransactionDate) AS Month,
SUM(Price * Quantity * (1 - Discount)) AS Monthly_Revenue
FROM sales
GROUP BY YEAR(TransactionDate), MONTH(TransactionDate)
ORDER BY Year, Month;

-- Top 10 customers by total spending (highest first)
SELECT 
CustomerID,
SUM(Price * Quantity * (1 - Discount)) AS Total_Spent
FROM sales
GROUP BY CustomerID
ORDER BY Total_Spent DESC
LIMIT 10;

-- Rank product categories by revenue
SELECT 
ProductCategory,
SUM(Price * Quantity * (1 - Discount)) AS Revenue,
RANK() OVER (ORDER BY SUM(Price * Quantity * (1 - Discount)) DESC) AS Category_Rank
FROM sales
GROUP BY ProductCategory;

-- Customer segmentation based on total spending
SELECT 
CustomerID,
SUM(Price * Quantity * (1 - Discount)) AS Total_Spent,
CASE
    WHEN SUM(Price * Quantity * (1 - Discount)) > 25000 THEN 'High Value'
    WHEN SUM(Price * Quantity * (1 - Discount)) BETWEEN 15000 AND 25000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS Customer_Segment
FROM sales
GROUP BY CustomerID
ORDER BY Total_Spent DESC
LIMIT 20 ;

