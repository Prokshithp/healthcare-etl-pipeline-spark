-- Gold Analytics Queries
-- These queries demonstrate how analytics teams consume
-- the output of the healthcare ETL pipeline.

-- ---------------------------------------------------
-- Readmission rate by discharge destination
-- ---------------------------------------------------
SELECT
    discharge_destination,
    COUNT(*) AS total_patients,
    AVG(readmitted_30_days) AS readmission_rate
FROM silver_patient_records
GROUP BY discharge_destination
ORDER BY readmission_rate DESC;

-- ---------------------------------------------------
-- Readmission rate by age group
-- ---------------------------------------------------
SELECT
    CASE
        WHEN age < 30 THEN '<30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        WHEN age BETWEEN 51 AND 70 THEN '51-70'
        ELSE '70+'
    END AS age_group,
    COUNT(*) AS total_patients,
    AVG(readmitted_30_days) AS readmission_rate
FROM silver_patient_records
GROUP BY age_group
ORDER BY readmission_rate DESC;

