/*
Task

Create a SQL file in the Lesson folder named 1.21.13.sql.
Use the company_jobs database.
Write a statement to permanently remove the internal_applications_fact table 
    from the database.
Ensure the script is idempotent by including a clause that prevents the 
    statement from returning an error if the table has already been deleted.
NOTE: This will also hide if you specify the correct database, as it 
won't return an error message.
Ensure the table is dropped by querying the applicable information_schema table.
*/
-- .read Lessons/1.21/1.21.13.sql
USE company_jobs;

DROP TABLE IF EXISTS dev.internal_applications_fact;

SELECT *
FROM information_schema.tables
WHERE
    table_catalog = 'company_jobs'
AND table_schema = 'dev';

/*
┌───────────────┬──────────────┬────────────┬───┬──────────┬───────────────┬───────────────┐
│ table_catalog │ table_schema │ table_name │ … │ is_typed │ commit_action │ TABLE_COMMENT │
│    varchar    │   varchar    │  varchar   │ … │ varchar  │    varchar    │    varchar    │
└───────────────┴──────────────┴────────────┴───┴──────────┴───────────────┴───────────────┘
                                           0 rows    
*/