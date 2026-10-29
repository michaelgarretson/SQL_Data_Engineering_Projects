/*
Task

Create a SQL file in the Lesson folder named 1.21.10.sql.
Use the company_jobs database.
Update the internal_candidate column to TRUE in the dev.applications_fact 
    table for the record where the application_id is 1.
Perform a similar update in the dev.applications_fact table, setting 
    internal_candidate to TRUE for the record where application_id is 3.
Write a final query to retrieve all columns from the dev.applications_fact 
    table to confirm the changes were applied correctly.

Hint
The WHERE clause is essential in DML operations to prevent updating every 
    row in the target table.
*/
-- .read Lessons/1.21/1.21.10.sql
USE company_jobs;

UPDATE 
    dev.applications_fact
SET 
    internal_candidate = TRUE
WHERE 
    application_id in (1,3);

SELECT
    application_id, internal_candidate
FROM
    dev.applications_fact;

/*
┌────────────────┬────────────────────┐
│ application_id │ internal_candidate │
│     int32      │      boolean       │
├────────────────┼────────────────────┤
│              1 │ true               │
│              2 │ true               │
│              3 │ true               │
│              4 │ true               │
└────────────────┴────────────────────┘
*/