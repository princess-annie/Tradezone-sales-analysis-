-- Question 7: Review Ratings and Sales Performance
-- Group products based on their average review rating into three categories:
/*High Rated: 4.0 and above
Mid Rated: 3.0 – 3.99
Low Rated: Below 3.0*/

WITH products_satisfaction AS(
--calculate avg rating, total revenue and avg unit_price by product
SELECT oi.product_id,
AVG(r.rating) AS avg_rating,
SUM(p.amount) AS revenue_total_product,
AVG(oi.unit_price) AS avg_unit_price_per_product
FROM order_items oi
JOIN payments p ON oi.order_id = p.order_id
JOIN reviews r ON oi.product_id = r.product_id
GROUP BY oi.product_id
),
Categories AS(
-- categorize products based on their threshold
SELECT
product_id, revenue_total_product,avg_unit_price_per_product,
CASE 
WHEN avg_rating >= 4.0 THEN 'High Rated'
When avg_rating >= 3.0 - 3.99 THEN 'Mid Rated'
ELSE 'Low Rated'
END AS rating_category
FROM products_satisfaction
)
--Aggreagtion by ratings category
SELECT rating_category,
COUNT(product_id) AS product_count,
ROUND(SUM(revenue_total_product)::numeric,2) AS total_revenue,
ROUND(SUM(avg_unit_price_per_product)::numeric,2) AS avg_unit_price
FROM Categories
GROUP BY rating_category
ORDER BY total_revenue DESC;

