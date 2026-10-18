/*
Compare salary and theoretical commute savings for US-based "Data" jobs. You will group the analysis by Job Title and Work-From-Home (WFH) status to see how these factors impact the average annual salary and a calculated "adjusted" salary.

Task

Create a SQL file in the Lesson folder (e.g., 1.20.5.sql).
Select job_title_short and job_work_from_home.
Calculate the standard average annual salary (AVG(salary_year_avg)) cast to 
an Integer.
Alias this as annual_salary_avg.
Calculate a custom column aliased as annual_commute_cost_savings:
Assume a theoretical "commute saving" of 260 hours multiplied by the hourly 
rate (derived by dividing annual salary by 2080).
Challenge: Ensure this calculation is only applied to jobs where 
job_work_from_home is True (returning 0 for non-WFH jobs). Use the boolean 
column directly in your math to achieve this.
Cast the final average of this calculation to an Integer for readability.
Calculate an adjusted_annual_salary_avg by adding the standard average salary and the commute savings together.
Cast the final value of this calculation to an Integer for readability.
Filter for jobs in the 'United States' where the title contains the text 'Data' (case-sensitive).
Group by job_title_short and job_work_from_home.
Order by job_title_short Descending and job_work_from_home Ascending.
Hint
Note: This is a simplified proxy for practicing data types and is not a real-world economic analysis.
To conditionally apply math based on a Boolean column, cast the boolean to an integer: column::INT. This converts True to 1 and False to 0.
If you multiply your calculated value by this converted boolean (e.g., value * boolean::INT), the result will remain the same for WFH jobs (x 1) and become zero for others (x 0).

*/
SELECT
    job_title_short, job_work_from_home,  
    AVG(salary_year_avg)::INT annual_salary_avg,
    AVG((job_work_from_home::INT*salary_year_avg/2080)*260)::INT annual_commute_cost_savings,
    (annual_salary_avg + annual_commute_cost_savings)  adjusted_annual_salary_avg
    /*,
    AVG(job_work_from_home::INT*salary_year_avg*260/2080)::INT annual_commute_cost_savings,
    annual_salary_avg+annual_commute_cost_savings adjusted_annual_salary_avg
    */
    --(AVG(CASE when job_work_from_home = true then salary_year_avg else 0 end)*260/2080)::INT annual_commute_cost_savings,
    --AVG(salary_year_avg) + (AVG(CASE when job_work_from_home = true then salary_year_avg else 0 end)*260/2080) adjusted_annual_salary_avg
FROM
    job_postings_fact jpf
WHERE
    jpf.job_country = 'United States'
AND 
    jpf.job_title_short LIKE '%Data%'
GROUP BY
    job_title_short, job_work_from_home
ORDER BY
    job_title_short DESC, job_work_from_home ASC
;

SELECT
    job_title_short, salary_year_avg
FROM
    job_postings_fact jpf
WHERE
    jpf.job_country = 'United States'
AND 
    jpf.job_title_short LIKE '%Data%'
AND
    salary_year_avg > 500000
;

select max(salary_year_avg)
from job_postings_fact
where job_title_short='Senior Data Scientist';