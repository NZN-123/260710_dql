SELECT * FROM products;
SELECT
    product_name,
    price
FROM
    products;


SELECT * FROM products;
SELECT
    product_name,
    price
FROM
    products
WHERE
    price >= 50000 AND price <= 300000;

SELECT
    product_name,
    category,
    price
FROM
    products
WHERE
   -- SQL 엔진/툴마다 작동 방식이 다르긴 한데, ''가 대표적으로 문자/문자열 입력
    category = 'Electronics'
   OR category = 'Accessories';


SELECT
    product_name,
    category,
    price
FROM
    products
WHERE
    category IN ('Electronics', 'Accessories');


SELECT
    product_name,
    category,
    price
FROM
    products
WHERE
    #	product_name LIKE '%마우스%';
#	product_name LIKE '%이%';
	product_name LIKE '__폰%';

SELECT
    product_name,
    category,
    price
FROM
    products;

SELECT
    product_name,
    category,
    price
FROM
    products
-- WHERE...
ORDER BY price ASC;

SELECT
    product_name,
    category,
    price
FROM
    products
-- WHERE...
ORDER BY price DESC;

SELECT
    product_name,
    category,
    price
FROM
    products
-- 문자도 정렬 가능
ORDER BY category DESC, price ASC;

SELECT
    product_name,
    category,
    price
FROM
    products
-- 문자도 정렬 가능
ORDER BY category DESC, price ASC
    LIMIT 5;

SELECT
    product_name,
    category,
    price
FROM
    products
-- 문자도 정렬 가능
ORDER BY category DESC, price ASC
    LIMIT 1, 5;






