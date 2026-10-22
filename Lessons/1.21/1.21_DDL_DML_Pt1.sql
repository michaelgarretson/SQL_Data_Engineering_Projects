-- .read Lessons/1.21/1.21_DDL_DML_Pt1.sql
--USE main;
USE data_jobs;

DROP DATABASE jobs_mart;
CREATE DATABASE IF NOT EXISTS jobs_mart;

USE jobs_mart;

CREATE SCHEMA jobs_mart.bronze;
CREATE SCHEMA jobs_mart.silver;
CREATE SCHEMA jobs_mart.gold;

--select * from INFORMATION_SCHEMA.schemata;
--SELECT TABLE_NAME, TABLE_CATALOG, TABLE_SCHEMA FROM information_schema.tables 
--WHERE TABLE_NAME='preferred_roles';
--SHOW DATABASES;

--DROP TABLE main.preferred_roles;

CREATE TABLE IF NOT EXISTS bronze.preferred_roles(
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

INSERT INTO bronze.preferred_roles
    (role_id, role_name)
VALUES
    (1,'Data Engineer'),
    (2,'Senior Data Engineer'),
    (3,'Software Engineer');

ALTER TABLE 
    bronze.preferred_roles
ADD COLUMN 
    preferred_role BOOLEAN;

UPDATE 
    bronze.preferred_roles
SET
    preferred_role = TRUE
WHERE role_id in (1,2);

UPDATE 
    bronze.preferred_roles
SET
    preferred_role = FALSE
WHERE role_id = 3;

SELECT * FROM bronze.preferred_roles;

ALTER TABLE 
    bronze.preferred_roles
RENAME TO
    priority_roles;

ALTER TABLE
    bronze.priority_roles
RENAME COLUMN preferred_role
TO is_priority;

ALTER TABLE bronze.priority_roles
ADD COLUMN priority_level INTEGER;

UPDATE bronze.priority_roles 
SET 
    priority_level = 1
WHERE 
    role_id in (1,2);

UPDATE bronze.priority_roles 
SET 
    priority_level = 2
WHERE 
    role_id =3;

ALTER TABLE 
    bronze.priority_roles
DROP COLUMN
    is_priority;





