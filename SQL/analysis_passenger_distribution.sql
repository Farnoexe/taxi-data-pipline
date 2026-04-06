SELECT
    passengers,
    COUNT(*) AS trip_count,
    ROUND(AVG(fare), 2) AS avg_fare
FROM taxi_clean_data
GROUP BY passengers
ORDER BY passengers;
