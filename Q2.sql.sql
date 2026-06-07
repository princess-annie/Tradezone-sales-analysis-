-- Question 2: Product Performance
/*Identify the top 10 products by total revenue in 2024. 
Include product name, category, total revenue and total number of orders. 
Sort by revenue descending.*/
--identify top 10 products by total revenue in 2024
SELECT p.product_name, p.category,
SUM(oi.quantity * oi.unit_price) AS total_revenue,
COUNT(distinct oi.order_id) AS total_no_orders
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
-- filter for 2024
WHERE o.order_date >='2024-01-01' AND o.order_date <= '2024-12-31'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 10;
