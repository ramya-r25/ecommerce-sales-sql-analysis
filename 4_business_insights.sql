-- Top 10 locations by revenue
SELECT 
CustomerLocation,
SUM(Price * Quantity * (1 - Discount)) AS Revenue
FROM sales
GROUP BY CustomerLocation
ORDER BY Revenue DESC
LIMIT 10;

-- Average Order Value
SELECT 
AVG(Price * Quantity * (1 - Discount)) AS Average_Order_Value
FROM sales;

-- Best selling product category per month
WITH CategorySales AS (
    SELECT 
        YEAR(TransactionDate) AS Year,
        MONTH(TransactionDate) AS Month,
        ProductCategory,
        SUM(Price * Quantity * (1 - Discount)) AS Revenue
    FROM sales
    GROUP BY YEAR(TransactionDate), MONTH(TransactionDate), ProductCategory
)

SELECT 
Year,
Month,
ProductCategory,
Revenue
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY Year, Month ORDER BY Revenue DESC) AS rank_num
    FROM CategorySales
) ranked
WHERE rank_num = 1
ORDER BY Year, Month;