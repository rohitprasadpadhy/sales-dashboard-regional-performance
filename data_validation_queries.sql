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
