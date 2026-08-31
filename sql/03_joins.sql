-- Combining employee and department data

SELECT
    e.name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;


-- Combining orders and customers

SELECT
    o.order_id,
    c.name AS customer,
    o.order_date,
    o.status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;


-- Combining orders, customers, order items and products

SELECT
    o.order_id,
    c.name AS customer,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;


-- Customers and their orders

SELECT
    c.name AS customer,
    o.order_id,
    o.order_date,
    o.status
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date;
