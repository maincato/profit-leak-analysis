# SQL Analysis

This folder contains the SQL scripts used to import, clean, validate and analyse the Global Superstore dataset using MySQL 8.0.

## Project Structure

| File | Description |
|---|---|
| `01_create_database.sql` | Creates the project database |
| `02_create_tables.sql` | Defines the raw data tables |
| `03_import_data.sql` | Imports the CSV datasets |
| `04_data_cleaning.sql` | Transforms data types and removes duplicate returns |
| `05_profitability_analysis.sql` | Analyses profitability by category, sub-category, region and product |
| `06_discounts_analysis.sql` | Investigates the relationship between discounts and profitability |
| `07_returns_analysis.sql` | Uses LEFT JOIN to analyse order-level return indicators |
| `08_temporal_analysis.sql` | Analyses annual sales and profit margins |

## Setup

**Requirements:** MySQL 8.0 and MySQL Workbench.

Run the scripts in numerical order. Before importing data, update the CSV file paths in `03_import_data.sql` and ensure the destination tables are empty.

The Orders CSV uses semicolons as field separators. Check the formats of the Returns and People CSV files before importing them.

`LOAD DATA LOCAL INFILE` must be enabled on both the client and server for the import script to work.

## Key Findings

- Overall profit margin: **11.61%**.
- Furniture has the lowest category margin: **6.94%**.
- Tables generated approximately **757K in sales but lost 64K**, with a margin of **−8.46%**.
- Tables with discounts above 40% recorded a margin of **−76.73%**.
- The largest absolute Tables losses were concentrated in Southeastern Asia, Western Europe and South America.
- Furniture had the highest rate of orders associated with returns: **10.17%**.
- Overall profit margin decreased from **11.95% in 2016 to 11.73% in 2017**, despite higher sales.

## Tools and Techniques

MySQL 8.0 · Data Cleaning · Aggregations · JOINs · CTEs · Window Functions · Data Validation

The SQL results are consistent with the initial Excel analysis, with minor differences caused by numeric rounding.