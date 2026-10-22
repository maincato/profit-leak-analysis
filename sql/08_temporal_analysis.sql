-- Step 8: Temporal profitability analysis

USE profit_leak_analysis;

-- Annual sales and profitability
SELECT
    YEAR(order_date) AS order_year,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM orders_clean
GROUP BY YEAR(order_date)
ORDER BY order_year ASC;

-- Annual profitability by category
SELECT
    YEAR(order_date) AS order_year,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM orders_clean
GROUP BY YEAR(order_date), category
ORDER BY category, order_year;
