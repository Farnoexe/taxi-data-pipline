-- =========================================================
-- DATA QUALITY CHECKS
-- Project: Taxi Data Analytics Pipeline (AWS)
-- Tables:
--   Raw  = taxi_raw_data
--   Clean = taxi_clean_data
-- =========================================================


-- =========================================================
-- 1. RAW TABLE ROW COUNT
-- =========================================================
SELECT COUNT(*) AS total_raw_rows
FROM taxi_raw_data;


-- =========================================================
-- 2. CLEAN TABLE ROW COUNT
-- =========================================================
SELECT COUNT(*) AS total_clean_rows
FROM taxi_clean_data;


-- =========================================================
-- 3. INVALID PASSENGER ROWS IN RAW TABLE
--    Business rule: passengers = 0 is invalid
-- =========================================================
SELECT COUNT(*) AS invalid_passenger_rows_raw
FROM taxi_raw_data
WHERE passengers = 0;


-- =========================================================
-- 4. INVALID PASSENGER ROWS IN CLEAN TABLE
--    Should be 0 after cleaning
-- =========================================================
SELECT COUNT(*) AS invalid_passenger_rows_clean
FROM taxi_clean_data
WHERE passengers = 0;


-- =========================================================
-- 5. NEGATIVE OR ZERO FARE ROWS IN RAW TABLE
-- =========================================================
SELECT COUNT(*) AS non_positive_fare_rows_raw
FROM taxi_raw_data
WHERE fare <= 0;


-- =========================================================
-- 6. NEGATIVE OR ZERO DISTANCE ROWS IN RAW TABLE
--    Zero-distance rows were retained as possible real-world edge cases
-- =========================================================
SELECT COUNT(*) AS non_positive_distance_rows_raw
FROM taxi_raw_data
WHERE distance <= 0;


-- =========================================================
-- 7. NULL FARE ROWS IN RAW TABLE
-- =========================================================
SELECT COUNT(*) AS null_fare_rows_raw
FROM taxi_raw_data
WHERE fare IS NULL;


-- =========================================================
-- 8. NULL DISTANCE ROWS IN RAW TABLE
-- =========================================================
SELECT COUNT(*) AS null_distance_rows_raw
FROM taxi_raw_data
WHERE distance IS NULL;


-- =========================================================
-- 9. NULL OR EMPTY PAYMENT VALUES IN RAW TABLE
-- =========================================================
SELECT COUNT(*) AS invalid_payment_rows_raw
FROM taxi_raw_data
WHERE payment IS NULL
   OR TRIM(payment) = '';


-- =========================================================
-- 10. NULL OR EMPTY PAYMENT VALUES IN CLEAN TABLE
--     Retained because payment was not used as a filtering rule
-- =========================================================
SELECT COUNT(*) AS invalid_payment_rows_clean
FROM taxi_clean_data
WHERE payment IS NULL
   OR TRIM(payment) = '';


-- =========================================================
-- 11. DISTINCT PAYMENT VALUES IN RAW TABLE
--     Used to confirm payment contains expected categories
-- =========================================================
SELECT DISTINCT payment
FROM taxi_raw_data
ORDER BY payment;
