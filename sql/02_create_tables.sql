-- Profit Leak Analysis
-- Step 2: Create raw tables for the Global Superstore dataset
-- All columns are initially stored as text to preserve the source data.

USE profit_leak_analysis;

CREATE TABLE IF NOT EXISTS orders_raw (
    row_id VARCHAR(20),
    order_id VARCHAR(50),
    order_date VARCHAR(30),
    ship_date VARCHAR(30),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    postal_code VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    region VARCHAR(100),
    market VARCHAR(100),
    product_id VARCHAR(50),
    product_name TEXT,
    sub_category VARCHAR(50),
    category VARCHAR(50),
    sales VARCHAR(50),
    quantity VARCHAR(20),
    discount VARCHAR(50),
    profit VARCHAR(50),
    shipping_cost VARCHAR(50),
    order_priority VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS returns_raw (
    returned VARCHAR(10),
    order_id VARCHAR(50),
    region VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS people_raw (
    person VARCHAR(100),
    region VARCHAR(100)
);
