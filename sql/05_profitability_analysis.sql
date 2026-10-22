-- Step 5: Profitability analysis

USE profit_leak_analysis;

-- Profitability by category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM orders_clean
GROUP BY category
ORDER BY profit_margin ASC;

-- Profitability by sub-category
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM orders_clean
GROUP BY category, sub_category
ORDER BY profit_margin ASC;

-- Tables profitability by region
SELECT
    region,
    COUNT(*) AS order_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM orders_clean
WHERE sub_category = 'Tables'
GROUP BY region
ORDER BY total_profit ASC;

-- Top 10 loss-making Tables products
WITH product_performance AS (
    SELECT
        product_id,
        product_name,
        ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit
    FROM orders_clean
    WHERE sub_category = 'Tables'
    GROUP BY product_id, product_name
)
SELECT
    DENSE_RANK() OVER (ORDER BY total_profit ASC) AS loss_rank,
    product_name,
    total_sales,
    total_profit
FROM product_performance
WHERE total_profit < 0
ORDER BY loss_rank, product_name
LIMIT 10;
