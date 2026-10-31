/*
Task

Create a SQL file in the Lesson folder named 1.22.2.sql.
Use the company_jobs database.
Write a query that creates a new permanent table called company_salary_stats.
Filter the source records from data_jobs.job_postings_fact to include only those where salary_year_avg is not empty (NOT NULL).
Group the data by the company_id column to aggregate metrics for each specific organization.
Select the company_id and calculate two specific metrics:
The average of the salary_year_avg column, aliased as avg_yearly_salary.
The count of job_id entries, aliased as job_count.
Query the table to verify that it was created it properly.
Hint
Remember that when using the CTAS (Create Table As Select) pattern, the CREATE TABLE statement must come before the SELECT block.

*/

-- .read Lessons/1.22/1.22.2.sql
USE company_jobs;

CREATE OR REPLACE TABLE dev.company_salary_stats
AS
SELECT 
    company_id, COUNT(job_id) job_count,AVG(salary_year_avg) avg_yearly_salary
FROM 
    data_jobs_bonus.job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
GROUP BY
    company_id;

SELECT 
    *
FROM
    dev.company_salary_stats
ORDER BY
    job_count DESC;


/*
┌────────────┬───────────┬────────────────────┐
│ company_id │ job_count │ avg_yearly_salary  │
│   int32    │   int64   │       double       │
├────────────┼───────────┼────────────────────┤
│    1357420 │      2517 │ 126304.04012713548 │
│     868758 │      1299 │  93918.23210161662 │
│       1183 │      1044 │ 168723.28783524904 │
│        237 │      1041 │  184671.1191162344 │
│         36 │      1023 │  98656.41300097751 │
│    1357479 │       820 │  153907.6524390244 │
│       2420 │       692 │ 115288.61777456648 │
│    1358513 │       669 │ 152847.23840970665 │
│         47 │       655 │ 132083.20610687023 │
│       1481 │       636 │  127585.1572327044 │
│     794720 │       636 │ 113828.72877358491 │
│     320122 │       632 │ 139013.54024302808 │
│       5319 │       609 │ 195246.77175697865 │
│       1477 │       512 │ 112027.25872802734 │
│    1357863 │       486 │ 110746.55144032922 │
│       1272 │       473 │ 136723.19080338266 │
│        728 │       464 │          138003.75 │
│        838 │       448 │     153583.0546875 │
│     125813 │       444 │  107551.8018018018 │
│      24218 │       433 │ 114096.54041570438 │
│        ·   │         · │               ·    │
│        ·   │         · │               ·    │
│        ·   │         · │               ·    │
│    1107023 │         1 │           149000.0 │
│     331189 │         1 │           114000.0 │
│      35523 │         1 │            90000.0 │
│      48042 │         1 │           110000.0 │
│      47697 │         1 │            63977.0 │
│      45356 │         1 │           140000.0 │
│       7580 │         1 │           132662.0 │
│      12074 │         1 │            94895.0 │
│      72925 │         1 │           102000.0 │
│      39463 │         1 │            55000.0 │
│      22656 │         1 │            90000.0 │
│      20278 │         1 │            98301.5 │
│      13180 │         1 │            72900.0 │
│    1208873 │         1 │            72900.0 │
│     220121 │         1 │           110000.0 │
│    1205739 │         1 │            67787.0 │
│    1203775 │         1 │           110000.0 │
│    1486525 │         1 │           162000.0 │
│        818 │         1 │            75892.5 │
│     377907 │         1 │           126000.0 │
└────────────┴───────────┴────────────────────┘
  21022 rows (40 shown)             3 columns
*/