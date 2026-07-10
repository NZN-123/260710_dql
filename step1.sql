SELECT now();
SELECT 1 + 1;

CREATE TABLE products (
                          product_id INT AUTO_INCREMENT PRIMARY KEY,
                          product_name VARCHAR(100) NOT NULL,
                          category CHAR(15) NOT NULL,
                          price DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
                          stock_quantity INT NOT NULL DEFAULT 0
);

CREATE TABLE sales_records (
                               sale_id INT AUTO_INCREMENT PRIMARY KEY,
                               product_id INT NOT NULL,
                               sale_date DATE NOT NULL, # 날짜형
                                   quantity INT NOT NULL,
                               unit_price DECIMAL(10, 2) NOT NULL,
                               discount DECIMAL(5, 2) DEFAULT NULL,
                               customer_email VARCHAR(100) DEFAULT NULL
); # 세미콜론에 맞춰서 ctrl(cmd) + enter

INSERT INTO products (
 product_id, product_name, category, price, stock_quantity)
VALUES
(1, '아이폰 15', 'Electronics', 1250000.00, 50),
(2, '갤럭시 S24', 'Electronics', 1150000.00, 45),
(3, '기계식 키보드', 'Accessories', 150000.00, 100),
(4, '무선 마우스', 'Accessories', 89000.00, 120),
(5, '가죽 여권 지갑', 'Fashion', 45000.00, 30),
(6, '노이즈캔슬링 헤드폰', 'Electronics', 350000.00, 15),
(7, '머그컵', 'Living', 15000.00, 10),
(8, '친환경 에코백', 'Fashion', 25000.00, 80);

INSERT INTO sales_records (
    product_id, sale_date, quantity, unit_price, discount, customer_email)
VALUES
    (1, '2026-07-01', 2, 1250000.00, NULL, '  user1@gmail.com  '),
    (2, '2026-07-01', 1, 1150000.00, 0.10, 'USER2@naver.com'),
    (3, '2026-07-02', 3, 150000.00, 0.05, '   user3@daum.net'),
    (4, '2026-07-02', 5, 89000.00, NULL, 'user4@gmail.com'),
    (1, '2026-07-03', 1, 1250000.00, 0.15, '  USER5@GMAIL.COM '),
    (5, '2026-07-04', 2, 45000.00, NULL, NULL),
    (6, '2026-07-05', 1, 350000.00, 0.05, 'user6@outlook.com'),
    (2, '2026-07-05', 2, 1150000.00, NULL, '  user2@naver.com');

SELECT * FROM products;
SELECT product_id, product_name, price FROM products;

SELECT
    product_id AS '상품ID' ,
    product_name AS '상품명',
    price AS '가격'
FROM
    products;

SELECT category FROM products;
SELECT DISTINCT category FROM products;

SELECT product_name, price
FROM products
WHERE price > 100000;

SELECT product_name, category, price
FROM products
WHERE category = 'Electronics';

SELECT product_name, category, price, stock_quantity
FROM products
WHERE category = 'Electronics'
   OR stock_quantity >= 100
    AND price >= 500000;

SELECT product_name, category, price, stock_quantity
FROM products
WHERE NOT category = 'Electronics';

