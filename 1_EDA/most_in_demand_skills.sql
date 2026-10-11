/*
Question:  What are the most in-demand skills for data engineers
- Identify the top 10 skills for data engineers
- Focus on remote job postings
*/
select 
    skills, count(p.job_id) skills_count
FROM
    job_postings_fact p
INNER JOIN
    skills_job_dim js on p.job_id = js.job_id
INNER JOIN 
    skills_dim s on js.skill_id = s.skill_id
WHERE
    job_title_short = 'Data Engineer'
AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    skills_count desc
LIMIT 10
;

/*
Key taketakeaways:
- SQL and Python are, by far, the two most in demand skills for database engineers
- Cloud platform knowledge, primarily AWS and Azure, are critical for database engineers
- Big data tools like Spark are also valued by companies
- Data pipeline tools like Airflow, Snowflake, and Datbricks are also important skills
- Java and GCP round out the top 10
┌────────────┬──────────────┐
│   skills   │ skills_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns

*/