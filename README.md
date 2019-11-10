# Data Engineering Exercise for QuickFrame (dee_qf)

## Environment
* Mac
* Python 3.7.5
    * Anaconda
* SQLite

## How I got started
* Downloaded DataEngineerDataSet.csv from GDoc
* Note: if you ever need to normalize all column names, run ```python Fix_column_names.py``` (makes querying easier)

## Set-up
* Run SQL from migration.sql on database
** it creates the table and imports data with a "drop if exists"

## Problem 1
* Task:  Exclude rows in data set where 'object_number' data type is of the format <number>.<number>.<number>.
* File: Prob1_DataCleaning.sql	
* Recap of solution:
** Split values in 'object_number' column into 3 separate columns based on delimiter '.' (period)
** Keep only rows where all 3 parts of object_number are valid integers (i.e., a) text includes only numbers 0-9, b) is not null, c) numeric text does not start with '0')

## Problem 3 - Tracking Running Totals
* Task: Create table classification_totals that contains the count of attributes for each distinct classification type
* File: Prob3_ClassTotals.sql
* Recap of solution:
** Create new table with one row per distinct value from column 'Classification'
