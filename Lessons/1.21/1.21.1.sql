/*
Task

Create a SQL file in the Lesson folder named 1.21.1.sql.

Write a SQL command to create a new persistent database 
named sql_problems, ensuring the command does not fail if 
the database already exists.

Write a command to list all currently attached databases to 
verify that sql_problems has been successfully created and attached.

Hint
Use the IF NOT EXISTS clause in your creation statement to handle re-runs gracefully.
DuckDB uses specific "dot commands" (commands starting with a period .) for environment inspection, such as listing databases.
*/
CREATE DATABASE IF NOT EXISTS sql_problems;

SELECT * 
FROM
    md_information_schema.databases;

/*
┌─────────────────┬─────────────────────────┬───┬──────────────────────┬─────────┐
│      name       │          uuid           │ … │ historical_snapshot… │  type   │
│     varchar     │          uuid           │ … │       interval       │ varchar │
├─────────────────┼─────────────────────────┼───┼──────────────────────┼─────────┤
│ data_jobs_bonus │ e030d860-df99-40ea-aa9… │ … │ 00:00:00             │ DEFAULT │
│ jobs_mart       │ 1776d113-73cc-4971-a8e… │ … │ 00:00:00             │ DEFAULT │
│ sql_problems    │ 9f187f67-990a-48dd-aae… │ … │ 00:00:00             │ DEFAULT │
└─────────────────┴─────────────────────────┴───┴──────────────────────┴─────────┘
  3 rows           use .last to show entire result           6 columns (4 shown)
*/