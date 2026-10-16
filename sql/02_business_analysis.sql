
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
