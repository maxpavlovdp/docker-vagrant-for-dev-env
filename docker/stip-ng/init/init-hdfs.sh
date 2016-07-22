#!/usr/bin/env bash

hadoop fs -mkdir -p /HRPayroll/workday/exFinalSalaryScheme
hadoop fs -mkdir -p /HRPayroll/workday/MasterFile/Full_Master_File/ASCII
hadoop fs -mkdir -p /HRPayroll/workday/MasterFile/Full_Master_File/NON-ASCII
hadoop fs -mkdir -p /HRPayroll/workday/MasterFile/Full_Future_File/ASCII
hadoop fs -mkdir -p /HRPayroll/workday/MasterFile/Full_Master_Reference_File
hadoop fs -put /mnt/stip-ng/data/payroll-example.csv /HRPayroll/workday/MasterFile/Full_Master_File/ASCII
