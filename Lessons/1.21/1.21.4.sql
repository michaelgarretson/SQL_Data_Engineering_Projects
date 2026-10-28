/*
Task

Create a SQL file in the Lesson folder named 1.21.4.sql.
Use the company_jobs database.
Write a statement to create a table named applications_fact within 
the dev schema.
Ensure the table is only created if it does not already exist to prevent 
errors during pipeline execution.
Define the following columns:
Define the application_id as the PRIMARY KEY using an INTEGER type.
Include columns for candidate_id and job_id as INTEGER types to facilitate
 joins with dimension tables.
Add a date_applied column using the DATE type and an application_status 
column using the TEXT type.
Include a boolean flag named internal_candidate to distinguish between 
internal and external applicants.
Verify the table is created after completion.
Hint
Remember to use the schema prefix (schema_name.table_name) to ensure the table is created in the correct logical environment.
When defining a PRIMARY KEY, you are telling the database that this column must be unique and cannot contain NULL values.
*/
-- .read Lessons/1.21/1.21.4.sql
USE company_jobs;


CREATE TABLE IF NOT EXISTS dev.applications_fact 
(
    application_id INTEGER PRIMARY KEY,
    candidate_id INTEGER,
    job_id INTEGER,
    date_applied DATE,
    application_status TEXT,
    internal_candidate BOOLEAN
);

SELECT 
    table_name, table_catalog, table_schema
FROM 
    information_schema.tables
WHERE 
    table_catalog = 'company_jobs'
;

describe dev.applications_fact;



/*
*/