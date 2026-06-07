-- Question 8: Top Seller Bonus Qualification
/*Identify the top 10 sellers in 2024 by total revenue who completed at least 10 orders 
and have an average customer rating of 4.0 or above. Include their total orders, average rating,
and total revenue.*/

-- Filter for high revenue, high quality sellers, high orders
SELECT o.seller_id,
COUNT(o.order_id) AS total_orders,
ROUND(AVG(r.rating)::numeric,2) AS avg_rating,
SUM(p.amount) AS total_revenue
FROM orders o
JOIN payments p ON o.order_id =p.order_id
JOIN reviews r ON o.order_id = r.order_id
WHERE EXTRACT(YEAR FROM p.payment_date)= 2024
GROUP BY o.seller_id
--filter to check for at least 10 orders
HAVING COUNT(o.order_id)>=10
--check avg customer rating at 4.0 and above
AND AVG(r.rating)>=4.0
--rank highest revenue in 2024
ORDER BY total_revenue DESC
LIMIT 10;
