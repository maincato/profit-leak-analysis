-- Step 7: Returns analysis

USE profit_leak_analysis;

-- Check duplicate orders in Returns
SELECT
    order_id,
    COUNT(*) AS occurrences
FROM returns_raw
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

-- Validate cleaned Returns
SELECT
    COUNT(*) AS total_returns,
    COUNT(DISTINCT order_id) AS unique_orders
FROM returns_clean;

-- Validate LEFT JOIN
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT o.row_id) AS unique_rows,
    ROUND(SUM(o.sales), 2) AS total_sales
FROM orders_clean AS o
LEFT JOIN returns_clean AS r
    ON o.order_id = r.order_id;

-- Return rate by category
SELECT
    o.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT CASE
        WHEN r.returned = 'Yes' THEN o.order_id
    END) AS returned_orders,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN r.returned = 'Yes' THEN o.order_id
        END) * 100.0 /
        NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS return_rate
FROM orders_clean AS o
LEFT JOIN returns_clean AS r
    ON o.order_id = r.order_id
GROUP BY o.category
ORDER BY return_rate DESC;
