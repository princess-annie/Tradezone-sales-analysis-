-- Question 3: Seller Fulfilment Efficiency
-- Top 20 sellers with fastest average fuillment 
SELECT seller_name,
COUNT( DISTINCT o.order_id) AS total_orders,
--calculate avg hrs(delivery_date - order_date)
ROUND(AVG(o.delivery_date -o.order_date) * 24, 2) AS avg_delivery_hrs,
--calculate avg customer rating
ROUND(AVG(r.rating)::numeric, 2) AS avg_customer_rating
FROM sellers s
--connect sellers to their products catalog
JOIN products p ON s.seller_id = p.seller_id
--connect products catalog to items that was actually sold
JOIN order_items oi ON p.product_id =oi.product_id
--connect items to order date
JOIN orders o ON oi.order_id = o.order_id
--connect order to reviews
LEFT JOIN reviews r ON o.order_id = r.order_id
--delivered orders
WHERE o.delivery_date IS NOT NULL
GROUP BY s.seller_id, s.seller_name
--sellers with 20 completed orders
HAVING COUNT( DISTINCT o.order_id) >=20
ORDER BY avg_delivery_hrs ASC
LIMIT 20;

