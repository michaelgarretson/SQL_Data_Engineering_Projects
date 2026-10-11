/*
Identify tables in the database that utilize Composite Keys (keys constructed from multiple columns rather than a single column). You will analyze the system's metadata to find constraints that bind more than one column together.

Task

Create a SQL file in the Lesson folder (e.g., 1.10.2.sql)
Write a query against the information_schema.key_column_usage table
Filter the results to only include the current database (table_catalog = 'data_jobs')
Group the results by table_name and constraint_name
Select the following columns:
table_name
constraint_name
The count of columns associated with each constraint (aliased as constraint_name_count)
Filter the grouped results to show only those where the count of columns is greater than 1 (indicating a composite key)
*/
SELECT
    table_name, constraint_name 
FROM 
    information_schema.key_column_usage
WHERE 
    constraint_catalog = 'data_jobs'
GROUP BY 
    table_name, constraint_name
HAVING
    COUNT(*) > 1
;
