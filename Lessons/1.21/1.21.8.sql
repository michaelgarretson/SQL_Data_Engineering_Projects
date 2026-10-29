/*
Task

Create a SQL file in the Lesson folder named 1.21.8.sql.
Use the company_jobs database.
Write a statement to modify the structure of the dev.applications_fact 
table.
Rename the existing column follow_up_timestamp to follow_up_date.
Verify the column was updated.

Hint
When renaming a column, you need to use the ALTER TABLE command followed 
by the RENAME COLUMN clause. Make sure to reference the table using its full schema-qualified name: dev.applications_fact.
*/
-- .read Lessons/1.21/1.21.8.sql
use company_jobs;

ALTER TABLE dev.applications_fact 
RENAME COLUMN follow_up_timestamp TO followup_date;

/*
┌─────────────────────────────────────┐
│          applications_fact          │
│                                     │
│ application_id     integer not null │
│ candidate_id       integer          │
│ job_id             integer          │
│ date_applied       date             │
│ application_status varchar          │
│ internal_candidate boolean          │
│ followup_date      date             │
└─────────────────────────────────────┘
*/