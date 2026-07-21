CREATE DATABASE IF NOT EXISTS olist CHARACTER SET utf8mb4;
USE olist;

ALTER TABLE orders
  MODIFY order_purchase_timestamp DATETIME,
  MODIFY order_delivered_customer_date DATETIME;

-- Example cleanup for empty strings 
UPDATE customers
SET customer_zip_code_prefix = NULL
WHERE customer_zip_code_prefix = '';

UPDATE products
SET product_category_name = NULL
WHERE product_category_name = '';
