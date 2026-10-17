/*
Calculate the total number of job postings for New Year's Eve in 2024. 
You will need to filter the data to include only postings from 
December 31, 2024, ensuring that the time component of the timestamp 
does not interfere with your selection.

Task

Create a SQL file in the Lesson folder (e.g., 1.20.1.sql).
Select the job_posted_date, convert it to a date type, and alias it as dt.
Count the job_id column and alias it as job_postings.
Filter the results to show only records where the date is '2024-12-31'.
Group the results by the dt column.
Hint
Important: You must cast the job_posted_date to a DATE type in the 
WHERE clause to remove the time component (e.g., column::DATE).
To count the number of rows, use the COUNT aggregation function.
*/

SELECT
    job_posted_date::DATE AS dt,
    --CAST(job_posted_date AS DATE) AS dt,
    COUNT(job_id) job_postings
FROM
    job_postings_fact
WHERE job_posted_date::DATE = '2024-12-31'
GROUP BY
    dt;

/*
┌────────────┬──────────────┐
│     dt     │ job_postings │
│    date    │    int64     │
├────────────┼──────────────┤
│ 2024-12-31 │          918 │
└────────────┴──────────────┘
*/