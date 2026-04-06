# 🚕 Taxi Data Analytics Pipeline (AWS)

## 📌 Overview
This project replicates a real-world data workflow using Amazon S3 and Athena, where raw taxi trip data is ingested, validated, cleaned, and analyzed to generate insights.

## 🎯 Project Goal
Understand trip patterns and revenue drivers to inform pricing strategies and operational decisions.

---

## 🏗️ Architecture
![Architecture](Images/architecture.png)

Note: The S3 bucket name 'metroville-traffic-analytics' is reused across multiple projects in this portfolio for consistency and to simulate a shared data lake environment. Each project is isolated using distinct folder paths.

---

## ☁️ Why AWS?
Amazon S3 and Athena were used to simulate a scalable, serverless analytics pipeline.  
This setup allows querying large datasets efficiently without managing infrastructure, similar to real-world data platforms.

---

## 🔍 Data Investigation & Issues

Initial exploration revealed several important data issues:

- The dataset schema was initially misinterpreted (incorrect column mapping)
- Raw and cleaned data were stored in the same S3 prefix, causing query failures
- 96 rows contained invalid values (`passengers = 0`)
- 51 rows had zero distance values
- 44 rows contained missing payment values

---

## 🛠️ Key Fixes Applied

- Corrected the full 14-column schema in Athena
- Separated raw and clean data into different S3 prefixes
- Removed invalid passenger rows (`passengers = 0`)
- Retained zero-distance trips as realistic edge cases
- Retained null payment values (not critical for analysis)

---

## 🧹 Clean Data Preview
![Clean Data](Images/clean_preview.png)

---

## 📊 Analysis & Insights

### 1. Overall Metrics
![Overall Metrics](Images/avg_metrics.png)

**Insight:**  
The average fare is **$13.10** and the average trip distance is **3.03 miles**, indicating that most rides are short, urban trips typical of dense city environments.

👉 This suggests pricing strategies should prioritize high-frequency short trips rather than relying on long-distance demand.

---

### 2. Trip Distance Analysis
![Trip Distance](Images/trip_type_analysis.png)

**Insight:**  
Short trips account for ~58% of total rides, showing that demand is heavily concentrated in local travel.

However, long trips (~15% of rides) generate significantly higher revenue per trip (**$33.88 vs $7.37**), making them disproportionately valuable.

👉 This suggests opportunities to optimize pricing or driver incentives for long-distance rides.

---

### 3. Passenger Behavior
![Passenger Analysis](Images/passenger_analysis.png)

**Insight:**  
Approximately **74% of trips involve a single passenger**, indicating that demand is primarily driven by individual riders.

Average fare remains consistent across passenger counts (~$12–$14), suggesting pricing is driven more by distance rather than group size.

👉 This implies limited benefit in pricing adjustments based on passenger count alone.

---

## 📌 Key Takeaways

- Most trips are short-distance and single-passenger
- Revenue per trip is driven by longer distances
- Data validation is critical — incorrect schema and storage design caused initial failures
- Not all “bad” data should be removed (zero-distance and null payments were retained intentionally)

---

## ⚠️ Limitations

- Dataset is simplified and may not reflect full real-world variability
- No external factors (weather, traffic, time-of-day trends) included
- Some fields required interpretation due to missing documentation

---

## 🚀 Tech Stack

- Amazon S3  
- Amazon Athena  
- SQL  
- Python (data handling)

---
