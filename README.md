# NeoNest eCommerce Sales Analysis

# Table of Contents

- [Background & Overview](#background--overview)
- [Data Structure & Initial Deck](#data-structure--initial-deck)
- [Steps Taken](#steps-taken)
- [Executive Summary](#executive-summary)
- [Deep Dive Insights](#deep-dive-insights)
- [Recommendations](#recommendations)


## Background & Overview
This project focuses on analyzing **NeoNest**, an eCommerce store specializing in **electronics, fashion, and home goods**.

The company possesses significant data on its **sales, marketing efforts, operational efficiency, and product offerings**, which has been previously underutilized. This project thoroughly analyzes and synthesizes this data to uncover **critical insights** that will contribute to improving **business success**.

### **Insights and Recommendations are Provided on the Following Key Areas:**

#### 1. Sales Trend Analysis  
- Evaluation of **historical sales patterns** on a **monthly** and **city** basis. The analysis focuses on:
  - **Revenue trends**  
  - **Order volume**  
  - **Shipped percentage (%)**  
  - **Return ratio (%)**  

#### 2. Product-Level Performance  
- Analysis of NeoNest's **product lines**, aiming to understand:  
  - **Impact on sales**  
  - **Return rates**  

#### 3. Regional Comparison  
- Evaluation of **sales and orders** by region to identify disparities and opportunities for regional growth.

#### 4. Category Comparison  
- Analysis of:  
  - **Categories generating the highest sales and orders**  
  - **Category performance on a regional basis**

An interactive PowerBI dashboard can be downloaded [here](https://github.com/Maaz-devv/Sales-Analysis/blob/main/Ecommerce%20Project.pbix).<br>
The SQL queries utilize to inspect,clean,organize and prepare data for the dashboard can be found [here](https://github.com/Maaz-devv/Sales-Analysis/blob/main/Ecommerce.sql).<br>
The SQL query utilized to fetch data from the database and connect to PowerBI can be found [here](https://github.com/Maaz-devv/Sales-Analysis/blob/main/connector.sql).<br>
The Python code utilized to generate dataset(orders table) can be downloaded [here](https://github.com/Maaz-devv/Sales-Analysis/blob/main/Dataset%20Generator.py).<br>

---
## Data Structure & Initial Deck
The **NeoNest database structure** consists of four tables:
- **Orders**  
- **Products**  
- **Geo**  
- **Date**  
Total Rows: **1,000 records**

### Entity-Relationship Diagram (ERD)
The ERD below provides an overview of the database structure and table relationships.
![ERD](https://github.com/user-attachments/assets/71a47bc6-beff-4654-ad18-8a4b34e5555d)

---
# Steps Taken
- **Dataset Generation:**  
  - Created the dataset using Python scripts to gather and format raw data.

- **Data Transformation & Modeling in SQL:**  
  - Performed data transformation (e.g., changing data types, cleaning data).  
  - Built connections between tables to establish a robust data model.

- **Data Extraction:**  
  - Wrote a specific SQL query to fetch the transformed data from the database.

- **Power BI Connection:**  
  - Connected to the database using DirectQuery (via ODBC).  
  - Imported the data into Power BI to create interactive dashboards.
- **DAX Measure Development:**  
  - Developed key DAX measures to calculate KPIs and enable dynamic visuals
---
# Executive Summary

After reviewing **NeoNest’s monthly performance metrics**, the dashboard reveals a total of **4.58M** in **Sales** across **1,000 Orders**, highlighting consistent customer demand for **electronics, fashion, and home goods**. However, two metrics stand out as potential concerns:

- **Shipped % (50.80)** vs. **Returned % (49.20):** Nearly half of all processed orders are returned, indicating potential mismatches in product expectations, quality issues, or fulfillment delays.
- **Quantity Sold (Shipped): 992:** While demand remains steady, a high volume of returned products could be eroding net shipments and profit margins.

The **monthly line chart** provides a time-based perspective of these five KPIs—**Sales, Orders, Returned %, Shipped %, and Quantity Sold**—offering a clear view of how each metric fluctuates month over month. Meanwhile, the **bar chart** at the bottom highlights **Total Sales by Category**, allowing quick identification of top-performing segments (e.g., **Electronics & Accessories, Fashion & Apparel, and Home & Kitchen**).

On the right, a **product-level table** details each item’s **category, price, shipped and returned figures, as well as contribution to total sales**. This granular view shows which products drive the bulk of revenue—and which may be contributing heavily to returns.

Interactive **city slicers** on the left and a **date slicer** on the top right enable focused analysis by region or specific time periods, making it easier to isolate where (and when) returns spike or sales surge.<br>
Below is the Overview page from the PowerBI dashboard and more examples are included throughout the report. The entire interactive dashboard can be downloaded [here](https://github.com/Maaz-devv/Sales-Analysis/blob/main/Ecommerce%20Project.pbix).


![Dashboard SnapShot](https://github.com/user-attachments/assets/fa64b882-230e-4562-80ec-34925cc6e871)

---
## Deep Dive Insights
### 1. Sales & Revenue Trends
- **Seasonal Peaks:** November and December see sales surges (+20% in November, +15% in December).
- **Steady Growth:** Despite fluctuations, sales show an upward trend.

### 2. Order & Fulfillment Efficiency
- **Fulfillment Gap:** Shipped% (50.8%) vs. Returned% (49.2%) indicates almost equal returns to shipments.
- **Operational Variability:** High returns during peak months suggest logistical strain.

### 3. Product Performance & Contribution
- **High-Contributing Products:** Electronics & Apparel drive the most sales but have high return rates.
- **Product Variability:** Focus on improving descriptions and sizing guides to reduce returns.

### 4. Regional Comparison
- **Regional Disparities:** Some cities outperform others; some regions have high return rates.
- **Targeted Opportunities:** Localized campaigns and logistics adjustments are recommended.

---
## Recommendations
- ✅ **Improve Product Quality & Descriptions:** With nearly half of orders being returned, review product quality and enhance descriptions to ensure customers receive exactly what they expect.
- ✅ **Optimize Inventory Management:**Focus on high-performing items to maintain sufficient stock, while reducing excess inventory of underperforming products.
- ✅ **Enhance Fulfillment Processes:** Streamline logistics to improve the shipped percentage. This may involve refining warehouse processes or partnering with additional couriers during peak periods.
- ✅ **Target Regional Marketing Efforts:** Use city-level insights to focus promotions in regions with high order volumes and returns, adapting campaigns to address local customer needs.
- ✅ **Monitor Performance Regularly:** Establish a routine review process to track these key metrics over time, enabling quick adjustments to strategies as market conditions change.

---
**📂 Project Repository Structure:**
```
📂 NeoNest-Analysis/
 ┣ 📂 data/
 ┣ 📂 sql_queries/
 ┣ 📂 dashboards/
 ┣ 📜 README.md
 
```
---
📌 **Contributors:** [Muhammad Maaz]
📌 **Tools Used:** SQL, Power BI, MySQL, Python
📌 **Database:** MySQL (1,000 records)


