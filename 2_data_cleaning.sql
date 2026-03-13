-- =========================================
-- ECOMMERCE SALES SQL PROJECT
-- PHASE 2: DATA CLEANING
-- =========================================

-- Check for NULL transaction dates
SELECT COUNT(*) 
FROM sales
WHERE TransactionDate IS NULL;

-- Convert TransactionDate from TEXT to DATETIME
ALTER TABLE sales
MODIFY TransactionDate DATETIME;

-- Verify the structure
DESCRIBE sales;

-- Check customer age range
SELECT 
MIN(CustomerAge) AS Min_Age,
MAX(CustomerAge) AS Max_Age
FROM sales;

-- Check discount range
SELECT 
MIN(Discount) AS Min_Discount,
MAX(Discount) AS Max_Discount
FROM sales;

-- Check quantity range
SELECT 
MIN(Quantity) AS Min_Quantity,
MAX(Quantity) AS Max_Quantity
FROM sales;