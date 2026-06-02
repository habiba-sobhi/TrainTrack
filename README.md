# 🚆 TrainTrack — Training & Performance Management System

> A fully normalized SQL Server database system designed to automate call center training operations, enforce business rules at the database level, and eliminate manual Excel-based tracking.

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge\&logo=microsoftsqlserver\&logoColor=white)
![T-SQL](https://img.shields.io/badge/T--SQL-0078D4?style=for-the-badge\&logo=microsoftsqlserver\&logoColor=white)
![Database](https://img.shields.io/badge/Database-3NF-success?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen?style=for-the-badge)

---

# 📖 Overview

TrainTrack is a relational database project developed to manage and monitor trainee performance within a call center training environment.

Traditional training teams often rely on Excel sheets to track attendance, quizzes, role plays, and test calls. This approach is prone to errors, lacks validation, and requires manual monitoring.

TrainTrack replaces that process with a structured SQL Server solution that:

* Tracks trainees throughout the training lifecycle
* Automatically enforces business rules
* Prevents invalid data entry through constraints
* Generates performance and risk reports
* Automates trainee status updates using SQL triggers
* Provides a simple web interface for trainers

---

# 🎯 Project Objectives

The system was designed to:

* Centralize trainee information
* Track attendance records
* Record quiz and role-play performance
* Manage test call evaluations
* Identify at-risk trainees
* Automate termination and nesting decisions
* Demonstrate advanced SQL Server concepts

---

# 🛠️ Technologies Used

| Technology | Purpose                        |
| ---------- | ------------------------------ |
| SQL Server | Database Management System     |
| T-SQL      | Database Programming           |
| HTML5      | Front-End Interface            |
| CSS3       | Styling                        |
| JavaScript | Client-Side Functionality      |
| SSMS       | Database Development & Testing |

---

# 🗄️ Database Design

## Database Structure

The system consists of **10 fully normalized tables**.

| Table        | Description                                           |
| ------------ | ----------------------------------------------------- |
| Department   | Stores department information and training duration   |
| Trainer      | Trainer records and contact details                   |
| Batch        | Training batches assigned to departments and trainers |
| Trainee      | Core trainee information                              |
| Attendance   | Daily attendance records                              |
| Quiz         | Quiz definitions                                      |
| Quiz_Attempt | Trainee quiz results                                  |
| Role_Play    | Role play assessments                                 |
| RP_Attempt   | Role play results                                     |
| Test_Call    | Final call evaluation attempts                        |

---

## Entity Relationship Overview

```text
Department
    │
    ▼
 Batch
    │
    ├───────────────┐
    ▼               ▼
Trainee         Quiz
    │              │
    │              ▼
    │        Quiz_Attempt
    │
    ├───────────────┐
    ▼               ▼
Attendance     Role_Play
                    │
                    ▼
               RP_Attempt

    │
    ▼
Test_Call
```

---

# 🔄 Database Normalization

The database follows **Third Normal Form (3NF)**.

## First Normal Form (1NF)

* No repeating groups
* All attributes are atomic
* Each record uniquely identified

## Second Normal Form (2NF)

* No partial dependencies
* Data depends on the entire primary key

## Third Normal Form (3NF)

* No transitive dependencies
* Non-key attributes depend only on primary keys

---

# ⚡ Business Rules Automation

One of the project's main goals is enforcing business rules directly inside the database.

## Attendance Rule

If a trainee reaches **3 absences**, the trainee is automatically terminated.

## Quiz Rule

If a trainee fails **3 quizzes**, the trainee is automatically terminated.

## Role Play Rule

If a trainee fails **3 role plays**, the trainee is automatically terminated.

## Test Call Rule

### Passed Test Call

* Status changes to **Nesting**

### Failed All 3 Test Calls

* Status changes to **Terminated**

All rules are enforced through SQL Server triggers.

---

# 🔥 SQL Features Implemented

## Constraints

* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* NOT NULL
* CHECK

### Example

```sql
CHECK (training_weeks IN (3,4))
```

```sql
CHECK (end_date > start_date)
```

```sql
CHECK (status IN
('Active','Nesting','Graduated','Terminated'))
```

---

## Triggers

### Implemented Triggers

| Trigger                 | Purpose                               |
| ----------------------- | ------------------------------------- |
| trg_check_absences      | Terminates after 3 absences           |
| trg_check_quiz_failures | Terminates after 3 quiz failures      |
| trg_check_rp_failures   | Terminates after 3 role-play failures |
| trg_check_test_call     | Handles nesting and termination logic |

---

## SQL Concepts Demonstrated

* CREATE DATABASE
* CREATE TABLE
* PRIMARY KEYS
* FOREIGN KEYS
* CHECK Constraints
* UNIQUE Constraints
* DEFAULT Values
* INSERT Statements
* UPDATE Statements
* DELETE Statements
* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* GROUP BY
* HAVING
* Aggregate Functions
* CASE Expressions
* Stored Logic using Triggers
* Subqueries

---

# 📊 Sample Reports

The system can generate reports such as:

### At-Risk Trainees

Trainees who have:

* 2 absences
* 2 quiz failures
* 2 role-play failures

### Performance Summary

Displays:

* Attendance performance
* Quiz performance
* Role-play performance
* Current trainee status

### Department Statistics

Shows:

* Active trainees
* Graduated trainees
* Terminated trainees
* Nesting trainees

---

# 📂 Project Structure

```text
TrainTrack/
│
├── index.html
├── README.md
├── traintrack_database.sql
└── erd_training_system.html
```

---

# 🚀 How to Run

## SQL Server Setup

### Step 1

Open SQL Server Management Studio (SSMS)

### Step 2

Open:

```text
traintrack_database.sql
```

### Step 3

Execute the script:

```sql
F5
```

### Step 4

Verify:

```sql
USE TrainTrack;
SELECT * FROM Trainee;
```

---

## Web Application

Simply open:

```text
app/index.html
```

in any modern browser.

No installation required.

---

# 🎓 Learning Outcomes

Through this project I gained practical experience in:

* Relational Database Design
* SQL Server Development
* Database Normalization
* Business Rule Automation
* Trigger Development
* Query Optimization
* Data Integrity Enforcement
* Reporting and Analytics

---

# 👩‍💻 Author

**Habiba Sobhi Ramadan Ibrahim**

Computer Science Student

Alexandria National University

LinkedIn: https://www.linkedin.com/in/habiba-sobhi-b85b80352/

### Skills Demonstrated

* SQL Server
* Database Design
* Database Normalization
* T-SQL Programming
* HTML/CSS/JavaScript
* Problem Solving
* Systems Analysis

---

# 📄 License

This project was developed for educational and academic purposes as part of a Database Systems course project at Alexandria National University.
