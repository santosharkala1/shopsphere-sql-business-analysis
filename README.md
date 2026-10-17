
# ShopSphere | SQL Business Analysis

## Project Overview

Analyzed sample e-commerce transaction data using MySQL to
evaluate sales performance across online and physical
store channels.

The project focuses on answering business questions
through SQL queries and communicating actionable insights.


## 🛠️ Tools and Technical Skills

**Database:** MySQL

**SQL Techniques:**
- UNION ALL
- WHERE and filtering
- GROUP BY and ORDER BY
- COUNT() and SUM()
- Aggregate analysis
- Subqueries

**Data Visualization:**
- Python
- Matplotlib

**Business Analysis:**
- Sales Channel Performance
- Product Category Analysis
- Geographic Sales Analysis
- Business Insight Generation


## Dataset

- Database: shopsphere_db
- Tables: online_sales, store_sales
- Total Transactions: 16
- Delivered Orders: 11
- Sales Channels: Online and Store

## Business Questions

1. Which sales channel generates the most completed sales?
2. Which product categories perform best?
3. Which customer cities contribute the most sales?

## Key Findings

### Sales Channel Performance
- Online: 5 delivered orders, ₹89,700
- Store: 6 delivered orders, ₹41,300

Online generated a higher recorded sales amount,
despite having fewer delivered orders.

### Product Category Analysis
Electronics ranked first with ₹82,500,
representing approximately 63% of completed sales.

### City-wise Sales Analysis
Hyderabad recorded the highest completed sales
amount at ₹77,000, approximately 58.8% of the total.

## Repository Structure

- sql/01_database_setup.sql — Database creation and sample data
- sql/02_business_analysis.sql — Business analysis queries

## How to Run

1. Open MySQL Workbench.
2. Execute 01_database_setup.sql in a practice environment.
3. Execute the queries in 02_business_analysis.sql.
4. Review the outputs and documented findings.

Note: The setup script recreates its tables.

## Limitations

This project uses a small sample dataset.
Findings are illustrative rather than representative
of long-term business performance.

Sales amounts use the recorded amount field,
without separate discount adjustments.

## Author

Arkala Santosh Kumar

Aspiring Data Analyst | Hyderabad, India
