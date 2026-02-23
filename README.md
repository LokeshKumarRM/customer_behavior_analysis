# Customer Behavior Analysis
## Overview
This project presents an end-to-end data analytics workflow analyzing customer shopping behavior. It demonstrates practical skills in data cleaning, exploratory data analysis (EDA), SQL database management, dashboard development, and business reporting.
The project covers:

* Loading and analyzing customer data using Python
* Performing data cleaning and feature engineering
* Conducting exploratory data analysis (EDA)
* Running SQL queries using SQL Server (with scripts adaptable for PostgreSQL/MySQL)
* Building an interactive Power BI dashboard
* Creating a structured business report
* Designing a presentation using Gamma

This project simulates a real-world analytics workflow from raw data to executive-level insights.
## Dataset

File:  `customer_shopping_behavior.csv`

The dataset contains structured customer transaction and behavioral data, including:

* Age
* Category
* Purchase Amount (USD)
* Frequency of Purchases
* Discount Applied
* Promo Code Used
* Review Rating
* Other transactional attributes

### Data Characteristics:

* Mixed categorical and numerical variables
* Missing values in review ratings
* Inconsistent column naming
* Business-related features requiring transformation
## Tools & Technologies

### Programming & Analysis

* Python

  * Pandas
  * NumPy
* Jupyter Notebook

### Databases

* Microsoft SQL Server (via pyodbc & SQLAlchemy)
* SQL scripts compatible with PostgreSQL / MySQL

### Business Intelligence

* Power BI (`customer_behavior_analysis.pbix`)

### Reporting & Presentation

* Analytical Report (Document format)
* Presentation created using Gamma

## Project Steps

### 1️⃣ Data Loading

* Imported dataset using Pandas
* Inspected structure using:

  * `df.head()`
  * `df.info()`
  * `df.describe()`
* Checked for missing values

### 2️⃣ Data Cleaning & Preparation

Performed several preprocessing steps:

* Filled missing **Review Rating** values using median by category
* Standardized column names (lowercase, underscores)
* Renamed `purchase_amount_(usd)` to `purchase_amount`
* Removed redundant column (`promo_code_used`)
* Created derived features:

  * `age_group` using quantile-based segmentation
  * `purchase_frequency_days` by mapping textual frequency into numeric days
* Verified null values and cleaned dataset integrity

This improved data consistency and usability for SQL and BI tools.

### 3️⃣ Exploratory Data Analysis (EDA)
Analyzed:
* Customer age distribution
* Purchase amount trends
* Category performance
* Review ratings
* Purchase frequency behavior
* Discount impact patterns

Used descriptive statistics and grouped analysis to extract initial insights.

### 4️⃣ SQL Database Integration

Connected Python to SQL Server using:

* `pyodbc`
* `SQLAlchemy`

Steps performed:

* Created database connection
* Uploaded cleaned dataset to SQL Server
* Created `customer_table`
* Executed analytical queries from `customer_behavior_analysis_queries.sql`

### SQL Analysis Included:

* Aggregations (SUM, AVG, COUNT)
* GROUP BY category and age group
* Customer segmentation queries
* Revenue analysis
* Frequency-based customer insights

The SQL layer demonstrates database management and analytical querying skills.
## Dashboard
File: `customer_behavior_analysis.pbix`

An interactive Power BI dashboard was created to visualize key metrics.

### Dashboard Features:

* KPI Cards (Total Revenue, Avg Purchase, Total Customers)
* Category-wise sales analysis
* Age group segmentation
* Purchase frequency trends
* Discount impact visualization
* Interactive slicers for filtering

The dashboard is designed for business stakeholders and decision-makers.

## Results & Key Insights

From the analysis:

* Certain product categories drive significantly higher revenue
* Purchase frequency strongly influences total customer value
* Discount usage patterns align with higher transaction volumes
* Age segmentation reveals distinct buying behaviors
* Median-based imputation preserved rating distribution integrity

The project demonstrates:

* Real-world data cleaning ability
* Practical SQL database integration
* Business-focused analytical thinking
* Dashboard storytelling skills
* End-to-end project execution

## Project Structure

customer_behavior_analysis/
│
├── customer_shopping_behavior.csv
├── cutomer_behvavior_analysis.ipynb
├── customer_behavior_analysis_queries.sql
├── customer_behavior_analysis.pbix
└── README.md
```

---

## How to Run

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/your-username/customer-behavior-analysis.git
cd customer-behavior-analysis
```

---

### 2️⃣ Install Required Libraries

```bash
pip install pandas numpy pyodbc sqlalchemy
```

---

### 3️⃣ Run Jupyter Notebook

```bash
jupyter notebook
```

Open:

```
cutomer_behvavior_analysis.ipynb
```

### 4️⃣ SQL Setup (SQL Server)

* Create a database (e.g., `customer_behaviour`)
* Update server name in notebook if required
* Run notebook cells to upload dataset to SQL
* Execute queries from:

  ```
  customer_behavior_analysis_queries.sql
  ```

### 5️⃣ Open Power BI Dashboard

* Open `customer_behavior_analysis.pbix`
* Refresh data source if needed


