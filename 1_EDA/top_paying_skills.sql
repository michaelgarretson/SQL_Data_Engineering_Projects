/*
Question:  What are the highest paying skills for data engineers
- Calculate the median salary for each skill required in data engineer position
- Focus on remote job positions with specified salaries
- Include skill frequency to identify both salary and demand
Why?
    - Helps identify which skills command the highest compensation while also showing how common those skills are
    - Median is used instead of average to reduce the impact of outlier salaries
*/
select 
    skills, count(p.job_id) frequency, Median(p.salary_year_avg ) median_annual_salary
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
HAVING frequency >= 100
ORDER BY
     median_annual_salary  desc
LIMIT 25
;

/*
Key takeaways:
- RUST and Sheets are the two most highly compensated
- The Solidity programming language is in the top ten
- Terraform
- Golang
- Next.js the Javascript web framework for building dynamic websites is next on the list 
- The following skills round out the top 10 highest compensated data skills
    - ggplot2 
    - Spring
    - Haskell programming language
    - Ocaml

┌───────────┬───────────┬───────────────────────┐
│  skills   │ frequency │ average_annual_salary │
│  varchar  │   int64   │        double         │
├───────────┼───────────┼───────────────────────┤
│ rust      │       232 │              210000.0 │
│ sheets    │        98 │              196697.5 │
│ solidity  │        45 │              192500.0 │
│ terraform │      3248 │              184000.0 │
│ golang    │       912 │              184000.0 │
│ next.js   │        19 │              180000.0 │
│ ggplot2   │        15 │              176250.0 │
│ spring    │       364 │              175500.0 │
│ haskell   │        17 │              172500.0 │
│ ocaml     │         1 │              172500.0 │
└───────────┴───────────┴───────────────────────┘
  10 rows                             3 columns

*/