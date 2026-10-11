/*
Measure how frequently each skill appears in “Data” roles in the data_jobs database, starting from the skills lookup table

Task

Create a SQL file in the Lesson folder (e.g., 1.11.6.sql)
Write a query that starts from skills_dim and connects skills to job postings 
through the appropriate mapping table so each job can contribute one or more skills
Select, in order
skill_id
skills
a count of job postings as job_count
Filter the results so that only rows where job_title_short contains the word 'Data' 
are included
Group the results so that each skill appears once with its total job count
Order the final result set by job_count from highest to lowest
*/
SELECT 
    s.skill_id, skills, COUNT(p.job_id) job_count
FROM
    skills_dim s 
RIGHT JOIN
    skills_job_dim sj on s.skill_id = sj.skill_id
RIGHT JOIN 
    job_postings_fact p on sj.job_id = p.job_id
WHERE
    job_title_short like '%Data%'
GROUP BY
    s.skill_id, skills
ORDER BY
    job_count DESC
;