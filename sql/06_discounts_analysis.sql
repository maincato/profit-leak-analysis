-- Step 6: Discount impact analysis

USE profit_leak_analysis;

-- Average discount by Furniture sub-category
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(discount) * 100, 2) AS avg_discount,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM orders_clean
WHERE category = 'Furniture'
GROUP BY sub_category
ORDER BY avg_discount DESC;

-- Tables profitability by discount range
SELECT
    CASE
        WHEN discount = 0 THEN '0% - No discount'
        WHEN discount <= 0.20 THEN '1% - 20%'
        WHEN discount <= 0.40 THEN '21% - 40%'
        ELSE 'Above 40%'
    END AS discount_group,
    COUNT(*) AS order_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM orders_clean
WHERE sub_category = 'Tables'
GROUP BY discount_group
ORDER BY MIN(discount);

-- Discount analysis by region for Tables
SELECT
    region,
    COUNT(*) AS order_lines,
    ROUND(AVG(discount) * 100, 2) AS avg_discount,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2) AS profit_margin
FROM orders_clean
WHERE sub_category = 'Tables'
GROUP BY region
ORDER BY total_profit ASC;
