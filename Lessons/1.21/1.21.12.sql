/*
Task

Create a SQL file in the Lesson folder named 1.21.12.sql.
Use the company_jobs database.
Write a query to alter the structure of the dev.internal_applications_fact 
    table.
Remove the internal_candidate column from the table definition.
Verify that the column was removed.
Hint
Remember that DDL (Data Definition Language) operations like ALTER TABLE 
    make permanent changes to the table schema without needing a DELETE or UPDATE statement.

*/
-- -- .read Lessons/1.21/1.21.12.sql
USE company_jobs;

ALTER TABLE
    dev.internal_applications_fact
DROP COLUMN
    internal_candidate;

describe dev.internal_applications_fact;

/*
*/