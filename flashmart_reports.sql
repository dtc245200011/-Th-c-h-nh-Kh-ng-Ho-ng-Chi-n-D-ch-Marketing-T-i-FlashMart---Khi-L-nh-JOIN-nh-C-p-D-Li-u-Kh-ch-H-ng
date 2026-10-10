-- flashmart_reports.sql
-- Tạo database và dùng
CREATE DATABASE IF NOT EXISTS flashmart_db;
USE flashmart_db;

-- Tạo bảng
CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Chèn dữ liệu mẫu
INSERT INTO Customers VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO Products VALUES (101, 'Laptop'), (102, 'Mouse'), (103, 'Keyboard');

INSERT INTO Orders VALUES (1001, 1, 101), (1002, 1, 102), (1003, 2, 101);

-- ============================
-- Báo cáo Marketing (đúng)
-- Giữ tất cả khách hàng, kể cả chưa mua
-- ============================
SELECT c.customer_id,
       c.name,
       COALESCE(COUNT(o.order_id), 0) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY c.customer_id;

-- ============================
-- Báo cáo Kho vận (Anti-Join)
-- Các sản phẩm chưa từng được bán
-- ============================
SELECT p.product_id,
       p.product_name
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_id IS NULL
ORDER BY p.product_id;
