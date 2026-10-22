# Profit Leak Analysis

## Project Overview

An end-to-end data analytics project using **Excel, MySQL and Power BI** to investigate profitability issues in the Global Superstore dataset.

The objective is to identify underperforming products, evaluate the relationship between discounts and profitability, and provide data-driven business recommendations.

## Business Problem

Between 2014 and 2017, the company experienced consistent revenue growth. However, its overall profit margin declined from 11.95% in 2016 to 11.73% in 2017.

The goal is to understand which products, regions and commercial practices contribute to weak profitability.

## Tools Used

- **Excel:** Exploratory data analysis, pivot tables and initial business insights.
- **MySQL:** Data cleaning, validation, joins, aggregations, CTEs and window functions.
- **Power BI:** Interactive dashboards, DAX measures and business performance visualization.

## Key Findings

| Metric | Result |
|---|---|
| Total Sales | 12.64M |
| Total Profit | 1.47M |
| Overall Profit Margin | 11.61% |
| Furniture Profit Margin | 6.94% |
| Tables Profit Margin | -8.46% |
| Tables Average Discount | 29.07% |

### Profitability Analysis

Furniture is the least profitable category. Within Furniture, Tables generated approximately 757K in sales but recorded a loss of 64K.

### Discount Analysis

Tables with discounts above 40% recorded a profit margin of -76.73%, compared with +23.09% for Tables sold without discounts.

### Regional Analysis

The largest absolute losses from Tables were concentrated in Southeastern Asia, Western Europe and South America.

### Returns Analysis

Furniture had the highest proportion of orders associated with returns (10.17%), closely followed by Technology (10.07%).

## Business Recommendations

1. Review high-discount sales of Tables, particularly those exceeding 20%.
2. Prioritize profitability reviews in regions with the largest losses.
3. Investigate product pricing, costs and discount policies before implementing changes.
4. Monitor profit margins and order-level return indicators alongside revenue growth.

These recommendations are based on observed relationships, not proven causal effects.

## Project Structure

```text
profit-leak-analysis/
├── data/
├── excel/
├── sql/
├── powerbi/
├── images/
├── insights/
└── README.md
```

## Project Deliverables

- **Excel:** Exploratory analysis and profitability insights — Completed.
- **SQL:** Data preparation, validation and business analysis — Completed.
- **Power BI:** Interactive dashboard and business storytelling — In progress.

The analysis uses the Global Superstore dataset, and results should be interpreted within the limitations of this historical dataset.