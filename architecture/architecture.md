# Healthcare ETL Architecture

This project implements an end-to-end healthcare data lake and ETL pipeline using a layered architecture.

## Raw Layer
- Ingest raw healthcare CSV data using PySpark
- Perform basic validation such as schema inspection and record counts
- Represents the landing zone of the data lake

## Silver Layer
- Clean and standardize clinical and demographic features
- Parse blood pressure into systolic and diastolic values
- Convert categorical flags (Yes/No) into numeric indicators (1/0)
- Apply data quality rules and type casting
- Store cleaned data as partitioned Parquet files for efficient querying

## Gold Layer
- Generate analytics-ready aggregated datasets
- Metrics include hospital readmission rates by:
  - Age group
  - Discharge destination
- Optimized for BI dashboards, reporting, and downstream analytics use cases

