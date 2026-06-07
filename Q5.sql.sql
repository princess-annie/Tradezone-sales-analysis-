-- Question 5: Customer Spend Segmentation
/* Segment customers based on their total spend in 2024 into three groups:
High Spenders: ≥ ₦100,000
 Medium Spenders: ₦50,000 – ₦99,999
Low Spenders: < ₦50,000*/

WITH customers_total AS(
-- calculate all payments (total spend) by customers in 2024
SELECT o.customer_id,
SUM(p.amount) AS total_spend
FROM payments p
JOIN orders o ON p.order_id =o.order_id
WHERE EXTRACT(YEAR FROM p.payment_date) = 2024
GROUP BY o.customer_id
),
Customers_Segment AS(
--categorize based on the customer segmentation
SELECT
customer_id, total_spend,
CASE
WHEN total_spend >= 100000 THEN 'High Spenders'
WHEN total_spend >= 50000 - 99000 THEN 'Medium Spenders'
ELSE 'Low Spenders'
END AS customers_spend_segment
FROM customers_total
)
--  calculate the customer count, average spend per customer and total revenue contribution.
SELECT 
customers_spend_segment,
COUNT(customer_id) AS Count_of_Customers,
ROUND(AVG(total_spend)::numeric, 2) AS avg_spend_per_customer,
SUM(total_spend) AS total_revenue_contribution
FROM Customers_Segment
GROUP BY customers_spend_segment
ORDER BY total_revenue_contribution DESC;


