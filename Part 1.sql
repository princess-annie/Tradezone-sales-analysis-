-- Data Cleaning & Preparation Script
-- 1. Removing Duplicates in customers, sellers and orders
-- Customers Table
--check how many duplicates exist before deleting
select count(*) - count(distinct customer_id) AS duplicates
from customers;
--Results: shows there are 0 duplicates in the customers table

-- Sellers Table
--check how many duplicates exist before deleting
select count(*) - count(distinct seller_id) AS duplicates
from sellers;
--Results: shows there are 0 duplicates in the sellers table

-- Orders Table
--check how many duplicates exist before deleting
select count(*) - count(distinct order_id) AS duplicates
from orders;
--Results: shows there are 0 duplicates in the orders table

-- 2. identify & Handle Null/Blank Values
-- Customers Table
select * from customers
where not(customers is not null);

/* Results: I found 16 null values in email records; i'm keeping those records but
replacing them with 'Unspecified', with that we don't loose data linked to
their ID's */

-- To handle the missing values
UPDATE customers
SET email ='Unspecified'
WHERE email is null OR email= '';

-- Sellers Table
select * from sellers
where not(sellers is not null);

--Results: No Null or blank values were identified in this table

-- Products Table
select * from products
where not(products is not null);

--Results: I found 4 null values
--firstly,standardize the product category
UPDATE products
SET category = INITCAP(TRIM(category));

-- Secondly, change the 'And' to '&' for data consistency(49 were replaced)
UPDATE products
SET category = REPLACE(category,'And', '&')
WHERE category like '% And %';

-- Replace (11)Electronis with Electronics
UPDATE products
SET category = 'Electronics'
WHERE category = 'Electronis';

-- Replace (10)Fashon with Fashion
UPDATE products
SET category ='Fashion'
WHERE category ='Fashon';

-- For the null values, we replace with the average of the product_category
/* I'm addressing the  null values in the product table by using category base mean,
this method uses the specific avg of each product category to fill null values. */

-- Avg for each product_catgeory
select category, Round(Avg(unit_price)::numeric, 2) AS category_Avg
from products
where unit_price is not null AND unit_price > 0
group by category;

-- replacing the avg for Home & Garden category(2)
UPDATE products
SET unit_price =73744.65
WHERE category = 'Home & Garden'
AND unit_price is null;

-- replacing the avg for Food & Beverages category
UPDATE products
SET unit_price =7224.75
WHERE category = 'Food & Beverages'
AND unit_price is null;

-- replacing the avg for Books & Stationery category
UPDATE products
SET unit_price =5638.01
WHERE category = 'Books & Stationery'
AND unit_price is null;


-- Orders Table
select * from orders
where not(orders is not null);

-- Results: I found 1581 records of null values with delivery_date and total_amount having null values.
-- i dropped the date column because it can not be assigned to any time period
-- firstly remove the items from(order_items,payments table) because they are linked to the parents table(orders)
Delete from order_items
where order_id in(
select order_id from orders
where delivery_date is null
);

--payments table
delete from payments
where order_id in(
select order_id from orders
where delivery_date is null
);

-- drop orders that have the null values in the delivery date column(1510)
delete from orders
where delivery_date is null;

-- To address the null values in the total_amount
-- first validate that the total_amount matches the line_total in the order_items table
select
o.order_id,
o.total_amount AS SUM_TOTAL,
sum(oi.line_total) AS total_of_line_total,
--cal the diff btw the two
ABS(o.total_amount - sum(oi.line_total)) AS difference
from orders o
--use join to link parent order(order) to child items(order_items)
join order_items oi on o.order_id = oi.order_id
--check rows that total_amount already exists
where o.total_amount is not null
group by o.order_id, o.total_amount
--filter amount grater than 10
Having ABS(o.total_amount - sum(oi.line_total)) > 10;

--flag orders where the diff is > 10
/*Alter table orders 
add column status_verification 
varchar(30) 
Default 'Verified';*/

--flag orders that failed the verification
update orders
set status_verification = 'mismatch price'
where order_id in(
select o.order_id
from orders o
join order_items oi on o.order_id= oi.order_id
group by o.order_id, o.total_amount
Having ABS(o.total_amount - sum(oi.line_total)) > 10
);

-- handle the 71 missing values for the total_amount
update orders o
set total_amount = sub.total_of_line_total,
status_verification = 'imputed verfied'
from(
--query that calculates the sum of every order
select order_id, sum(line_total) AS total_of_line_total
from order_items
group by order_id
) sub
where o.order_id = sub.order_id
AND o.total_amount is null;-- we're concentrating on just the null values

-- order_items table
select * from order_items
where not(order_items is not null);

-- Results: i found 42 null values in the order_items table with unit_price and line_total having the null values
-- To address the issue, we will look at the products table and make it a reference table for order_items table
update order_items oi
set unit_price = p.unit_price
from products p
where oi.product_id = p.product_id
and oi.unit_price is null;

--To fix the  42 null values in line_total
update order_items
set line_total =unit_price * quantity
where line_total is null;

select * from order_items;

-- Payments table
select * from payments
where not(payments is not null);

-- Results: i found 103 null values in the amount column
--To address the issue, i link the payments table to the order table to make it a reference table
update payments p
set amount = o.total_amount
from orders o
where p.order_id =o.order_id
and p.amount is null;

--to adress the remaining 10 null values
update payments p
set amount = sub.total_of_line_total
from(
select order_id, sum(line_total) AS total_of_line_total
from order_items
group by order_id
)sub
where p.order_id =sub.order_id
and p.amount is null;

select * from payments;

-- Reviews Table
select * from reviews
where not(reviews is not null);

-- Results: No Null or blank values were identified in this table

-- Standardize city names(865)
select * from customers;

UPDATE customers
SET city = INITCAP(TRIM(city));

-- Replace Lago S with Lagos(54)
UPDATE customers
set city ='Lagos'
where city ='Lago S';

-- Replace Port Harcourt with Port-Harcout(79)
UPDATE customers
set city ='Port-Harcourt'
where city ='Port Harcourt';

--Standardize formats in the sellers table
select * from sellers;

--Trim spaces(90)
UPDATE sellers 
SET city = INITCAP(TRIM(city));

-- Replace PortHarcourt with Port-Harcout(5)
UPDATE sellers
set city ='Port-Harcourt'
where city ='PortHarcourt';

-- Replace PORT HARCOURT with Port-Harcout(5)
UPDATE sellers
set city ='Port-Harcourt'
where city ='PORT HARCOURT';

-- Replace PORTHARCOURT with Port-Harcout(8)
UPDATE sellers
set city ='Port-Harcourt'
where city ='PORTHARCOURT';

-- Replace port harcourt with Port-Harcout(2)
UPDATE sellers
set city ='Port-Harcourt'
where city ='port harcourt';

-- Replace Lago s with Lagos(9)
UPDATE sellers
set city ='Lagos'
where city ='Lago s';

-- Replace lagos with Lagos(5)
UPDATE sellers
set city ='Lagos'
where city ='lagos';

-- Replace ibadan with Ibadan(4)
UPDATE sellers
set city ='Ibadan'
where city ='ibadan';

--Replace IBADAN with Ibadan(2)
UPDATE sellers
set city ='Ibadan'
where city ='IBADAN';

--Replace kano with Kano(2)
UPDATE sellers
set city ='Kano'
where city ='kano';

--Trim spaces(90)
UPDATE sellers
SET product_category = INITCAP(TRIM(product_category));

-- Secondly, change the 'And' to '&' for data consistency(15 were replaced)
UPDATE sellers
SET product_category = REPLACE(product_category,'And', '&')
WHERE product_category like '% And %';

-- Replace (2)Electronis with Electronics
UPDATE sellers
SET product_category= 'Electronics'
WHERE product_category= 'Electronis';

-- Replace (4)Fashon with Fashion
UPDATE sellers
SET product_category='Fashion'
WHERE product_category ='Fashon';


-- Data Validation
-- Check that all review ratings are between 1 and 5
-- first check reviews greater or less than 1 and 5
select review_id, rating
from reviews
where rating < 1 OR rating > 5;

--Results: we had 4 records with reviews less than 1 and above 5
-- Replace with Null values, because we can't guess intended values for this table
Update reviews
set rating = Null
where rating = -1; --(3 values replaced)

Update reviews
set rating = Null
where rating =0; --(1 values replaced)

Update reviews
set rating = Null
where rating =7; --(1 Values replaced)

-- To verify all rating column is between 1 and 5
select
min(rating) AS lowest_rating,
max(rating) AS highest_rating,
Count(*) filter 
(where rating is null) AS null_count
from reviews;

-- Check for negative product prices or discount percentages above 100%.
-- check for negative prices
select product_id, product_name, unit_price
from products
where unit_price < 0;

--Results: No negative prices was found in this table

--check for possible discount percentage above 100% 
/*The current database lacks a dicount or discount percentage column, in other words, we can't 
check for discount percentage*/






