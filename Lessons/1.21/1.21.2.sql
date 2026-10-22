/*
Task

Create a SQL file in the Lesson folder named 1.21.2.sql.
Write a command to delete the database named sql_problems to 
clean up the workspace.
Execute the specific DuckDB command to list all currently 
available databases to verify the current state.
Create a new database named company_jobs, ensuring the command 
does not fail if the database already exists.
Switch the active session context to the new company_jobs 
database.
List the databases and verify company_jobs was created.
Hint
Remember that .databases is a specific command used to view attached databases.
Use the IF NOT EXISTS clause when creating the database to make your script re-runnable without errors.
*/

DROP DATABASE sql_problems;

.databases

CREATE DATABASE IF NOT EXISTS company_jobs;

.databases


/*
│ md_information_schema        (memory)                                          │
│ sample_data                  _share/sample_data/23b0d623-1361-421d-ae77-62d70… │
│ data_jobs_bonus              data_jobs_bonus                                   │
│ data_jobs                    _share/data_jobs/87603155-cdc7-4c80-85ad-3a6b0d7… │
│ _duckdb_ui                   /users/mrgarretson/.duckdb/extension_data/ui/ui.… │
│ localmemdb                   (memory)                                          │
│ mem_db_for_profiling_queries (memory)                                          │
│ md_results                   (memory)                                          │
│ jobs_mart                    jobs_mart                                         │
│ company_jobs                 company_jobs
*/