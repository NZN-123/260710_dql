SELECT * FROM sales_records;

SELECT
    sale_id,
    product_id,
    discount
FROM sales_records;

SELECT
    sale_id,
    product_id,
    discount
FROM sales_records
WHERE discount = NULL;

SELECT
    sale_id,
    product_id,
    discount
FROM sales_records
WHERE discount IS NULL;

SELECT
    sale_id,
    product_id,
    discount
FROM sales_records
WHERE discount IS NOT NULL;

SELECT
    sale_id,
    discount,
    IFNULL(discount, 0.00) AS 'IFNULL-discount',
    IFNULL(discount, 'X') AS 'IFNULL-discount2'
    COALESCE(discount, 0.00) AS 'IFNULL-discount3'
FROM sales_records;

SELECT
    *
FROM
    products, sales_records
WHERE
    products.product_id = sales_records.product_id;

SELECT
    product_name ,
    customer_email,
    TRIM(customer_email) AS '공백제거 이메일',
    LOWER(customer_email) AS '소문자 이메일',
    UPPER(customer_email) AS '대문자 이메일',
    LOWER(TRIM(customer_email)) AS '공백제거 후 소문자 이메일',
    SUBSTRING(customer_email, 1, 4) AS '부분 문자열 추출',
    SUBSTRING(TRIM(customer_email), 1, 4) AS '공백제거 후 부분 문자열 추출'
FROM
    products, sales_records
WHERE
    products.product_id = sales_records.product_id;

SELECT
    product_name ,
    customer_email,
    product_name || ' ' || TRIM(customer_email),
    CONCAT(product_name, ' ', TRIM(customer_email)),
    CONCAT_WS('-', product_name, TRIM(customer_email))
FROM
    products, sales_records
WHERE
    products.product_id = sales_records.product_id;



