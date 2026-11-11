# Employee Leave Management System – MySQL Project

## 📌 Project Overview

The **Employee Leave Management System** is a relational database project developed using MySQL. It is designed to manage employee information, departments, leave types, leave requests, and approval statuses in an organized and efficient manner.

The project demonstrates how SQL can be used to store, manage, retrieve, and analyze employee leave information through database operations and queries.

## 🎯 Project Objectives

- Design and implement a relational database using MySQL.
- Manage employee, department, manager, and leave information.
- Maintain employee leave request records.
- Track leave request statuses such as Approved, Pending, and Rejected.
- Retrieve meaningful information using SQL queries.
- Generate reports using aggregate functions and joins.
- Automate database operations using stored procedures and triggers.

## 🗄️ Database Design

The project consists of five main relational tables:

| Table Name | Description |
|---|---|
| Departments | Stores department information |
| Employees | Stores employee details |
| Managers | Stores manager information |
| Leave_Types | Stores different types of leave |
| Leave_Requests | Stores employee leave requests and approval details |

### Database Relationships

- Each employee belongs to a department.
- Each leave request is associated with an employee.
- Each leave request is assigned to a manager.
- Each leave request has a specific leave type.
- Primary keys and foreign keys maintain relationships between tables.

## ⚙️ Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Tool:** MySQL Workbench

## ✨ Key Features

- Employee and department management.
- Manager and leave type management.
- Leave request management.
- Leave approval status tracking.
- Approved and pending leave reports.
- Department-wise leave statistics.
- Manager-wise leave reports.
- Employee leave analysis.

## 📚 SQL Concepts Implemented

This project covers the following SQL concepts:

1. Database and table creation (DDL).
2. Data manipulation (DML).
3. CRUD operations.
4. Primary Key and Foreign Key constraints.
5. Database normalization up to 3NF.
6. Aggregate functions – COUNT(), SUM(), AVG(), MAX(), MIN().
7. String functions – UPPER(), LOWER(), CONCAT(), SUBSTRING(), TRIM().
8. Date functions – CURDATE(), NOW(), YEAR(), MONTH(), DAY().
9. SQL Joins – INNER JOIN, LEFT JOIN, RIGHT JOIN, SELF JOIN.
10. GROUP BY and HAVING clauses.
11. Subqueries and correlated subqueries.
12. Views for approved and pending leave requests.
13. Transactions for approving and cancelling leave requests.
14. Stored procedures with IN, OUT, and INOUT parameters.
15. Triggers for automatic leave request logging and status history.

## 📊 Project Reports and Analysis

The database supports various analytical queries, including:

- Total leave requests by department.
- Leave requests grouped by status.
- Average leave days by department.
- Employee with maximum leave days.
- Department with maximum leave requests.
- Employees who never applied for leave.
- Latest five leave requests.
- Monthly leave statistics.
- Manager-wise approved leave count.
- Employees whose leave exceeds the department average.

## 🚀 How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench.
3. Create a new database for the project.
4. Open the SQL script files from this repository.
5. Execute the database creation and table creation queries.
6. Insert the sample records.
7. Execute the SQL queries to explore the project features.
8. Test the views, stored procedures, transactions, and triggers.

## 🎓 Learning Outcomes

Through this project, I gained practical knowledge of:

- Designing relational databases.
- Understanding table relationships and normalization.
- Writing SQL queries to retrieve and manipulate data.
- Applying aggregate, string, and date functions.
- Working with joins and subqueries.
- Creating views and stored procedures.
- Implementing triggers and transactions.
- Generating meaningful reports using MySQL.

## 👩‍💻 Author

**Tanuja Sundarapalli**

## Acknowledgement

This project was developed as a MySQL database capstone project to gain hands-on experience in relational database design and SQL query implementation.

---

⭐ If you find this project useful, feel free to explore the repository!
