/*
=====================================================
Step 3: Data Validation

Purpose:
Validate data quality before analysis.
=====================================================
*/

-- Check Truck Status

SELECT DISTINCT status
FROM staging_trucks;

-- Check Load Date Range

SELECT
MIN(load_date) AS loads_min_date,
MAX(load_date) AS loads_max_date
FROM staging_loads;

-- Check Fuel Purchase Date Range

SELECT
MIN(purchase_date) AS fuel_min_date,
MAX(purchase_date) AS fuel_max_date
FROM staging_fuel_purchases;

-- Check Trip Date Range

SELECT
MIN(dispatch_date),
MAX(dispatch_date)
FROM staging_trips;