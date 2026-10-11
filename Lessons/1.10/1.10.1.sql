/*
Explore the database metadata to identify all tables that are classified as "Dimension" tables (indicated by having 'dim' in their name).

Task

Create a SQL file in the Lesson folder (e.g., 1.10.1.sql)
Write a query against the system view information_schema.tables
Filter the results to show only rows where the table_name contains the text 'dim' anywhere in the string
Select all columns (*) for the matching tables
*/
SELECT 
    * 
FROM
    information_schema.tables
WHERE
    table_name like '%dim%'
;

