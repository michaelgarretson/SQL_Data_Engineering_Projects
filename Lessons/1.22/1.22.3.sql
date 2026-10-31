/*
*/

-- .read Lessons/1.22/1.22.3.sql

CREATE OR REPLACE VIEW
    dev.remote_jobs_view
AS
SELECT
    job_id, job_title_short, name company_name
FROM
    data_jobs_bonus.job_postings_fact j
INNER JOIN
    data_jobs_bonus.company_dim c on j.company_id = c.company_id
WHERE job_work_from_home = TRUE;

SELECT
    company_name, count(job_id) job_count
FROM 
    dev.remote_jobs_view
GROUP BY 
    company_name
ORDER BY
    job_count desc;

/*
┌─────────────────────────────────────────┬───────────┐
│              company_name               │ job_count │
│                 varchar                 │   int64   │
├─────────────────────────────────────────┼───────────┤
│ Listopro                                │      4445 │
│ Dice                                    │      3475 │
│ Upwork                                  │      2925 │
│ Get It Recruit - Information Technology │      1517 │
│ vacancy global pro                      │      1387 │
│ EPAM Systems                            │      1032 │
│ FlexBoard                               │       833 │
│ Crossover                               │       711 │
│ Mercor                                  │       649 │
│ 2.halvolink                             │       597 │
│ Harnham                                 │       594 │
│ remote zest jobs                        │       581 │
│ vmysmartpros                            │       574 │
│ Insight Global                          │       546 │
│ TELUS International AI Data Solutions   │       470 │
│ Topsiksha                               │       444 │
│ Turing                                  │       436 │
│ Robert Half                             │       395 │
│ Peroptyx                                │       361 │
│ EPAM Anywhere                           │       356 │
│      ·                                  │         · │
│      ·                                  │         · │
│      ·                                  │         · │
│ DataGorillaz                            │         1 │
│ Гудфокаст                               │         1 │
│ Seyna                                   │         1 │
│ Women in Tech UK                        │         1 │
│ StaffRex Info Solutions                 │         1 │
│ InterGen                                │         1 │
│ Gegidze                                 │         1 │
│ Science4Tech                            │         1 │
│ DigiU Pty Ltd                           │         1 │
│ IMS People                              │         1 │
│ mps - public solutions gmbh             │         1 │
│ AmpleInsight Inc                        │         1 │
│ WorkRamp                                │         1 │
│ OLIPOP PBC                              │         1 │
│ OpsArmy Careers                         │         1 │
│ SiWave Semiconductor Corporation        │         1 │
│ sterlinx global                         │         1 │
│ Staburo GmbH                            │         1 │
│ 1848 Ventures                           │         1 │
│ Lean IT Inc.                            │         1 │
└─────────────────────────────────────────┴───────────┘
  39952 rows (40 shown)                     2 columns

*/

