/*
Identify average annualized salaries for US jobs, grouped by job_title_short, 
and format them in two ways: precise currency and rounded whole numbers.

Task

Create a SQL file in the Lesson folder (e.g., 1.20.3.sql).
Select the job_title_short.
Calculate the annualized salary by multiplying the average salary_hour_avg 
by 40 (hours per week) and 52 (weeks per year).
Column 1 (Currency Precision): Cast this calculated average to a data type 
that allows for specific precision, ensuring exactly 2 decimal places. Alias 
this as salary_hour_annual.
Column 2 (Whole Number): Cast the same calculated average to a data type 
that has 0 decimal places. Alias this as salary_hour_annual_zero_decimals.
Filter the data to include only records from the 'United States' where the 
salary_hour_avg is not empty (NOT NULL).
Group the results by job_title_short and order them by the currency precision
 column in descending order.

Hint
To change a value's data type, use the casting operator :: followed by the type name.
Think about which data type is best for fixed-point numbers (like currency) versus which type represents whole numbers.
For the currency column, you will need to specify the precision and scale (e.g., TYPE(total_digits, decimal_digits)).

*/

SELECT 
    job_title_short,
    AVG(salary_hour_avg * 40 * 52)::DECIMAL(12,2) salary_hour_annual,
    AVG(salary_hour_avg * 40 * 52)::INT salary_hour_annual_zero_decimals   
FROM
    job_postings_fact
WHERE job_country = 'United States' and salary_hour_avg is NOT NULL
GROUP BY
    job_title_short
ORDER BY
    salary_hour_annual DESC
;

/*
┌───────────────────────────┬────────────────────┬──────────────────────────────────┐
│      job_title_short      │ salary_hour_annual │ salary_hour_annual_zero_decimals │
│          varchar          │   decimal(12,2)    │              int32               │
├───────────────────────────┼────────────────────┼──────────────────────────────────┤
│ Senior Data Engineer      │          131227.33 │                           131227 │
│ Data Engineer             │          122708.30 │                           122708 │
│ Machine Learning Engineer │          121947.36 │                           121947 │
│ Software Engineer         │          119390.31 │                           119390 │
│ Cloud Engineer            │          117792.97 │                           117793 │
│ Senior Data Scientist     │          113832.61 │                           113833 │
│ Senior Data Analyst       │          107618.05 │                           107618 │
│ Data Scientist            │          106733.82 │                           106734 │
│ Business Analyst          │           98628.89 │                            98629 │
│ Data Analyst              │           81332.13 │                            81332 │
└───────────────────────────┴────────────────────┴──────────────────────────────────┘
  10 rows                                                                 3 columns
*/