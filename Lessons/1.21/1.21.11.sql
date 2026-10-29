/*
*/
-- .read Lessons/1.21/1.21.11.sql
ALTER TABLE dev.applications_fact
RENAME TO internal_applications_fact;


SELECT table_catalog, table_schema, table_name, table_type
FROM 
    information_schema.TABLES
WHERE 
    table_catalog = 'company_jobs'
AND
    table_schema = 'dev';



/*
*/