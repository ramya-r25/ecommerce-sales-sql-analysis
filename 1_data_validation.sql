-- =========================================
-- ECOMMERCE SALES SQL PROJECT
-- PHASE 1: DATA VALIDATION
-- =========================================

-- Check total rows
SELECT COUNT(*) FROM sales;

-- Check duplicate transactions
SELECT TransactionID, COUNT(*)
FROM sales
GROUP BY TransactionID
HAVING COUNT(*) > 1;

-- Check invalid numeric values
SELECT *
FROM sales
WHERE Quantity <= 0
OR Price <= 0
OR Discount < 0;

-- Check maximum discount
SELECT MAX(Discount)
FROM sales;

-- Check available product categories
SELECT DISTINCT ProductCategory
FROM sales;