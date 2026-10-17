/*
Count the total number of job postings from December 2024, grouped by job title and whether a degree is mentioned. You will analyze these requirements by converting the Boolean degree flag into an Integer (0 or 1) to segment the data.

Task

Create a SQL file in the Lesson folder (e.g., 1.20.2.sql).
Select job_title_short and job_no_degree_mention.
Cast the job_no_degree_mention column to an Integer.
Count the total job_id and alias it as job_postings.
Filter for job postings where the job_posted_date (cast to a Date) is BETWEEN '2024-12-01' AND '2024-12-31'.
Group by job_title_short and the converted job_no_degree_mention column.
Order by job_title_short and job_no_degree_mention.
Hint
To convert a Boolean value to an Integer, use the cast syntax: column_name::INT.
This turns True into 1 and False into 0.
Remember to cast the timestamp to a date in your filter: column_name::DATE.

*/

select 
    job_title_short, job_no_degree_mention::INT,
    COUNT(job_id) jobs
from 
    job_postings_fact
WHERE
    job_posted_date::DATE BETWEEN '2024-12-01' AND '2024-12-31'
GROUP BY
    job_title_short, job_no_degree_mention::INT
ORDER BY
    job_title_short, job_no_degree_mention::INT
;

/*
┌───────────────────────────┬────────────────────────────────────────┬───────┐
│      job_title_short      │ CAST(job_no_degree_mention AS INTEGER) │ jobs  │
│          varchar          │                 int32                  │ int64 │
├───────────────────────────┼────────────────────────────────────────┼───────┤
│ Business Analyst          │                                      0 │  1325 │
│ Business Analyst          │                                      1 │   576 │
│ Cloud Engineer            │                                      0 │   314 │
│ Cloud Engineer            │                                      1 │   349 │
│ Data Analyst              │                                      0 │  4891 │
│ Data Analyst              │                                      1 │  4058 │
│ Data Engineer             │                                      0 │  3951 │
│ Data Engineer             │                                      1 │  3710 │
│ Data Scientist            │                                      0 │  4397 │
│ Data Scientist            │                                      1 │   683 │
│ Machine Learning Engineer │           s                  s         0 │   772 │
│ Machine Learning Engineer │                                      1 │    48 │
│ Senior Data Analyst       │                                      0 │   709 │
│ Senior Data Analyst       │                                      1 │   527 │
│ Senior Data Engineer      │                                      0 │   929 │
│ Senior Data Engineer      │                                      1 │   844 │
│ Senior Data Scientist     │                                      0 │   940 │
│ Senior Data Scientist     │                                      1 │   162 │
│ Software Engineer         │                                      0 │   860 │
│ Software Engineer         │                                      1 │   764 │
└───────────────────────────┴────────────────────────────────────────┴───────┘
  20 rows                                                          3 columns
*/