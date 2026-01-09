CREATE TABLE sales_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2),
    ship_mode VARCHAR(50)
);

CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    region VARCHAR(50)
);

Regional Sales Performance (CORE KPI)--
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_orders
GROUP BY region
ORDER BY total_sales DESC;

Discount Impact Analysis--
SELECT 
    discount,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_orders
GROUP BY discount
ORDER BY discount;

Shipping Mode Performance--
SELECT 
    ship_mode,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_orders
GROUP BY ship_mode
ORDER BY total_sales DESC;

Overall Business KPIs (EXECUTIVE VIEW)--
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(discount), 2) AS avg_discount,
    SUM(quantity) AS total_quantity
FROM sales_orders;
