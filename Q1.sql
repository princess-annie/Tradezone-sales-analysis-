/* Customer Acquisition & 30-Day Conversion
Find the top 5 states by number of new customer sign-ups in 2024. For each state, 
calculate what percentage of these new customers made at least one 
purchase within their first 30 days of signing up.*/

--identify new customers that joined in 2024
with new_customers_2024 AS(
SELECT customer_id, state, signup_date
FROM customers
WHERE signup_date >= '2024-01-01' AND signup_date <= '2024-12-31'
), 
Purchases AS(
SELECT customer_id, min(order_date) AS first_order -- first order date for every customer
FROM orders
GROUP BY order_id
),
Conversion AS( --join to see customers who bought within 30 days
SELECT nc.state, nc.customer_id,
CASE -- create a flag 1 or 0
WHEN p.first_order <=(nc.signup_date + INTERVAL '30 days') THEN 1 
ELSE 0
END AS Conversion_30_days
FROM new_customers_2024 nc
LEFT JOIN Purchases p ON nc.customer_id = p.customer_id
)
--aggregate by state, find top 5
SELECT state, count(customer_id) AS total_new_signups,
ROUND(
(SUM(Conversion_30_days)::numeric/ count(customer_id)::numeric) * 100, 2) AS Conversion_Percentage
FROM Conversion
GROUP BY state
ORDER BY total_new_signups DESC
LIMIT 5;
