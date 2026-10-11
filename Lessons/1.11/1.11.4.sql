/*
Determine the frequency of each skill mentioned across all job postings where the job title contains the word "Data" in the data_jobs database.

Task

Create a SQL file in the Lesson folder (e.g., 1.11.4.sql)
Write a query that connects job_postings_fact to skills_job_dim and then to 
skills_dim to associate job postings with their skills
Select, in order
job_title_short
skill_id
skills
a count of job postings (aliased as job_count)
Filter the results so that the job_title_short contains the word 'Data'
Group the results by the short job title, skill ID, and skill name so the count 
summarizes each unique skill combination
Order the final result set by the job count from highest to lowest
*/
SELECT
    job_title_short, s.skill_id, skills,
    COUNT(p.job_id) job_count
FROM 
    job_postings_fact p
LEFT JOIN
    skills_job_dim  sj on p.job_id = sj.job_id
LEFT JOIN
    skills_dim s on sj.skill_id = s.skill_id
WHERE 
    job_title_short like '%Data%'
    --job_title_short = 'Data Engineer'
GROUP BY 
    job_title_short, s.skill_id, skills
ORDER BY
    job_count desc
;