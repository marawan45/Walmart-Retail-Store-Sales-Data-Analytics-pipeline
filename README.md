# 🛒 Walmart Retail Store Sales Analysis

## 📊 Project Overview

This project provides a comprehensive analysis of Walmart retail store sales data, examining patterns, trends, and external factors that influence sales performance across multiple stores and departments. The analysis covers sales data from 2010-2012, incorporating various economic and environmental factors.
## Dashboard
<img width="1271" height="718" alt="لقطة شاشة 2025-10-20 153122" src="https://github.com/user-attachments/assets/9df58cf5-9954-474a-9dcc-67d518792678" />
## -------------------------------------------------
<img width="1259" height="704" alt="لقطة شاشة 2025-10-20 153202" src="https://github.com/user-attachments/assets/30aa71e2-4ada-4750-9317-efae95f16aa6" />


## 🎯 Objectives

- Analyze sales performance across different stores and departments
- Identify seasonal trends and holiday impacts on sales
- Examine correlations between external factors (temperature, fuel prices, unemployment) and sales
- Provide actionable insights for inventory management and business strategy

## 📁 Dataset

**Source:** Walmart Sales Data  
**Period:** 2010-2012  
**Records:** Multiple stores with weekly sales data

### Key Variables
- **Store:** Store identifier
- **Dept:** Department identifier
- **Date:** Week of sales
- **Weekly_Sales:** Sales amount for the given department in the given store
- **Holiday_Flag:** Binary indicator (1 = holiday week, 0 = non-holiday week)
- **Temperature:** Average temperature in the region
- **Fuel_Price:** Cost of fuel in the region
- **CPI:** Consumer Price Index
- **Unemployment:** Unemployment rate in the region

## 🛠️ Technologies Used

### Data Processing & Analysis
- **Python 3.x**
  - pandas: Data manipulation and analysis
  - numpy: Numerical computations
  - matplotlib: Data visualization
  - seaborn: Statistical visualizations

### Database Management
- **SQL Server**
  - Data cleaning and transformation
  - Missing value imputation
  - Duplicate removal
  - Aggregated queries

### Visualization
- **Power BI / Tableau** (Dashboard creation)
- Interactive visualizations and KPI tracking

## 📋 Project Structure

```
walmart-sales-analysis/
│
├── data/
│   ├── Walmart.csv                    # Raw dataset
│   └── Cleaned_Walmart_Sales.csv      # Processed dataset
│
├── scripts/
│   ├── Data_Preparation.py            # Python data cleaning script
│   └── Data_Exploration.sql           # SQL queries for analysis
│
├── dashboards/
│   └── Walmart_Sales_Dashboard.pbix   # Power BI dashboard file
│
├── visualizations/
│   ├── sales_overview.png
│   ├── store_insights.png
│   └── external_factors.png
│
└── README.md
```

## 🔄 Workflow

### 1. Data Preparation (Python)
- Load raw Walmart sales data
- Convert date formats and extract temporal features (Month, Year)
- Handle missing values:
  - Numerical columns: Filled with mean values
  - Categorical columns: Filled with mode values
- Remove duplicate records
- Export cleaned dataset

### 2. Data Exploration (SQL)
- Identify missing values in key columns
- Impute missing sales using store-department averages
- Impute missing temperature using date-based averages
- Remove duplicate entries
- Format date columns for analysis
- Generate aggregated metrics:
  - Total sales per store
  - Average weekly sales by department
  - Holiday impact analysis
  - Correlation factors

### 3. Visualization & Insights
- Create interactive dashboards
- Identify top-performing stores and departments
- Analyze seasonal patterns and trends
- Evaluate external factor impacts

## 📈 Key Findings

### Sales Performance
- **Total Sales:** $6.74 billion across all stores (2010-2012)
- **Average Weekly Sales:** $1.01 million
- **Holiday Sales Impact:** 100% of stores show increased sales during holiday periods

### Store Insights
- Store performance varies significantly, with top stores generating over $300 million in total sales
- Store 20 shows the highest sales volume
- Store distribution shows diverse performance across locations

### External Factors
- **Temperature:** Average temperature of 60.66°F shows correlation with sales patterns
- **Fuel Price:** Average fuel price of $3.36 impacts consumer spending
- **Unemployment:** Average unemployment rate of 8.00% reflects economic conditions during the analysis period
- **CPI:** Consumer Price Index of 171.58 indicates inflation trends

### Temporal Patterns
- Strong seasonal spikes visible in 2011 and 2012
- Holiday weeks consistently outperform non-holiday weeks
- Year-over-year growth trends identified across most stores

## 💡 Business Recommendations

1. **Inventory Management:** Increase stock levels during holiday seasons and high-performing periods
2. **Resource Allocation:** Focus resources on top-performing stores and departments
3. **Pricing Strategy:** Consider fuel prices and unemployment rates when setting promotional strategies
4. **Seasonal Planning:** Prepare for predictable seasonal spikes based on historical patterns

## 🚀 Getting Started

### Prerequisites
```bash
# Python libraries
pip install pandas numpy matplotlib seaborn

# SQL Server or compatible database
# Power BI Desktop (for dashboard visualization)
```

### Running the Analysis

1. **Data Preparation:**
```bash
python Data_Preparation.py
```

2. **SQL Analysis:**
```sql
-- Execute queries in Data_Exploration.sql
-- against your SQL Server instance
```

3. **Dashboard:**
- Open the Power BI file in `dashboards/` folder
- Refresh data connections
- Interact with visualizations

## 📊 Dashboard Features

### Sales Overview
- Total sales metrics
- Average weekly sales
- Holiday sales percentage
- Time series analysis of sales trends

### Store & Department Insights
- Sales performance by store
- Weekly sales comparison across years
- Store ranking by total sales
- Department-level analysis

### External Factors Analysis
- Temperature correlation with sales
- Unemployment rate impact
- Fuel price trends
- CPI indicators

## 👥 Contributors

Marwan eslam - Data Analyst

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Walmart for providing the dataset
- Open-source community for tools and libraries



---

**Last Updated:** October 2025
