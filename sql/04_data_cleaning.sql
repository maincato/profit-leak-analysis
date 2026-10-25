-- Step 4: Data cleaning and transformation

USE profit_leak_analysis;

DROP TABLE IF EXISTS orders_clean;
DROP TABLE IF EXISTS returns_clean;

-- Clean Orders
CREATE TABLE orders_clean AS
SELECT
    CAST(row_id AS UNSIGNED) AS row_id,
    order_id,
    STR_TO_DATE(order_date, '%d/%m/%Y') AS order_date,
    STR_TO_DATE(ship_date, '%d/%m/%Y') AS ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    postal_code,
    city,
    state,
    country,
    region,
    market,
    product_id,
    product_name,
    sub_category,
    category,
    CAST(REPLACE(sales, ',', '.') AS DECIMAL(15,2)) AS sales,
    CAST(quantity AS UNSIGNED) AS quantity,
    CAST(REPLACE(discount, ',', '.') AS DECIMAL(6,4)) AS discount,
    CAST(REPLACE(profit, ',', '.') AS DECIMAL(15,2)) AS profit,
    CAST(REPLACE(shipping_cost, ',', '.') AS DECIMAL(15,2)) AS shipping_cost,
    order_priority
FROM orders_raw;

-- Clean Returns
CREATE TABLE returns_clean AS
SELECT DISTINCT
    order_id,
    returned,
    region
FROM returns_raw;

-- Validate cleaned data
SELECT
    (SELECT COUNT(*) FROM orders_clean) AS clean_orders,
    (SELECT COUNT(DISTINCT row_id) FROM orders_clean) AS unique_order_rows,
    (SELECT COUNT(*) FROM returns_clean) AS clean_returns,
    (SELECT COUNT(DISTINCT order_id) FROM returns_clean) AS unique_return_orders;
