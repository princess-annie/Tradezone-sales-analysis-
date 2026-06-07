-- Question 4: Quarterly Revenue Trends
-- Compare quarterly revenue across 2023 and 2024.
-- using CTE
WITH Quarterly_Statistics AS(
SELECT
EXTRACT(YEAR FROM payment_date) AS sales_year,
EXTRACT(QUARTER FROM payment_date) AS sales_quarter,
SUM(amount) AS total_revenue,
COUNT(DISTINCT order_id) AS total_orders,
AVG(amount) AS avg_order_value
FROM payments
WHERE EXTRACT(YEAR FROM payment_date) IN (2023,2024)
GROUP BY sales_year, sales_quarter
),
Year_comparison AS(
--using 2023, 2024 to calculate growth
select
q1.sales_quarter,
q1.total_revenue AS "2023_revenue",
q2.total_revenue AS "2024_revenue",
q2.total_orders AS "2024_orders",
q2.avg_order_value AS "2024_aov",
(q2.total_revenue - q1.total_revenue) AS revenue_growth
FROM Quarterly_Statistics q1
JOIN Quarterly_Statistics q2 ON q1.sales_quarter =q2.sales_quarter
WHERE q1.sales_year = 2023 AND q2.sales_year = 2024
)
SELECT 
sales_quarter,
"2024_revenue" AS Total_revenue,
"2024_orders" AS total_orders,
ROUND("2024_aov"::numeric,2) AS Average_Order_Value,
ROUND(revenue_growth::numeric) AS Amount_revenue_growth
FROM
Year_Comparison
ORDER BY Amount_revenue_growth DESC;

