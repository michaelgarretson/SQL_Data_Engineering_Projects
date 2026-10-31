/*
Task

Create a SQL file in the Lesson folder named 1.22.1.sql.
Use the company_jobs database.
Write a query that creates a new table named 
    uk_jobs_archive.
Populate this new table with all columns from the 
data_jobs.job_postings_fact table.
Apply a filter to ensure only records where the job_country is exactly 'United Kingdom' are included in the archive.
Query the new table to verify it was created properly.
Hint
Recall the CTAS (Create Table As Select) pattern, which allows you to define a table's structure and insert data simultaneously using a subquery.
Make sure to use the fully qualified name for the source table (database.table) to ensure the query references the correct data source.
*/

-- .read Lessons/1.22/1.22.1.sql

USE company_jobs;

CREATE OR REPLACE TABLE dev.uk_jobs_archive
AS
SELECT 
    *
FROM 
    data_jobs_bonus.job_postings_fact
WHERE job_country = 'United Kingdom';

SELECT 
    job_id,job_country
FROM 
    dev.uk_jobs_archive;

/*

*/