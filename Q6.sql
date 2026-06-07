-- Question 6: Payment Method Preferences by State
/* Analyse payment method preferences across each state in the dataset. 
For each state, show the transaction count and total amount for each payment method 
(Cash on Delivery, Card, Mobile Money, Bank Transfer) and identify the most popular method per state.*/

WITH state_payments_total AS(
-- aggregate data by state and payments method
SELECT
c.state,
p.payment_method,
COUNT(p.payment_id) AS transaction_count,
SUM(p.amount) AS total_amount
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id =c.customer_id
GROUP BY state, payment_method
),
payment_method_preference AS(
-- classify methods within state based on how popular
SELECT
state, payment_method, transaction_count, total_amount,
RANK() OVER(PARTITION BY state ORDER BY transaction_count DESC) AS popular_rank
FROM state_payments_total
)
--show all methods and identify popular methods per state
SELECT
state, payment_method, transaction_count,
ROUND(total_amount::numeric, 2) AS total_amount,
CASE WHEN popular_rank = 1 THEN 'most_popular'
ELSE '-'
END AS popular_status
FROM payment_method_preference
ORDER BY state ASC,
transaction_count DESC;

