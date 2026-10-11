/*
List all Data Engineer job postings in the United States that offer health 
insurance from the data_jobs database, and include all available associated skills 
for each job, even if a job has no skills listed.

Task

Create a SQL file in the Lesson folder (e.g., 1.11.2.sql)
Write a query that connects job_postings_fact to skills_job_dim and skills_dim to associate each job with its skills
Select, in order:
job_id (from job_postings_fact)
job_title (from job_postings_fact)
skills (from skills_dim)
job_country (from job_postings_fact)
Filter the results for:
Data Engineer jobs (use job_title_short)
Country of United States
Include health insurance benefits
Order the final result set from highest to lowest based on job_id

*/
SELECT
    p.job_id,p.job_title,skills,job_country
FROM
    job_postings_fact p
LEFT OUTER JOIN
    skills_job_dim sj ON p.job_id = sj.job_id
LEFT OUTER JOIN 
    skills_dim s on sj.skill_id = s.skill_id
WHERE
    p.job_title_short = 'Data Engineer'
AND
    p.job_country = 'United States'
ORDER BY
    job_id DESC
;

    
    