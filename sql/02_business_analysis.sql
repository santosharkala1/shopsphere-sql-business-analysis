
-- =====================================================
-- PROJECT: ShopSphere E-Commerce Sales Analysis
-- AUTHOR: Arkala Santosh Kumar
-- DATABASE: shopsphere_db
-- TOOL: MySQL
-- =====================================================

USE shopsphere_db;

-- =====================================================
-- BUSINESS QUESTION 1:
-- Which sales channel generates more completed sales?
-- =====================================================

-- Objective:
-- Compare delivered order counts and sales amounts
-- across Online and Store sales channels.

SELECT
    sales_channel,
    COUNT(*) AS delivered_orders,
    SUM(amount) AS delivered_sales_amount
FROM (
    SELECT
        'Online' AS sales_channel,
        amount,
        status
    FROM online_sales

    UNION ALL

    SELECT
        'Store' AS sales_channel,
        amount,
        status
    FROM store_sales
) AS combined_sales
WHERE status = 'Delivered'
GROUP BY sales_channel
ORDER BY delivered_sales_amount DESC;

-- =====================================================
-- RESULTS:
-- Online: 5 orders | Sales Amount: 89700
-- Store:  6 orders | Sales Amount: 41300
-- =====================================================

-- BUSINESS INSIGHT:
-- Online sales generated a higher total delivered
-- sales amount despite having fewer delivered orders.
--
-- This indicates a higher average order amount
-- for the online channel in the sample dataset.
--
-- NOTE:
-- These amounts use the recorded amount column.
-- Discount adjustments have not been applied.
-- =====================================================


-- =====================================================
-- BUSINESS QUESTION 2:
-- Which product category generates the highest
-- completed sales amount?
-- =====================================================

-- OBJECTIVE:
-- Compare delivered sales across product categories
-- from both Online and Store sales channels.

SELECT
    category,
    COUNT(*) AS delivered_orders,
    SUM(amount) AS total_sales_amount
FROM (
    SELECT category, amount, status
    FROM online_sales

    UNION ALL

    SELECT category, amount, status
    FROM store_sales
) AS combined_sales
WHERE status = 'Delivered'
GROUP BY category
ORDER BY total_sales_amount DESC;

-- =====================================================
-- RESULTS:
-- Electronics:  6 orders | Sales Amount: 82500
-- Furniture:    3 orders | Sales Amount: 40000
-- Accessories:  2 orders | Sales Amount: 8500
-- =====================================================

-- BUSINESS INSIGHT:
-- Electronics is the highest-performing category,
-- generating approximately 63% of the total
-- delivered sales amount in this sample.
--
-- Furniture ranks second, followed by Accessories.
--
-- These findings describe the sales mix in a
-- small sample and do not establish long-term trends.
--
-- NOTE:
-- Sales amounts are based on the amount column.
-- Discounts have not been applied.
-- =====================================================
  
