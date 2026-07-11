/*
=====================================================
BlueLine Logistics
Step 1: Create Staging Tables

Purpose:
Create copies of the original dataset inside a
staging schema to preserve the raw data.

Author: Blessing Chiamaka
=====================================================
*/
CREATE TABLE staging.staging_customers 
LIKE logistics_project.customers;

INSERT INTO staging.staging_customers
SELECT *
FROM logistics_project.customers;

CREATE TABLE staging.staging_delivery_events
LIKE logistics_project.delivery_events;

INSERT INTO staging.staging_delivery_events
SELECT *
FROM logistics_project.delivery_events;

CREATE TABLE staging.staging_driver_monthly_metrics
LIKE logistics_project.driver_monthly_metrics;

INSERT INTO staging.staging_driver_monthly_metrics
SELECT *
FROM logistics_project.driver_monthly_metrics;

CREATE TABLE staging.staging_drivers
LIKE logistics_project.drivers;

INSERT INTO staging.staging_drivers
SELECT *
FROM logistics_project.drivers;

CREATE TABLE staging.staging_facilities
LIKE logistics_project.facilities;

INSERT INTO staging.staging_facilities
SELECT *
FROM logistics_project.facilities;

CREATE TABLE staging.staging_fuel_purchases
LIKE logistics_project.fuel_purchases;

INSERT INTO staging.staging_fuel_purchases
SELECT *
FROM logistics_project.fuel_purchases;

CREATE TABLE staging.staging_loads
LIKE logistics_project.loads;

INSERT INTO staging.staging_loads
SELECT *
FROM logistics_project.loads;

CREATE TABLE staging.staging_maintenance_records
LIKE logistics_project.maintenance_records;

INSERT INTO staging.staging_maintenance_records
SELECT *
FROM logistics_project.maintenance_records;

CREATE TABLE staging.staging_routes
LIKE logistics_project.routes;

INSERT INTO staging.staging_routes
SELECT *
FROM logistics_project.routes;

CREATE TABLE staging.staging_safety_incidents
LIKE logistics_project.safety_incidents;

INSERT INTO staging.staging_safety_incidents
SELECT *
FROM logistics_project.safety_incidents;

CREATE TABLE staging.staging_trailers
LIKE logistics_project.trailers;

INSERT INTO staging.staging_trailers
SELECT *
FROM logistics_project.trailers;

CREATE TABLE staging.staging_trips
LIKE logistics_project.trips;

INSERT INTO staging.staging_trips
SELECT *
FROM logistics_project.trips;

CREATE TABLE staging.staging_truck_utilisation_metrics
LIKE logistics_project.truck_utilization_metrics;

INSERT INTO staging.staging_truck_utilisation_metrics
SELECT *
FROM logistics_project.truck_utilization_metrics;

CREATE TABLE staging.staging_trucks
LIKE logistics_project.trucks;

INSERT INTO staging.staging_trucks
SELECT *
FROM logistics_project.trucks;