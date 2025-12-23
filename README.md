# Healthcare ETL Pipeline using PySpark

This project implements an end-to-end **healthcare data lake and ETL pipeline** using **PySpark**, following a layered architecture (Raw → Silver → Gold) to transform raw patient data into analytics-ready datasets.

## Tech Stack
- Python
- PySpark (Apache Spark)
- Parquet
- SQL
- Google Colab (development)

## Dataset
Hospital Readmission Prediction (Synthetic Dataset) – Kaggle  
~30,000 patient records with demographic and clinical features.

> Raw CSV files and generated Parquet outputs are intentionally excluded from this repository.

## Pipeline Overview
### 1. Data Ingestion (Raw Layer)
- Load raw healthcare CSV data using PySpark
- Validate schema and record counts

### 2. Data Transformation (Silver Layer)
- Clean and standardize columns
- Parse blood pressure into systolic/diastolic values
- Convert categorical flags (Yes/No → 1/0)
- Apply data quality rules
- Store data as partitioned Parquet

### 3. Analytics (Gold Layer)
- Create aggregated analytics tables:
  - Readmission rate by age group
  - Readmission rate by discharge destination
- Prepare datasets for BI and reporting use cases

