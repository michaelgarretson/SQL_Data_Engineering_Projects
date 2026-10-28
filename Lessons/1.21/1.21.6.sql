/*
Task

Create a SQL file in the Lesson folder named 1.21.6.sql.
Use the company_jobs database.
Modify the schema of the existing dev.applications_fact table.
Add a new column named follow_up_timestamp to the table.
Ensure the new column uses the TIMESTAMPTZ data type to properly handle time zone offsets.
Inspect that this new column was created properly.
Hint
When you need to change the structure of an existing table rather than creating a new one, use the ALTER TABLE command.
The ADD COLUMN clause allows you to append new fields to a table while preserving the existing data and structure.

*/
-- .read Lessons/1.21/1.21.6.sql
USE company_jobs;

ALTER TABLE dev.applications_fact
ADD COLUMN IF NOT EXISTS follow_up_timestamp TIMESTAMPTZ;

describe dev.applications_fact;

/*
┌───────────────────────────────────────────────────────┐
│                   applications_fact                   │
│                                                       │
│ application_id      integer                  not null │
│ candidate_id        integer                           │
│ job_id              integer                           │
│ date_applied        date                              │
│ application_status  varchar                           │
│ internal_candidate  boolean                           │
│ follow_up_timestamp timestamp with time zone          │
└───────────────────────────────────────────────────────┘
*/