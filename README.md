# 📊 DataAnalytics-Assessment

This repository contains SQL-based data analytics tasks focused on customer segmentation and behavior analysis.

---

## 🔧 Setup Instructions

1. **Download and Extract Dataset**
   - Download the zip file from the provided Google Drive link.
   - Import the extracted `.sql` file into **MySQL Workbench** or any MySQL-compatible tool.

2. **Database Structure**
   The database contains the following tables:

   | Table Name               | Description                                       |
   |--------------------------|---------------------------------------------------|
   | `users_customuser`       | Customer demographic and contact information      |
   | `savings_savingsaccount` | Records of deposit transactions                   |
   | `plans_plan`             | Records of customer-created plans                 |
   | `withdrawals_withdrawal` | Records of withdrawal transactions                |

---

## 📌 Questions and Solutions

### ✅ Question 1: High-Value Customers with Multiple Products

**Scenario:**  
The business wants to identify customers who have both a funded **savings** and **investment** plan for cross-selling opportunities.

**Task:**  
Write a query to find customers with **at least one funded savings plan** AND **one funded investment plan**, sorted by total deposits.

**Tables Used:**
- `users_customuser`
- `savings_savingsaccount`
- `plans_plan`

**Approach:**
- Join `users_customuser`, `savings_savingsaccount`, and `plans_plan` using `owner_id` and `plan_id`.
- Use `WHERE` clause to filter:
  - `plans_plan.is_regular_savings = 1`
  - `plans_plan.is_a_fund = 1`
- Use `GROUP BY` and `HAVING` to ensure both conditions are met.
- Sort results by total amount deposited.

---

### ✅ Question 2: Transaction Frequency Categorization

**Scenario:**  
The finance team wants to analyze how frequently customers transact to segment them (e.g., frequent vs. occasional users).

**Task:**  
Calculate the average number of transactions per customer per month and categorize them as:

- **High Frequency** (≥ 10 transactions/month)
- **Medium Frequency** (3–9 transactions/month)
- **Low Frequency** (≤ 2 transactions/month)

**Tables Used:**
- `users_customuser`
- `savings_savingsaccount`
- (Assumed: `savings_transaction` table)

**Approach:**
- Join the necessary tables on `owner_id`.
- Count the number of transactions per user per month using `DATE_FORMAT(transaction_date, '%Y-%m')`.
- Use `CASE` to categorize frequency.
- Use `GROUP BY` and `AVG()` to compute monthly averages.

---

## 📁 Project Structure

