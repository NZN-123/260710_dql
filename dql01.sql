SELECT
    *
FROM
    products;

SELECT
    category,
    price
FROM
    products;

SELECT
    category,
    count(*) AS '상품 수'
FROM
    products
GROUP BY
    category;

SELECT
    category,
    COUNT(*) AS '상품 수',
 -- 집계 함수를 사용하면 각각 그룹별 값을 볼 수 있다
    AVG(price) AS '가격 평균'
FROM
    products
GROUP BY
    category;

SELECT
    category,
    COUNT(*) AS '상품 수',
 	-- 집계 함수를 사용하면 각각 그룹별 값을 볼 수 있다
    AVG(price) AS '가격 평균'
FROM
    products
GROUP BY
    category
HAVING AVG(price) > 100000;

