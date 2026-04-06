SELECT
    ROUND(AVG(fare), 2) AS avg_fare,
    ROUND(AVG(distance), 2) AS avg_distance
FROM taxi_clean_data;
