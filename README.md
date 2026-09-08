# 📚 Online Bookstore SQL Analysis

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-316192?logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-blue)
![Data Analysis](https://img.shields.io/badge/Focus-Data%20Analysis-orange)
![Status](https://img.shields.io/badge/Project-Completed-success)

## 📌 Project Overview

This project is an end-to-end **SQL data analysis project** based on an Online Bookstore.

The objective is to analyze customers, books, and orders to uncover useful business insights related to **sales performance, customer behavior, product performance, revenue, and inventory**.

The project was developed using **PostgreSQL** and covers SQL concepts from basic querying to advanced analytics, business analysis, views, and database performance optimization.

## 🎯 Project Objectives

- Analyze customer purchasing behavior
- Understand book and genre performance
- Calculate total and customer-level revenue
- Identify top-selling books
- Identify high-value customers
- Analyze order trends
- Analyze inventory levels
- Identify books requiring restocking
- Perform advanced SQL analysis
- Create reusable SQL Views
- Understand and implement database indexes
- Practice SQL techniques used in real-world Data Analyst roles

## 🗂️ Database Structure

### 👥 Customers

| Column | Description |
|---|---|
| `customer_id` | Unique customer identifier |
| `name` | Customer name |
| `email` | Customer email |
| `phone` | Customer phone number |
| `city` | Customer city |
| `country` | Customer country |

### 📚 Books

| Column | Description |
|---|---|
| `book_id` | Unique book identifier |
| `title` | Book title |
| `author` | Book author |
| `genre` | Book genre |
| `published_year` | Publication year |
| `price` | Book price |
| `stock` | Available stock |

### 🛒 Orders

| Column | Description |
|---|---|
| `order_id` | Unique order identifier |
| `customer_id` | Customer who placed the order |
| `book_id` | Purchased book |
| `order_date` | Date of order |
| `quantity` | Number of books purchased |
| `total_amount` | Total order amount |

## 🔗 Table Relationships

```text
Customers
    │
    │ customer_id
    ▼
 Orders
    │
    │ book_id
    ▼
 Books
```

- One customer can place multiple orders.
- One book can appear in multiple orders.
- `customer_id` connects `Customers` and `Orders`.
- `book_id` connects `Orders` and `Books`.

## 🧠 SQL Concepts Covered

### 🟢 Basic SQL

- `SELECT`
- `WHERE`
- `DISTINCT`
- `ORDER BY`
- `LIMIT`
- `LIKE`
- `IN`
- `BETWEEN`
- `IS NULL`
- Comparison operators
- `CASE`
- `CONCAT()`

### 🟡 Intermediate SQL

- `INNER JOIN`
- `LEFT JOIN`
- Multiple table joins
- `GROUP BY`
- `HAVING`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- Subqueries

### 🔴 Advanced SQL

- Common Table Expressions (`CTE`)
- Window Functions
- `ROW_NUMBER()`
- `RANK()`
- `DENSE_RANK()`
- `LAG()`
- `LEAD()`
- Running totals
- Percentage calculations
- Date-based analysis
- `DATE_TRUNC()`
- `EXTRACT()`

### 👁️ Views

- `CREATE VIEW`
- `CREATE OR REPLACE VIEW`
- Querying Views
- `DROP VIEW`

### ⚡ Indexes & Performance

- `CREATE INDEX`
- `CREATE UNIQUE INDEX`
- Composite indexes
- `DROP INDEX`
- `EXPLAIN`
- `EXPLAIN ANALYZE`

## 📊 Business Analysis

### Customer Analysis

- Top customers by spending
- Repeat customers
- Customers who have never placed an order
- Average customer spending
- Countries generating the most revenue

### Book Analysis

- Best-selling books
- Highest-revenue books
- Most expensive books
- Most popular genres
- Highest-revenue authors

### Sales Analysis

- Total revenue
- Average order value
- Total books sold
- Highest-revenue month
- Monthly revenue trend

### Inventory Analysis

- Low-stock books
- Books requiring restocking
- Books with high inventory but low sales

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **PostgreSQL** | Database management |
| **pgAdmin** | SQL development and database management |
| **SQL** | Data querying and analysis |
| **GitHub** | Project documentation and version control |

## 💡 Business Insights

This analysis can support decisions related to:

- Customer retention and loyalty programs
- Inventory and restocking
- Marketing campaigns
- Product performance
- Revenue growth
- Sales strategy

## 👨‍💻 Author

**Abhishek**

Aspiring Data Analyst | SQL | PostgreSQL | Python | Excel | Power BI

## 📬 Contact

- 📧 **Email:** abhishekghoter1@gmail.com
- 💼 **LinkedIn:** www.linkedin.com/in/abhishek-ghoter-69a987310

## ⭐ Project Purpose

This project was created as a practical SQL portfolio project to demonstrate my ability to use **SQL and PostgreSQL for data analysis and business problem-solving**.

If you find this project useful, feel free to ⭐ the repository.
