
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


-- =====================================================
-- BUSINESS QUESTION 4:
-- Which products generate the highest completed sales
-- and what percentage does each contribute?
-- =====================================================

-- OBJECTIVE:
-- Rank products by completed sales amount and
-- calculate their percentage contribution.

WITH delivered_sales AS (
    SELECT product, amount
    FROM online_sales
    WHERE status = 'Delivered'

    UNION ALL

    SELECT product, amount
    FROM store_sales
    WHERE status = 'Delivered'
),

product_sales AS (
    SELECT
        product,
        COUNT(*) AS delivered_orders,
        SUM(amount) AS total_sales_amount
    FROM delivered_sales
    GROUP BY product
)

SELECT
    product,
    delivered_orders,
    total_sales_amount,

    DENSE_RANK() OVER (
        ORDER BY total_sales_amount DESC
    ) AS sales_rank,

    ROUND(
        100.0 * total_sales_amount /
        SUM(total_sales_amount) OVER (),
        2
    ) AS sales_contribution_pct

FROM product_sales
ORDER BY sales_rank, product;


-- =====================================================
-- VERIFIED TOP 5 RESULTS:
-- =====================================================

-- Rank 1: Laptop       | 65000 | 49.62%
-- Rank 2: Desk         | 23000 | 17.56%
-- Rank 3: Office Chair | 17000 | 12.98%
-- Rank 4: Keyboard     | 7500  | 5.73%
-- Rank 5: Backpack     | 6000  | 4.58%

-- Total delivered sales amount: 131000


-- =====================================================
-- BUSINESS INSIGHTS:
-- =====================================================

-- 1. Laptop generated the highest completed sales
--    amount, contributing 49.62% of total sales.

-- 2. Laptop, Desk, and Office Chair together
--    contributed approximately 80.15% of sales.

-- 3. Sales are concentrated among a small number
--    of products in this sample dataset.

-- 4. A larger dataset and profitability analysis
--    would be required before making inventory
--    or investment recommendations.

-- NOTE:
-- Recorded sales amounts are used before any
-- separate discount adjustments.
-- =====================================================

  
