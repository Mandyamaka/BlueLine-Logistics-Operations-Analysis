/*
=====================================================
Step 2: Data Cleaning

Purpose:
Identify and remove duplicate delivery events.
=====================================================
*/

SELECT event_id, COUNT(*) AS count
FROM staging_delivery_events
GROUP BY event_id
HAVING COUNT(*) > 1;

DELETE FROM staging_delivery_events
WHERE event_id IN (
    SELECT event_id FROM (
        SELECT event_id,
               ROW_NUMBER() OVER (
                    PARTITION BY event_id,
                                 load_id,
                                 trip_id,
                                 event_type,
                                 facility_id,
                                 scheduled_datetime,
                                 actual_datetime
                    ORDER BY event_id
               ) AS row_num
        FROM staging_delivery_events
    ) ranked
    WHERE row_num > 1
);