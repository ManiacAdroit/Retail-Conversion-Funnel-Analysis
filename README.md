# E-Commerce Clickstream & Conversion Funnel Analysis
**SQL Data Analysis Case Study**

## 📌 Project Overview
This project focuses on analyzing user behavior, marketing attribution, and conversion funnels for an e-commerce platform using **Google BigQuery SQL**. By analyzing raw user clickstream logs, this project uncovers actionable business insights regarding marketing campaign performance (ROI), critical drop-off friction points in the checkout funnel, and product conversion metrics.

## 🛠️ Tech Stack & Skills
* **Cloud Platform:** Google Cloud Platform (GCP)
* **Data Warehouse:** Google BigQuery Studio
* **SQL Dialect:** Google Standard SQL
* **Core Techniques:** Common Table Expressions (CTEs), Conditional Aggregations (`CASE WHEN`), Window Functions, Advanced Analytical Funneling.

## 🗂️ Data Architecture & Schema
The dataset is hosted on GCP under the project path: `insightengine-sql-analytics.raw_ecommerce.web_events`.

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| **event_id** | INTEGER | Unique identifier for each individual user action. |
| **user_id** | INTEGER | Unique identifier for the customer. |
| **event_type** | STRING | Nature of interaction (`page_view`, `add_to_cart`, `checkout_start`, `payment_info`, `purchase`). |
| **event_date** | TIMESTAMP | The exact date and time the interaction occurred. |
| **product_id** | INTEGER | Identifier of the specific product viewed or bought. |
| **amount** | FLOAT | Dollar value of the purchase (NULL for non-purchase events). |
| **traffic_source**| STRING | Acquisition channel (`organic`, `social`, `paid_ads`, `email`). |

---

## 🔍 Key Analytical Questions Solved

### 1. Marketing ROI & Channel Performance
* **Objective:** Determine which customer acquisition channels yield the highest volume, quality, and total revenue.
* **SQL Script:** [Insert link to file or leave text]
* **Insight Summary:** Identifies the precise conversion rate by channel to advise budget allocation.

### 2. E-Commerce Funnel Drop-off Analysis
* **Objective:** Map the end-to-end customer journey from viewing a page to making a purchase to identify friction points.
* **SQL Script:** [Insert link to file or leave text]
* **Insight Summary:** pinpoints the exact transactional phase causing the highest rate of cart abandonment.

### 3. Customer Interaction Intensity
* **Objective:** Measure customer velocity and calculate the average touchpoints required before an order is placed.
* **SQL Script:** [Insert link to file or leave text]
* **Insight Summary:** Informs merchandising and retargeting teams on the typical length of our customer sales cycle.

---

## 💼 Business Impact & Recommendations
*(See the full write-up in the main project file for executive summaries used to present findings to stakeholders during product syncs.)*

