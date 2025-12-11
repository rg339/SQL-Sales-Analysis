-- 1. Create table
CREATE TABLE sales (
    order_id INTEGER,
    product TEXT,
    category TEXT,
    price REAL,
    quantity INTEGER,
    order_date TEXT
);

-- 2. Import CSV (DB Browser → File → Import → Table from CSV)

-- 3. Total revenue
SELECT SUM(price * quantity) AS total_revenue
FROM sales;

-- 4. Revenue by category
SELECT category, SUM(price * quantity) AS category_revenue
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;

-- 5. Top products by revenue
SELECT product, SUM(price * quantity) AS product_revenue
FROM sales
GROUP BY product
ORDER BY product_revenue DESC;

-- 6. Monthly revenue trend
SELECT STRFTIME('%Y-%m', order_date) AS month, SUM(price * quantity) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 7. Product growth trend (month by month)
SELECT product, STRFTIME('%Y-%m', order_date) AS month, SUM(price * quantity) AS monthly_revenue
FROM sales
GROUP BY product, month
ORDER BY product, month;

-- 8. Average order value per category
SELECT category, AVG(price * quantity) AS avg_order_value
FROM sales
GROUP BY category;
