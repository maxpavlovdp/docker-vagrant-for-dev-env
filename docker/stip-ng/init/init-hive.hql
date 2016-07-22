CREATE DATABASE IF NOT EXISTS hr;

USE hr;
DROP TABLE IF EXISTS full_master_file;
CREATE EXTERNAL TABLE full_master_file
(
    timestamp int,
    employee_id string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '~'
STORED AS TEXTFILE
LOCATION '/HRPayroll/workday/MasterFile/Full_Master_File/ASCII';
