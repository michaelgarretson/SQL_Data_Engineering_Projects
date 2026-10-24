/*
Task

Create a SQL file in the Lesson folder named 1.21.7.sql.
Use the company_jobs database.
Modify the structure of the dev.applications_fact table.
Update the follow_up_timestamp column to change its data type to DATE.
Inspect that this column was updated properly.

Hint
Recall that the ALTER TABLE statement is used to make schema changes to existing objects. You will specifically need the ALTER COLUMN clause to redefine the data type.
Ensure you are targeting the dev schema to locate the applications_fact table correctly.

*/
-- .read Lessons/1.21/1.21.7.sql
USE company_jobs;

ALTER TABLE dev.applications_fact
ALTER COLUMN follow_up_timestamp TYPE DATE;

DESCRIBE dev.applications_fact;

/*
┌──────────────────────────────────────┐
│          applications_fact           │
│                                      │
│ application_id      integer not null │
│ candidate_id        integer          │
│ job_id              integer          │
│ date_applied        date             │
│ application_status  varchar          │
│ internal_candidate  boolean          │
│ follow_up_timestamp date             │
└──────────────────────────────────────┘
*/