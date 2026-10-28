/*
Task

Create a SQL file in the Lesson folder named 1.21.5.sql.
Use the company_jobs database.
Write an INSERT INTO statement to add data to the dev.applications_fact table.
Explicitly list the columns to be populated: application_id, job_id, candidate_id, date_applied, application_status, and internal_candidate.
Insert the following four records into the table:
Application 1 for Job 101 and Candidate 1 on 2025-11-10 with a status of 'Applied' and FALSE for the internal flag.
Application 2 for Job 102 and Candidate 2 on 2025-11-12 with a status of 'Interview' and TRUE for the internal flag.
Application 3 for Job 103 and Candidate 3 on 2025-11-08 with a status of 'Offer' and FALSE for the internal flag.
Application 4 for Job 104 and Candidate 4 on 2025-11-14 with a status of 'Rejected' and TRUE for the internal flag.
Inspect the table to make sure teh data was inserted in properly.
Hint
Ensure that your list of values in the VALUES clause exactly matches the order of the columns you defined in the INSERT INTO statement.
Remember that while strings and dates require single quotes (e.g., 'Applied'), boolean literals like TRUE and FALSE should not be quoted.
Use something like ChatGPT to quickly format the four records into something useable you can then paste under your insert statement.
*/
-- .read Lessons/1.21/1.21.5.sql
USE company_jobs;

INSERT INTO dev.applications_fact
(
    application_id, candidate_id,job_id,
    date_applied,application_status, internal_candidate
)
VALUES
(1,101,1,'2025-11-10','Applied',False),
(2,102,2,'2025-11-12','Interview',True),
(3,103,3,'2025-11-08','Offer',False),
(4,104,4,'2025-11-14','Rejected',True);

SELECT * FROM dev.applications_fact;