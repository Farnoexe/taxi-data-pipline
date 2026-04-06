CREATE EXTERNAL TABLE taxi_raw_data (
    pickup STRING,
    dropoff STRING,
    passengers INT,
    distance DOUBLE,
    fare DOUBLE,
    tip DOUBLE,
    tolls DOUBLE,
    total DOUBLE,
    color STRING,
    payment STRING,
    pickup_zone STRING,
    dropoff_zone STRING,
    pickup_borough STRING,
    dropoff_borough STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\""
)
LOCATION 's3://metroville-traffic-analytics/taxi-data-raw/'
TBLPROPERTIES ("skip.header.line.count"="1");
