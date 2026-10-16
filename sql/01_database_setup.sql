-- ShopSphere E-Commerce Sales Analysis
-- File: 01_database_setup.sql
-- Purpose: Create and populate the online and in-store sales tables.
-- Customer names and email addresses have been replaced with consistent
-- demo identifiers, preserving repeat customers across both tables.
-- All other transaction fields are retained from the supplied practice dataset.
-- Dataset sharing note: Publish only if you own or have permission to share
-- the underlying sales records and business information.
-- NOTE: order_date is stored as VARCHAR in the original exercise schema;
-- use STR_TO_DATE(order_date, '%d-%m-%Y') for date calculations.
-- Running this script again DROPS and recreates both sales tables.

CREATE DATABASE IF NOT EXISTS shopsphere_db;

USE shopsphere_db;

-- 1. ONLINE SALES

DROP TABLE IF EXISTS online_sales;

CREATE TABLE online_sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2),
    order_date VARCHAR(20),
    discount DECIMAL(5,2),
    status VARCHAR(20)
);


INSERT INTO online_sales
(sale_id, customer_name, email, city, product, category,
 quantity, amount, order_date, discount, status)
VALUES

(101, 'Customer_001', 'customer_001@example.com', 'Hyderabad',
 'Laptop', 'Electronics', 1, 65000, '15-08-2026', 10, 'Delivered'),

(102, 'Customer_002', 'customer_002@example.com', 'Bengaluru',
 'Headphones', 'Electronics', 2, 5000, '18-08-2026', 5, 'Delivered'),

(103, 'Customer_003', 'customer_003@example.com', 'Chennai',
 'Office Chair', 'Furniture', 1, 8500, '20-08-2026', 0, 'Pending'),

(104, 'Customer_004', 'customer_004@example.com', 'Hyderabad',
 'Keyboard', 'Electronics', 3, 4500, '22-08-2026', 8, 'Delivered'),

(105, 'Customer_005', 'customer_005@example.com', 'Mumbai',
 'Monitor', 'Electronics', 2, 30000, '25-08-2026', 12, 'Cancelled'),

(106, 'Customer_006', 'customer_006@example.com', 'Delhi',
 'Desk', 'Furniture', 1, 12000, '27-08-2026', 5, 'Delivered'),

(107, 'Customer_007', 'customer_007@example.com', 'Hyderabad',
 'Mouse', 'Electronics', 4, 3200, '29-08-2026', 0, 'Delivered'),

(108, 'Customer_008', 'customer_008@example.com', 'Kochi',
 'Backpack', 'Accessories', 2, 4000, '30-08-2026', 15, 'Pending');



-- 2. STORE SALES


DROP TABLE IF EXISTS store_sales;

CREATE TABLE store_sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2),
    order_date VARCHAR(20),
    discount DECIMAL(5,2),
    status VARCHAR(20)
);


INSERT INTO store_sales
(sale_id, customer_name, email, city, product, category,
 quantity, amount, order_date, discount, status)
VALUES

(201, 'Customer_001', 'customer_001@example.com', 'Hyderabad',
 'Laptop Bag', 'Accessories', 1, 2500, '16-08-2026', 5, 'Delivered'),

(202, 'Customer_009', 'customer_009@example.com', 'Pune',
 'Keyboard', 'Electronics', 2, 3000, '19-08-2026', 10, 'Delivered'),

(203, 'Customer_003', 'customer_003@example.com', 'Chennai',
 'Desk', 'Furniture', 1, 11000, '21-08-2026', 5, 'Delivered'),

(204, 'Customer_010', 'customer_010@example.com', 'Mumbai',
 'Monitor', 'Electronics', 1, 16000, '23-08-2026', 8, 'Pending'),

(205, 'Customer_004', 'customer_004@example.com', 'Hyderabad',
 'Mouse', 'Electronics', 2, 1800, '24-08-2026', 0, 'Delivered'),

(206, 'Customer_011', 'customer_011@example.com', 'Delhi',
 'Office Chair', 'Furniture', 2, 17000, '26-08-2026', 10, 'Delivered'),

(207, 'Customer_007', 'customer_007@example.com', 'Hyderabad',
 'Headphones', 'Electronics', 1, 2800, '28-08-2026', 5, 'Cancelled'),

(208, 'Customer_012', 'customer_012@example.com', 'Pune',
 'Backpack', 'Accessories', 3, 6000, '31-08-2026', 12, 'Delivered');
