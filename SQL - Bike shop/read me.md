# 🚲 Bike Store Sales & Growth Analytics
**An End-to-End Business Intelligence Project using SQL & Python**

## 📋 Project Overview
This project analyzes a normalized relational database for a multi-store bike retailer to uncover revenue drivers, customer behavior patterns, and geographic trends. It mirrors real-world analytics workflows by using **SQL for heavy lifting** (data extraction/metrics) and **Python for visualization and storytelling**.

## 🏗️ Data Architecture (ERD)
![image.png](image.png)

The database follows a normalized schema including `customers`, `orders`, `products`, `brands`, and `stores`. Understanding this architecture was key to performing complex multi-table joins for metrics like CLV.

## 🛠️ Tech Stack & Skills
- **SQL (MySQL):** CTEs, Window Functions (`LAG`, `RANK`), Multi-table Joins, Aggregations.
- **Python:** Pandas, Matplotlib, Seaborn, Folium (Geospatial Analysis).
- **Business Logic:** Calculating AOV, CLV, and Month-over-Month growth.

## 📊 Key Visualizations
### 1. Regional Customer Density (Folium)
*Insert Screenshot of Folium Heatmap*
This map identifies geographic "hotspots," allowing the business to visualize where its market share is strongest versus where a physical presence is lacking.

### 2. Store Performance Trends
*Insert Screenshot of Matplotlib Revenue Chart*
A time-series analysis comparing revenue across the three store locations, highlighting seasonal fluctuations and growth trajectories.

## 🚀 Key Insights
- **Retention:** The top 10 customers contribute X% more revenue than the average, highlighting the need for a VIP retention strategy.
- **Efficiency:** Store performance varies significantly by category; the 'Mountain Bikes' category shows the highest growth in the suburban store.

## 📂 Project Structure
- `SQL & Python Project.ipynb`: Full analysis, code, and visualizations.
- `bike_script.sql`: Standalone SQL script for database setup and advanced queries.
- `requirements.txt`: List of Python libraries needed to run the analysis.

## 👤 Author
**Derek Eodice, MBA, MSc** [[LinkedIn Profile:](https://www.linkedin.com/in/derekeodice/)]
