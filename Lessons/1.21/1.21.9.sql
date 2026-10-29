/*
Task

Create a SQL file in the Lesson folder named 1.21.9.sql.
Use the company_jobs database.
Write UPDATE statements to modify the follow_up_date column for the 
    following records:
For application_id 1 in the dev.applications_fact table, set the date 
    to 2025-12-19.
For application_id 2 in the dev.applications_fact table, set the date 
    to 2025-12-20.
For application_id 3 in the dev.applications_fact table, set the date 
    to 2025-12-10.
For application_id 4 in the dev.applications_fact table, set the date 
    to 2025-12-08.
Include a SELECT statement at the end of your script to retrieve all 
    columns from the dev.applications_fact table to verify your updates.

Hint
When using the UPDATE command, always use a WHERE clause with a unique 
identifier like application_id to ensure you only change the intended row.

*/
-- .read Lessons/1.21/1.21.9.sql
UPDATE dev.applications_fact
    SET followup_date = CASE WHEN application_id = 1 then '2025-12-19'
    WHEN application_id = 2 then '2025-12-20'
    WHEN application_id = 3 then '2025-12-10'
    WHEN application_id = 4 then '2025-12-08' END
WHERE application_id in (1,2,3,4);

SELECT application_id,followup_date from dev.applications_fact;

/*
┌────────────────┬───────────────┐
│ application_id │ followup_date │
│     int32      │     date      │
├────────────────┼───────────────┤
│              1 │ 2025-12-19    │
│              2 │ 2025-12-20    │
│              3 │ 2025-12-10    │
│              4 │ 2025-12-08    │
└────────────────┴───────────────┘
*/