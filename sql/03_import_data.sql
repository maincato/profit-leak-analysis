-- Step 3: Import raw data

USE profit_leak_analysis;

-- Orders
LOAD DATA LOCAL INFILE 'C:/path/to/data/orders.csv'
INTO TABLE orders_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Returns
LOAD DATA LOCAL INFILE 'C:/path/to/data/returns.csv'
INTO TABLE returns_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- People
LOAD DATA LOCAL INFILE 'C:/path/to/data/people.csv'
INTO TABLE people_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- Verify imported rows
SELECT 'Orders' AS table_name, COUNT(*) AS total_rows
FROM orders_raw
UNION ALL
SELECT 'Returns', COUNT(*)
FROM returns_raw
UNION ALL
SELECT 'People', COUNT(*)
FROM people_raw;