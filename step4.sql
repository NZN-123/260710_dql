-- 조건식
SELECT
    product_name,
    price,
    stock_quantity
FROM
    products;

SELECT
    product_name,
    price,
    stock_quantity,
    -- '등급' AS '제품등급'
    -- 평가식을 각각 가져가는 CASE
    CASE
        WHEN price >= 1000000 THEN '프리미엄'
        WHEN price >= 100000 THEN '미드레인지'
        ELSE '보급형'
        END
    -- 조건 만족 X -> NULL
    AS '제품등급',
    CASE
        WHEN stock_quantity = 0 THEN '품절'
        WHEN stock_quantity <= 20 THEN '품절 임박'
        ELSE '여유'
        END
    AS '재고상태',
    category,
    -- Electronics, Accessories, Fashion, Living
    -- 일치를 보는 문법
    CASE category
        WHEN 'Electronics' THEN 'John'
        WHEN 'Accessories' THEN 'Jane'
        ELSE 'Chris'
        END
    AS '담당직원',
	-- 1가지 조건이 메인이라면
    IF(product_name LIKE '%아이폰%', '애플',
       IF(product_name LIKE '%갤럭시%', '삼성', '삼성 아닌 것'))
    AS '제조사'
FROM
    products;

SELECT
    *
FROM  products;

SELECT
    count(*),
    count(discount),
    count(DISTINCT discount)
FROM  sales_records;

SELECT
    count(*), -- 겹치지 않는
    count(category), -- 열에 속한 데이터를
    count(DISTINCT category), -- 안 겹치는 열을 셈
    SUM(stock_quantity),
    AVG(price),
    MAX(price),
    MIN(price)
FROM  products;

