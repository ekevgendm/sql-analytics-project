CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO departments (department_name)
VALUES
    ('Sales'),
    ('Marketing'),
    ('IT'),
    ('Finance');


CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(department_id),
    salary NUMERIC(10, 2),
    hire_date DATE
);

INSERT INTO employees (name, department_id, salary, hire_date)
VALUES
    ('Anna Petrova', 1, 95000, '2022-03-15'),
    ('Ivan Smirnov', 1, 78000, '2023-06-10'),
    ('Maria Volkova', 2, 85000, '2021-11-20'),
    ('Alexey Orlov', 2, 72000, '2024-01-12'),
    ('Elena Sokolova', 3, 125000, '2022-09-05'),
    ('Dmitry Kozlov', 3, 110000, '2023-02-18'),
    ('Olga Morozova', 4, 105000, '2021-07-30'),
    ('Sergey Fedorov', 4, 82000, '2024-04-22');


CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    registration_date DATE
);

INSERT INTO customers (name, city, registration_date)
VALUES
    ('Pavel Ivanov', 'Moscow', '2024-01-15'),
    ('Sofia Petrova', 'Saint Petersburg', '2024-02-10'),
    ('Nikita Volkov', 'Moscow', '2024-03-05'),
    ('Irina Smirnova', 'Kazan', '2024-04-18'),
    ('Roman Kuznetsov', 'Moscow', '2024-05-22'),
    ('Alina Morozova', 'Sochi', '2024-06-30');


CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    price NUMERIC(10, 2),
    stock_quantity INT
);

INSERT INTO products (product_name, category, price, stock_quantity)
VALUES
    ('Laptop Pro 15', 'Electronics', 120000, 15),
    ('Wireless Headphones', 'Electronics', 18000, 42),
    ('Smartphone X', 'Electronics', 85000, 25),
    ('Office Chair', 'Home', 32000, 18),
    ('Desk Lamp', 'Home', 7500, 60),
    ('Running Shoes', 'Sports', 14000, 35),
    ('Yoga Mat', 'Sports', 4500, 80),
    ('Winter Jacket', 'Clothing', 22000, 20);


CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    status VARCHAR(50)
);

INSERT INTO orders (customer_id, order_date, status)
VALUES
    (1, '2024-07-01', 'completed'),
    (2, '2024-07-03', 'completed'),
    (3, '2024-07-05', 'cancelled'),
    (1, '2024-07-10', 'completed'),
    (4, '2024-07-12', 'completed'),
    (5, '2024-07-15', 'processing'),
    (6, '2024-07-18', 'completed'),
    (2, '2024-07-20', 'completed');


CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    unit_price NUMERIC(10, 2)
);

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 1, 120000),
    (1, 2, 2, 18000),
    (2, 6, 1, 14000),
    (2, 7, 2, 4500),
    (3, 3, 1, 85000),
    (4, 4, 1, 32000),
    (4, 5, 2, 7500),
    (5, 8, 1, 22000),
    (6, 1, 1, 120000),
    (7, 2, 1, 18000),
    (7, 7, 1, 4500),
    (8, 6, 2, 14000);
