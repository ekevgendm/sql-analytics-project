SELECT *
FROM employees;


SELECT name, salary
FROM employees
WHERE salary > 100000
ORDER BY salary DESC;


SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY employee_count DESC;


SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 90000
ORDER BY average_salary DESC;
