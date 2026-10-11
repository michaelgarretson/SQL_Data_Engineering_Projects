# Exploratory Data Analysis with SQL:  Job Market Analysis

A SQL project analyzing the data engineer job market using real world job posting data.  It demonstrates my ability to **write production-quality analytical SQL, design efficient queries, and turn business questions into data-driven insights***.

## 🧾 Executive Summary

- ✅ **Project Scope:**  Built **3 analytical queries*** that answer key questions about the data engineer job market.

- ✅ **Data Modeling:**  Used **multi-table joins** across fact and dimension tables to extract insights.

- ✅ **Analytics:**  Applied **aggregation, filtering, and sorting** to find the top skills by demand, salary, and overall value to the potential applicant

- ✅ **Outcome:**  Delivered **actionable insights** on Python/SQL dominance, the importance of being comfortable with one of the primary cloud platforms (AWS, GCP, or Azure), and salary patterns

If you only have a minute, review these:

[Top Demanded Skills Query](./top_paying_skills.sql) - demand analysis with multiple table joins.

[Most In Demand Skills Query](./most_in_demand_skills.sql) - salary analysis with aggregations

[Most Optimal Skills Query](./most_optimal_skills.sql) - combined demand/salary optimization query.

## 🧩 Problem & Context
Job Market Analysts need to answer questions like:
- **Most in-demand:** *Which skills are most in-demand for data engineers?*
- 💰 **Highest paid:** *Which skills command the highest salaries?*
- ⚖️ **Best trade-off:** *What is the optimal skill set balancing demand and compensation?*

This project analyzes a **data warehouse** built using a star schema design.  The warehouse structure consists of:
![Data Warehouse](../images/1_2_Data_Warehouse.png)
**Fact Table:** `job_postings_fact` - Central table containing job posting details (job titles, locations, salaries, dates, etc)

**Dimension Tables:**
- `company_dim` - company information linked to job postings
- `skills_dim` - Skills catalog with skill names and types

**Bridge Table:** `skills_job_dim` - resolves the many to many relationship between job_postings_fact and skills_dim

By querying across these interconnected tables, I extracted insights about skill demand, salary patterns, optimal skill combinations for data engineering roles.

## 🧰 Tech Stack
- **🐤 Query Engine:** DuckDB for fast OLAP-style analytical queries
- **🧮 Language:** SQL (ANSI-style with analytical functions)
- **📊 Data Model:** Star schema with fact, dimension, and bridge tables
- **🛠️ Development:** VS Code for SQL editing + Terminal for DuckDB CLI
- **📦 Version Control:** Git/GitHub for versioned SQL scripts

## 🏗 Analysis Overview

### Query Structure
**[Top Demanded Skills](most_in_demand_skills.sql)** - Identifies the 10 most in-demand skills for remote data engineer positions.

**[Top Paying Skills](top_paying_skills.sql)** - Analyzes the 25 highest-paying skills with salary and demand metrics.

**[Optimal Skills](most_optimal_skills.sql)** - Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn

### Key Insights
- 🧠 Core languages: SQL and Python each appear in ~29,000 job postings, making them the most demanded skill.

- ☁️ Cloud Platforms:  AWS and Azure are critical for modern data engineering roles.

- 🧱 Infrastructure and Tooling:  Kubernetes, Docker, and Terraform are associated with premium salaries.\

- 🔥 Big data tools: Apache Spark shows strong demand with competitive compensation.

## 💻 SQL Skills Demonstrated

### Query Design & Optimization
- **Complex Joins**:  Multi-table `INNER JOIN` operations across `job_postings_fact`, `skills_job_dim`,`skills_dim` 
- **Aggregations**:  `COUNT()`, `MEDIAN`, `ROUND()` for statistical analysis
- **Filtering**:  Boolean logic with `WHERE` clauses and multiple conditions (`job_title_short`, `job_work_from_home` , `salary_year_avg IS NOT NULL`)
- **Sorting and Limiting**:  `ORDER BY` with `DESC` and `LIMIT` for top-N analysis

### Data Analysis Techniques
- **Grouping**:  `GROUP BY` for categorical analysis by skill
- **Mathematical Functions**:  `LN()` for natural logarithm transformation to normalize demand metrics.
- **Calculated Metrics**:  Derived optimal score combining log-transformed demand with median salary.
- **HAVING Clause**:  Filtering aggregated results (skills with >= 100 postings)
- **NULL Handling**:  Proper filtering of incomplete records (`salary_year_avg IS NOT NULL`)

