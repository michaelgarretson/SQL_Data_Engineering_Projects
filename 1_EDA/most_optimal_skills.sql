/*
Question:  What are the most optimal skills for a database engineer - balancing demand and salary
- Create a ranking column that combines demand count and median salary to identify the most
  valuable skills
- Focus only on remote database engineer positions
- Why
    This approach highlights skills that balance market demand and financial reward. It weighs
    core skils appropriately, rather than letting rare, outlier skills distort the results

*/
select 
    skills,  Median(p.salary_year_avg ) median_salary,
    ln(count(p.salary_year_avg)) adjusted_demand_count,
    Median(p.salary_year_avg ) 
    * ln(count(p.salary_year_avg)) optimal_score
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
AND 
    salary_year_avg is not null
GROUP BY
    skills
HAVING count(p.*) >= 100
ORDER BY
     optimal_score desc
LIMIT 25
;
/*
Here's a breakdown of the most optimal skills for Data Engineers,
based on both high demand and high salaries

Top Skills by Optimal Score
- Terraform leads the list with $184000 median salary  and 193 postings
- Python and SQL dominated demand (over 1100 posting each) and respectable
  median salaries
- AWS (783 postings, 137K median salaries), Spark (503 postings, 140K median),
  Airflow (386 postings, 150K median)
- Kafka offers high compensation (145K median salary) and solid demand 
  (292 postings)

┌────────────┬───────────────┬───────────────────────┬───────────────────┐
│   skills   │ median_salary │ adjusted_demand_count │   optimal_score   │
│  varchar   │    double     │        double         │      double       │
├────────────┼───────────────┼───────────────────────┼───────────────────┤
│ terraform  │      184000.0 │     5.262690188904886 │  968334.994758499 │
│ python     │      135000.0 │    7.0326242610280065 │ 949404.2752387809 │
│ aws        │   137320.3125 │     6.663132695990803 │ 914983.4640424246 │
│ sql        │      130000.0 │     7.028201432058005 │ 913666.1861675406 │
│ airflow    │      150000.0 │     5.955837369464831 │ 893375.6054197246 │
│ spark      │      140000.0 │     6.220590170099739 │ 870882.6238139635 │
│ snowflake  │      135500.0 │     6.082218910376446 │ 824140.6623560084 │
│ kafka      │      145000.0 │     5.676753802268282 │ 823129.3013289009 │
│ azure      │      128000.0 │     6.163314804034641 │ 788904.2949164341 │
│ java       │      135000.0 │     5.713732805509369 │ 771353.9287437648 │
│ scala      │ 137290.484375 │    5.5093883366279774 │ 756386.5933456306 │
│ kubernetes │      150500.0 │     4.990432586778736 │ 751060.1043101997 │
│ git        │      140000.0 │     5.337538079701318 │ 747255.3311581844 │
│ databricks │      132750.0 │     5.583496308781699 │ 741209.1349907706 │
│ redshift   │      130000.0 │    5.6131281063880705 │ 729706.6538304492 │
│ gcp        │      136000.0 │     5.278114659230517 │ 717823.5936553503 │
│ hadoop     │      135000.0 │     5.288267030694535 │ 713916.0491437622 │
│ nosql      │      134415.0 │     5.262690188904886 │ 707384.5017416502 │
│ pyspark    │      140000.0 │    5.0238805208462765 │ 703343.2729184787 │
│ docker     │      135000.0 │     4.969813299576001 │ 670924.7954427601 │
│ mongodb    │      135750.0 │     4.912654885736052 │ 666892.9007386691 │
│ go         │      140000.0 │     4.727387818712341 │ 661834.2946197278 │
│ r          │      134775.0 │     4.890349128221754 │ 659096.8037560869 │
│ github     │      135000.0 │     4.844187086458591 │ 653965.2566719098 │
│ bigquery   │      135000.0 │     4.812184355372417 │ 649644.8879752763 │
└────────────┴───────────────┴───────────────────────┴───────────────────┘
  25 rows                                                      4 columns

*/