# NeoNest eCommerce Sales Analysis

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

---
# Executive Summary

After reviewing **NeoNest’s monthly performance metrics**, the dashboard reveals a total of **4.58M** in **Sales** across **1,000 Orders**, highlighting consistent customer demand for **electronics, fashion, and home goods**. However, two metrics stand out as potential concerns:

- **Shipped % (50.80)** vs. **Returned % (49.20):** Nearly half of all processed orders are returned, indicating potential mismatches in product expectations, quality issues, or fulfillment delays.
- **Quantity Sold (Shipped): 992:** While demand remains steady, a high volume of returned products could be eroding net shipments and profit margins.

The **monthly line chart** provides a time-based perspective of these five KPIs—**Sales, Orders, Returned %, Shipped %, and Quantity Sold**—offering a clear view of how each metric fluctuates month over month. Meanwhile, the **bar chart** at the bottom highlights **Total Sales by Category**, allowing quick identification of top-performing segments (e.g., **Electronics & Accessories, Fashion & Apparel, and Home & Kitchen**).

On the right, a **product-level table** details each item’s **category, price, shipped and returned figures, as well as contribution to total sales**. This granular view shows which products drive the bulk of revenue—and which may be contributing heavily to returns.

Interactive **city slicers** on the left and a **date slicer** on the top right enable focused analysis by region or specific time periods, making it easier to isolate where (and when) returns spike or sales surge.


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
 ┗ 📜 LICENSE
```
---
📌 **Contributors:** [Your Name]
📌 **Tools Used:** SQL, Power BI, MySQL, Python
📌 **Database:** MySQL (1,000 records)
📌 **License:** MIT License

