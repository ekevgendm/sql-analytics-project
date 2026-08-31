-- Employees with salary above average

SELECT
    name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;


-- Departments with high average salary

WITH department_stats AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    department_id,
    average_salary
FROM department_stats
WHERE average_salary > 90000
ORDER BY average_salary DESC;


-- Customer revenue

WITH customer_revenue AS (
    SELECT
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)
SELECT
    c.name AS customer,
    cr.total_revenue
FROM customers c
JOIN customer_revenue cr
    ON c.customer_id = cr.customer_id
ORDER BY cr.total_revenue DESC;
