-- MAVEN PIZZA — COMPLETE SQL ANALYSIS
-- ─────────────────────────────────────────────────────────
-- SECTION 1 — KEY PERFORMANCE INDICATORS
-- ─────────────────────────────────────────────────────────
SELECT
    COUNT(DISTINCT o.order_id)          AS total_orders,
    SUM(od.quantity)                    AS total_pizzas_sold,
    ROUND(SUM(od.quantity * p.price),2) AS total_revenue,
    ROUND(AVG(order_totals.order_value),2) AS avg_order_value,
    ROUND(AVG(order_totals.pizza_count),2) AS avg_pizzas_per_order,
    COUNT(DISTINCT p.pizza_type_id)     AS unique_pizza_types,
    COUNT(DISTINCT p.pizza_id)          AS unique_pizza_skus,
    MIN(o.date)                         AS first_order_date,
    MAX(o.date)                         AS last_order_date
FROM orders o
JOIN order_details od ON o.order_id  = od.order_id
JOIN pizzas        p  ON od.pizza_id = p.pizza_id
JOIN (
    SELECT od2.order_id,
           SUM(od2.quantity * p2.price) AS order_value,
           SUM(od2.quantity)            AS pizza_count
    FROM order_details od2
    JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id
    GROUP BY od2.order_id
) order_totals ON o.order_id = order_totals.order_id;

-- ============================================================
--  SECTION 2 — BASIC REVENUE ANALYSIS
-- ============================================================

-- Total revenue for the whole year
-- (We join order_details with pizzas to get the price)
SELECT
    ROUND( SUM(od.quantity * p.price), 2 ) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;


-- Total number of orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;


-- Total pizzas sold
SELECT SUM(quantity) AS total_pizzas_sold
FROM order_details;


-- Average order value
-- (How much does a customer spend per order on average?)
SELECT
    ROUND( AVG(order_total), 2 ) AS avg_order_value
FROM (
    SELECT
        od.order_id,
        SUM(od.quantity * p.price) AS order_total
    FROM order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    GROUP BY od.order_id
) AS order_totals;


-- ============================================================
--  SECTION 3 — REVENUE BY TIME
-- ============================================================

-- Revenue by Month
SELECT
    EXTRACT(MONTH FROM o.date)  AS month_number,
    TO_CHAR(o.date, 'Month')    AS month_name,
    ROUND( SUM(od.quantity * p.price), 2 ) AS revenue
FROM orders o
JOIN order_details od ON o.order_id  = od.order_id
JOIN pizzas        p  ON od.pizza_id = p.pizza_id
GROUP BY EXTRACT(MONTH FROM o.date), TO_CHAR(o.date, 'Month')
ORDER BY month_number;


-- Revenue by Day of Week
-- (Which day brings in the most money?)
SELECT
    TO_CHAR(o.date, 'Day')  AS day_name,
    ROUND( SUM(od.quantity * p.price), 2 ) AS revenue,
    COUNT(DISTINCT o.order_id) AS number_of_orders
FROM orders o
JOIN order_details od ON o.order_id  = od.order_id
JOIN pizzas        p  ON od.pizza_id = p.pizza_id
GROUP BY TO_CHAR(o.date, 'Day')
ORDER BY revenue DESC;


-- Revenue by Hour of Day
-- (What time do customers order the most?)
SELECT
    EXTRACT(HOUR FROM o.time) AS hour_of_day,
    COUNT(DISTINCT o.order_id) AS number_of_orders,
    ROUND( SUM(od.quantity * p.price), 2 ) AS revenue
FROM orders o
JOIN order_details od ON o.order_id  = od.order_id
JOIN pizzas        p  ON od.pizza_id = p.pizza_id
GROUP BY EXTRACT(HOUR FROM o.time)
ORDER BY hour_of_day;


-- Revenue by Quarter
SELECT
    EXTRACT(QUARTER FROM o.date) AS quarter,
    ROUND( SUM(od.quantity * p.price), 2 ) AS revenue
FROM orders o
JOIN order_details od ON o.order_id  = od.order_id
JOIN pizzas        p  ON od.pizza_id = p.pizza_id
GROUP BY EXTRACT(QUARTER FROM o.date)
ORDER BY quarter;


-- ============================================================
--  SECTION 4 — PRODUCT ANALYSIS
-- ============================================================

-- Revenue by Pizza Category
SELECT
    pt.category,
    SUM(od.quantity)                        AS pizzas_sold,
    ROUND( SUM(od.quantity * p.price), 2 )  AS revenue
FROM order_details od
JOIN pizzas      p  ON od.pizza_id     = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY revenue DESC;


-- Revenue by Pizza Size
SELECT
    p.size,
    SUM(od.quantity)                        AS pizzas_sold,
    ROUND( SUM(od.quantity * p.price), 2 )  AS revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY revenue DESC;


-- Top 10 Best Selling Pizzas (by revenue)
SELECT
    pt.name          AS pizza_name,
    pt.category,
    SUM(od.quantity)                        AS pizzas_sold,
    ROUND( SUM(od.quantity * p.price), 2 )  AS revenue
FROM order_details od
JOIN pizzas      p  ON od.pizza_id     = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name, pt.category
ORDER BY revenue DESC
LIMIT 10;


-- Bottom 10 Worst Selling Pizzas
-- (These might need to be removed from the menu)
SELECT
    pt.name          AS pizza_name,
    pt.category,
    SUM(od.quantity)                        AS pizzas_sold,
    ROUND( SUM(od.quantity * p.price), 2 )  AS revenue
FROM order_details od
JOIN pizzas      p  ON od.pizza_id     = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name, pt.category
ORDER BY revenue ASC
LIMIT 10;


-- Most expensive pizzas on the menu
SELECT
    pt.name     AS pizza_name,
    p.size,
    p.price
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 10;


-- Cheapest pizzas on the menu
SELECT
    pt.name     AS pizza_name,
    p.size,
    p.price
FROM pizzas p
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price ASC
LIMIT 10;


-- ============================================================
--  SECTION 5 — ORDER ANALYSIS
-- ============================================================

-- How many pizzas are in each order?
-- (Most orders have how many pizzas?)
SELECT
    quantity_per_order,
    COUNT(*) AS number_of_orders
FROM (
    SELECT order_id, SUM(quantity) AS quantity_per_order
    FROM order_details
    GROUP BY order_id
) AS order_sizes
GROUP BY quantity_per_order
ORDER BY quantity_per_order;


-- What is the smallest and largest order?
SELECT
    MIN(order_total) AS smallest_order,
    MAX(order_total) AS largest_order,
    ROUND( AVG(order_total), 2 ) AS average_order
FROM (
    SELECT
        od.order_id,
        SUM(od.quantity * p.price) AS order_total
    FROM order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    GROUP BY od.order_id
) AS totals;






