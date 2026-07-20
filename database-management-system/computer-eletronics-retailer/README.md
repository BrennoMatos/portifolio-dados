Computer Electronics Retailer Database Management System

## Overview

The Computer Electronics Retailer Database Management System is a PostgreSQL relational database project developed to simulate the operational environment of an electronics retailer.

The database manages the complete sales workflow, including customer registration, supplier management, inventory, sales orders, logistics, and employee information while ensuring data integrity through relational constraints, business rules, and database-level security.

Beyond operational data management, the project also includes analytical SQL queries designed to extract business insights, making it suitable for Business Intelligence and Data Analytics scenarios.

## Project Objectives

The project was designed to demonstrate practical knowledge of PostgreSQL by implementing concepts ranging from database modeling to advanced SQL and administration features.

## Main objectives include:

Design a normalized relational database
Implement business rules using constraints
Manipulate transactional data
Develop reusable PL/pgSQL functions
Manage users, roles and permissions
Apply transaction control
Perform business-oriented analytical queries
Demonstrate PostgreSQL administration concepts
Business Scenario

The database simulates an electronics retail company responsible for selling products supplied by multiple vendors and delivered through transport companies.

## The system manages:

Customers
Products
Suppliers
Sales Orders
Salespersons
Transport Companies
Geographic Information
Audit Records

This structure enables both operational transaction processing and business analysis.

Database Model

The relational model contains entities representing the core business processes.

## Main entities include:

Customer
Product
Supplier
Sales Order
Order Items
Salesperson
Carrier
City
District
Profession
Nationality

## The database enforces referential integrity through:

Primary Keys
Foreign Keys
Unique Constraints
Check Constraints
Domains
Sequences
Technologies
PostgreSQL
SQL
PL/pgSQL
pgAdmin 4
Repository Structure
computer-electronics-retailer/

│
├── 01_database_modeling.sql
├── 02_database_manipulation.sql
├── 03_sql_queries.sql
├── 04_security_and_transactions.sql
├── 05_business_analytics.sql
├── database_backup.sql
└── README.md
Features
Database Modeling
Entity Relationship Modeling
Normalization
Primary and Foreign Keys
Domains
Constraints
Indexes
Data Manipulation

## The project demonstrates CRUD operations including:

INSERT
UPDATE
DELETE
ALTER TABLE
SQL Queries

## Includes practical examples of:

Filtering
Sorting
Aggregation
GROUP BY
HAVING
CASE
JOINs
Subqueries
UNION
INTERSECT
EXISTS
PostgreSQL Features

## Advanced PostgreSQL resources implemented:

Views
Functions
Procedures
Triggers
Sequences
Transactions
Savepoints
Rollback
Security

## Implementation of database administration concepts including:

Users
Roles
GRANT
REVOKE
Privilege Management
Business Analytics

## Analytical SQL queries for business decision support:

Sales Analysis
Customer Analysis
Product Performance
Supplier Analysis
Salesperson Ranking
Revenue Analysis
Average Ticket
Time-based Analysis
Window Functions
Business Questions Answered

## Examples of business questions addressed by the analytical queries:

Who are the top customers by revenue?
Which products generate the highest sales?
Which suppliers provide the best-selling products?
What is the average ticket value?
Which salespersons achieve the highest performance?
How do sales evolve over time?
What are the best-selling product categories?
Learning Outcomes

## This project demonstrates knowledge in:

Relational Database Modeling
SQL Programming
PostgreSQL Administration
PL/pgSQL Development
Data Integrity
Transaction Management
Database Security
Business Analytics
Future Improvements

## Technical Skills Demonstrated

- Relational Database Modeling
- PostgreSQL
- SQL
- PL/pgSQL
- Database Constraints
- Views
- Triggers
- Functions
- Procedures
- Transactions
- User & Role Management
- Business Analytics
- Data Integrity

## Potential future enhancements include:

Materialized Views
Query Performance Optimization
EXPLAIN ANALYZE examples
Additional Window Functions

Author

Brenno Enrique Pereira de Matos da Silva

Chemical Engineer transitioning into Data Analytics, Business Intelligence and Data Science.
