/*
Task

Create a SQL file in the Lesson folder named 1.21.3.sql.
Connect to the data_jobs database in MotherDuck and then switch to use the company_jobs database.
Write a command to create a schema named staging. Ensure the command does not fail if the schema already exists.
Write a command to delete the staging schema you just created.
Write a command to create a permanent schema named dev, again, handling cases where it might already exist.
Write a final query to verify that all schemas were properly created and/or removed by inspecting the relevant table in information_schema.
Ensure you filter the results to only show schemas for company_jobs.
Hint
Use the IF NOT EXISTS clause to safely create schemas without generating errors.
The information_schema contains system-wide metadata about tables, columns, and schemas.
Use the information_schema.schemata table to verify schemas and filter the catalog_name for the applicable database.
*/
-- .read Lessons/1.21/1.21.3.sql
USE company_jobs;

CREATE SCHEMA IF NOT EXISTS staging;
DROP SCHEMA IF EXISTS staging;
CREATE SCHEMA IF NOT EXISTS dev;

SELECT 
    catalog_name,schema_name 
from 
    information_schema.schemata
WHERE
    catalog_name='company_jobs';

/*
┌──────────────┬─────────────┐
│ catalog_name │ schema_name │
│   varchar    │   varchar   │
├──────────────┼─────────────┤
│ company_jobs │ dev         │
│ company_jobs │ main        │
└──────────────┴─────────────┘
*/