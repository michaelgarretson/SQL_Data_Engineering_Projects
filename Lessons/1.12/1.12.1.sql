EXPLAIN select c.name company_name, count(job_id) posting_count
FROM
    company_dim c
INNER JOIN
    job_postings_fact jp on c.company_id = jp.company_id
WHERE job_country = 'United States'
GROUP BY 
    c.name
HAVING COUNT(job_id) > 3000
ORDER BY COUNT(job_id) DESC
LIMIT 10
;
