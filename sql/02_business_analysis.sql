
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


-- =====================================================
-- BUSINESS QUESTION 3:
-- Which customer cities generate the highest
-- completed sales amounts?
-- =====================================================

-- OBJECTIVE:
-- Identify the cities contributing the most
-- completed sales across both sales channels.

SELECT
    city,
    COUNT(*) AS delivered_orders,
    SUM(amount) AS total_sales_amount
FROM (
    SELECT city, amount, status
    FROM online_sales

    UNION ALL

    SELECT city, amount, status
    FROM store_sales
) AS combined_sales
WHERE status = 'Delivered'
GROUP BY city
ORDER BY total_sales_amount DESC;

-- =====================================================
-- VERIFIED RESULTS:
-- Hyderabad: 5 orders | 77000
-- Delhi:     2 orders | 29000
-- Chennai:   1 order  | 11000
-- Pune:      2 orders | 9000
-- Bengaluru: 1 order  | 5000
--
-- Total: 11 delivered orders | 131000
-- =====================================================

-- BUSINESS INSIGHT:
-- Hyderabad generated the highest delivered sales
-- amount, contributing approximately 58.8% of the
-- total across both sales channels.
--
-- Delhi ranked second with a sales amount of 29000.
--
-- Sales are concentrated among Hyderabad customers
-- in this small sample dataset.
--
-- A larger dataset is required before making
-- location-specific business investment decisions.
--
-- NOTE:
-- City represents the customer's city, not
-- necessarily the physical store location.
-- Amounts are before separate discount adjustments.
-- =====================================================
  
  
