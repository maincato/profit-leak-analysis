USE profit_leak_analysis;

DROP TABLE IF EXISTS orders_raw;
DROP TABLE IF EXISTS returns_raw;
DROP TABLE IF EXISTS people_raw;

CREATE TABLE orders_raw (
    row_id VARCHAR(20),
    order_id VARCHAR(50),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
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
    product_name VARCHAR(255),
    sub_category VARCHAR(50),
    category VARCHAR(50),
    sales VARCHAR(50),
    quantity VARCHAR(20),
    discount VARCHAR(50),
    profit VARCHAR(50),
    shipping_cost VARCHAR(50),
    order_priority VARCHAR(50)
);

CREATE TABLE returns_raw (
    returned VARCHAR(10),
    order_id VARCHAR(50),
    region VARCHAR(100)
);

CREATE TABLE people_raw (
    person VARCHAR(100),
    region VARCHAR(100)
);
