/*
Identify the most frequently required skills for job postings in the data_jobs database that offer a yearly salary greater than $100,000.

Task

Create a SQL file in the Lesson folder (e.g., 1.11.5.sql)
Write a query that combines job_postings_fact with skills_job_dim and skills_dim 
to associate high-paying jobs with their specific skills
Select, in order:
job_title_short
skills
a count of job postings (aliased as job_count)
Filter the results so that the yearly salary (salary_year_avg) is greater 
than 100000
Group the results by job_title_short and skills so the count summarizes each unique 
skill combination
Order the final result set by the job_count from highest to lowest

*/
SELECT
    job_title_short, skills, COUNT(p.job_id) job_count
FROM 
    job_postings_fact p
INNER JOIN 
    skills_job_dim js on p.job_id = js.job_id
INNER JOIN 
    skills_dim s on js.skill_id = s.skill_id
WHERE 
    salary_year_avg > 100000
GROUP BY
    job_title_short, skills
ORDER BY  
    job_count DESC
;
