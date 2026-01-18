# PART 1 - INTRODUCTORY EDA ##################################

# Declare the dataset you wish to use
USE bike_store;

# State counts
SELECT state, COUNT(state) as state_count from customers GROUP BY state ORDER BY state_count DESC;

# Customer Counts
SELECT concat(first_name, ' ', last_name) AS name,
count(*) as name_count
FROM customers
GROUP BY name
ORDER BY name_count DESC;

# Order Counts
SELECT order_date, required_date, shipped_date,
count(order_date) AS order_count,
count(required_date) AS required_count,
count(shipped_date) AS shipped_count
FROM orders
GROUP BY order_date, required_date, shipped_date;

# What are the days with 0 shipments?
SELECT 
    order_date,
    COUNT(*) AS total_orders_that_day,
    count(required_date) AS required_orders_that_day,
    count(shipped_date) AS shipped_orders_that_day
FROM orders
GROUP BY order_date
HAVING count(shipped_date) = 0;

# How many days had 0 shipments?
SELECT count(*) AS days_where_zero_shipped
FROM(
	SELECT
    order_date,
    COUNT(*) AS total_orders_that_day,
    count(required_date) AS required_orders_that_day,
    count(shipped_date) AS shipped_orders_that_day
    FROM orders
    GROUP BY order_date
    HAVING count(shipped_date) = 0)
AS days_where_zero_shipped;

# Which stores were the busiest?
SELECT store_id, 
count(*) as total_store_orders
FROM orders
GROUP BY store_id
ORDER BY total_store_orders DESC;

# What is the total stock at each store?
select store_id,
count(*) as total_stock
from stocks
group by store_id
ORDER BY total_stock DESC;

select * from stores;

# Who were the top 5 customers at each store?
SELECT * 
FROM(
	SELECT
		store_id, customer_id,
        COUNT(*) AS order_count,
        row_number() OVER (PARTITION BY store_id ORDER BY COUNT(*) DESC) AS rn
	FROM orders
    GROUP BY store_id, customer_id
) RANKED
WHERE rn <= 5
ORDER BY store_id, order_count DESC;

# PART 2 - MULTI-TABLE EDA ##################################

-- Revenue -- 
# What was the total revenue by year/month
SELECT
	year(o.order_date) AS year,
    month(o.order_date) AS month,
    round(sum(oi.quantity * oi.list_price * (1-oi.discount)),2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY year(o.order_date), month(o.order_date)
ORDER BY  year, month;

# What was the revenue by store?
SELECT
    s.store_name, 
    s.city, 
    s.state,
    ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS total_revenue
FROM stores s
JOIN orders o ON s.store_id = o.store_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY s.store_name, s.city, s.state
ORDER BY total_revenue DESC;

-- Best Sellers -- 
# What were the top 10 best selling products overall?
SELECT
    p.product_name,
    b.brand_name,
    SUM(oi.quantity) AS total_quantity,
    ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS revenue
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name, b.brand_name
ORDER BY revenue DESC
LIMIT 10;

# What was the revenue by brand and category?
SELECT 
    b.brand_name,
    c.category_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS revenue
FROM brands b
JOIN products p ON b.brand_id = p.brand_id
JOIN categories c ON p.category_id = c.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY b.brand_name, c.category_name
ORDER BY revenue DESC;


-- Average Order Value (AOV) by Store and Year-- 
SELECT
	s.store_name,
    YEAR(o.order_date) AS year,
    COUNT(DISTINCT o.order_id) AS num_orders,
    ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)) / COUNT(DISTINCT o.order_id), 2) AS aov
FROM stores s
JOIN orders o ON s.store_id = o.store_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY s.store_name, YEAR (o.order_date)
ORDER BY year, aov DESC;

-- Customer Lifetime Value (Top 10 by Total Spend) --
SELECT
	CONCAT(c.first_name, ' ', c.last_name) as customer_name,
    ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)),2) AS clv
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY clv DESC
LIMIT 10;

-- CTE - LAG with Monthly Revenue --
WITH monthly_revenue AS(
SELECT
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY year, month
)
SELECT 
    year,
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY year, month) AS prev_revenue,
    ROUND((revenue - LAG(revenue) OVER (ORDER BY year, month)) / LAG(revenue) OVER (ORDER BY year, month) * 100, 2) AS mom_growth_pct
FROM monthly_revenue;