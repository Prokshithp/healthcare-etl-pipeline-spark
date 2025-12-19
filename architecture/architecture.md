# Architecture (Raw → Silver → Gold)

## Goal
Build an end-to-end healthcare ETL pipeline that transforms raw patient readmission data into analytics-ready tables for reporting and BI use cases.

## Layers

### 1) Raw Layer (Ingestion)
- Source: Kaggle “Hospital Readmission Prediction (Synthetic Dataset)”
- Format: CSV
- Actions:
  - Read CSV into Spark DataFrame
  - Basic validation: schema + record count
  - Minimal/no transformations (keep as close to source as possible)

### 2) Silver Layer (Cleansed + Standardized)
- Format: Parquet
- Actions:
  - Clean column names and trim string fields
  - Parse blood pressure into `systolic_bp` and `diastolic_bp`
  - Convert categorical flags (e.g., Yes/No) to numeric (1/0)
  - Cast numeric columns to proper types
  - Drop rows with missing critical fields (basic data quality rule)
- Storage:
  - Write Parquet partitioned by `discharge_destination` for faster downstream queries

### 3) Gold Layer (Analytics / Aggregates)
- Format: Parquet
- Actions:
  - Create business-friendly aggregate tables such as:
    - Readmission rate by age group
    - Readmission rate by discharge destination
  - These tables are designed for dashboards, SQL queries, and KPI reporting

## How to Run (Local/Colab)
1. Run `01_data_ingestion.ipynb` (Raw)
2. Run `02_data_transformation_silver.ipynb` (Silver + Gold)

## Notes
- Raw CSV and generated Parquet outputs are not stored in GitHub to keep the repo lightweight.
- The pipeline follows a common lakehouse pattern used in production ETL (Raw/Bronze → Silver → Gold).
