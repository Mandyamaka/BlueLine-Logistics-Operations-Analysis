/*
=====================================================
Step 4: Business Analysis
=====================================================
*/
-- REVENUE & CUSTOMER ANALYSIS

-- Total Revenue
SELECT ROUND(SUM(revenue),2)
FROM staging_loads;

-- Top Customers
SELECT c.customer_name,
ROUND(SUM(l.revenue),2) revenue
FROM staging_loads l
JOIN staging_customers c
ON l.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

-- Best Routes
SELECT r.origin_city, r.destination_city,
ROUND(SUM(l.revenue),2) revenue
FROM staging_loads l
JOIN staging_routes r
ON l.route_id = r.route_id
GROUP BY r.origin_city, r.destination_city
ORDER BY revenue DESC;
/*
=====================================================
Fleet & Fuel Analysis
=====================================================
*/
-- Total Fuel Spend
SELECT ROUND(SUM(total_cost),2) AS total_cost
FROM staging_fuel_purchases;

-- Fuel spend by State
SELECT location_state,
ROUND(SUM(total_cost),2) AS fuel_expenditure
FROM staging_fuel_purchases
GROUP BY location_state;

-- Most expensive Fuel Purchase
SELECT *
FROM staging_fuel_purchases
ORDER BY total_cost DESC;

-- MAINTENANCE ANALYSIS

-- Trucks Maintenance cost
SELECT truck_id,
ROUND(SUM(total_cost),2) maintenance_cost
FROM staging_maintenance_records
GROUP BY truck_id
ORDER BY maintenance_cost DESC;

-- Downtime Analysis
SELECT truck_id,
ROUND(SUM(downtime_hours),2) AS downtime
FROM staging_maintenance_records
GROUP BY truck_id;
/*
=====================================================
Driver Analysis
=====================================================
*/
-- Driver count Overview
SELECT COUNT(*) AS total_drivers
FROM staging_drivers;

-- Experience Distribution
SELECT years_experience,
COUNT(*) AS drivers
FROM staging_drivers
GROUP BY years_experience
ORDER BY years_experience;

-- Drivers with most trips
SELECT driver_id,
COUNT(*) AS total_trips
FROM staging_trips
GROUP BY driver_id
ORDER BY total_trips DESC;

-- Safety risk per driver
SELECT driver_id,
COUNT(*) AS incidents,
ROUND(SUM(claim_amount),2) AS total_claims
FROM staging_safety_incidents
GROUP BY driver_id
ORDER BY total_claims DESC;

-- Fuel usage by driver
SELECT
driver_id,
ROUND(SUM(total_cost),2) AS fuel_cost
FROM staging_fuel_purchases
WHERE driver_id IS NOT NULL
GROUP BY driver_id
ORDER BY fuel_cost DESC;

-- DRIVER PERFORMANCE METRICS
SELECT DISTINCT driver_id
FROM staging_driver_monthly_metrics;

-- Performance Summary
SELECT driver_id,
ROUND(AVG(on_time_delivery_rate),2) AS avg_on_time,
ROUND(SUM(total_revenue),2) AS revenue,
SUM(trips_completed) AS trips
FROM staging_driver_monthly_metrics
GROUP BY driver_id;

-- Trend
SELECT driver_id, month, trips_completed, total_revenue, on_time_delivery_rate
FROM staging_driver_monthly_metrics
ORDER BY driver_id, month;
/*
=====================================================
Safety Analysis
=====================================================
*/
-- Incident types
SELECT incident_type,
COUNT(*) AS count
FROM staging_safety_incidents
GROUP BY incident_type
ORDER BY count DESC;

-- Driver incidents
SELECT driver_id,
COUNT(*) incidents
FROM staging_safety_incidents
GROUP BY driver_id
ORDER BY incidents DESC;