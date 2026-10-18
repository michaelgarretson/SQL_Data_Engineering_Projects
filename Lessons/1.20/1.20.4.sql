/*
Create a unique identifier for each job posting by combining multiple 
columns into a single "compound key." You will need to convert different 
data types (Dates and Integers) into a common format (String/Text) to 
successfully join them together.

Task

Create a SQL file in the Lesson folder (e.g., 1.20.4.sql).
Select the following columns from job_postings_fact:
job_posted_date, company_id, and job_title_short.
Create a new column aliased as dt that converts the job_posted_date 
into a Date type.
Create a new column aliased as compound_key by concatenating:
The company_id
A hyphen '-'
The date (from the dt calculation)
Limit the output to the first 10 rows.

Hint
In DuckDB (and PostgreSQL), the concatenation operator is ||.
You cannot concatenate an Integer directly with a Date. Ensure both are 
converted to text using the casting syntax (e.g., ::STRING or similar) 
before joining them.

*/

SELECT
    job_posted_date::DATE dt,
    company_id::varchar||'-'||dt::varchar compound_key,
    job_posted_date,company_id, job_title_short
FROM
    job_postings_fact
LIMIT 10
;

/*
┌────────────┬──────────────┬─────────────────────┬────────────┬─────────────────────┐
│     dt     │ compound_key │   job_posted_date   │ company_id │   job_title_short   │
│    date    │   varchar    │      timestamp      │   int32    │       varchar       │
├────────────┼──────────────┼─────────────────────┼────────────┼─────────────────────┤
│ 2023-01-01 │ 0-2023-01-01 │ 2023-01-01 00:00:04 │          0 │ Data Analyst        │
│ 2023-01-01 │ 1-2023-01-01 │ 2023-01-01 00:00:22 │          1 │ Data Analyst        │
│ 2023-01-01 │ 2-2023-01-01 │ 2023-01-01 00:00:24 │          2 │ Data Analyst        │
│ 2023-01-01 │ 3-2023-01-01 │ 2023-01-01 00:00:27 │          3 │ Senior Data Analyst │
│ 2023-01-01 │ 4-2023-01-01 │ 2023-01-01 00:00:38 │          4 │ Data Analyst        │
│ 2023-01-01 │ 5-2023-01-01 │ 2023-01-01 00:00:38 │          5 │ Data Analyst        │
│ 2023-01-01 │ 6-2023-01-01 │ 2023-01-01 00:00:43 │          6 │ Data Analyst        │
│ 2023-01-01 │ 7-2023-01-01 │ 2023-01-01 00:00:51 │          7 │ Data Analyst        │
│ 2023-01-01 │ 8-2023-01-01 │ 2023-01-01 00:00:57 │          8 │ Business Analyst    │
│ 2023-01-01 │ 9-2023-01-01 │ 2023-01-01 00:00:57 │          9 │ Senior Data Analyst │
└────────────┴──────────────┴─────────────────────┴────────────┴─────────────────────┘
  10 rows                                                                  5 columns

*/