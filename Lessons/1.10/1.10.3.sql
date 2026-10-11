/*
Explore how to change the output display mode in the DuckDB terminal to view wide tables that have hidden columns.

Task

Create a SQL file in the Lesson folder (e.g., 1.10.3.sql)
Write a query that selects all columns from information_schema.tables for the table 'job_postings_fact'
Run the query to see the standard output (notice if columns are hidden)
In the terminal, type .mode line and press Enter to switch to vertical view
Run the query again to see the full details of every column
In the terminal, type .mode duckbox and press Enter to reset the view to the default table format.

*/
SELECT
    *
FROM
    information_schema.tables
WHERE
    table_name = 'job_postings_fact';
