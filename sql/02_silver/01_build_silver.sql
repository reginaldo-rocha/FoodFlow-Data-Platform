CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_silver.orders` AS
SELECT
  SAFE_CAST(store_id AS INT64) AS store_id,
  SAFE_CAST(order_id AS INT64) AS order_id,
  TRIM(CAST(order_type AS STRING)) AS order_type,
  SAFE_CAST(order_date AS DATE) AS order_date,
  SAFE_CAST(order_value AS NUMERIC) AS order_value,
  NULLIF(TRIM(CAST(delivery_address AS STRING)), '') AS delivery_address,
  SAFE_CAST(delivery_fee AS NUMERIC) AS delivery_fee,
  UPPER(TRIM(CAST(status AS STRING))) AS status
FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.orders`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_silver.order_items` AS
SELECT
  SAFE_CAST(order_id AS INT64) AS order_id,
  SAFE_CAST(order_item_id AS INT64) AS order_item_id,
  SAFE_CAST(product_id AS INT64) AS product_id,
  SAFE_CAST(quantity AS INT64) AS quantity,
  SAFE_CAST(item_value AS NUMERIC) AS item_value,
  NULLIF(TRIM(CAST(observation AS STRING)), '') AS observation
FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.order_items`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_silver.product` AS
SELECT SAFE_CAST(product_id AS INT64) AS product_id,
       TRIM(CAST(product_name AS STRING)) AS product_name
FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.product`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_silver.store` AS
SELECT SAFE_CAST(store_id AS INT64) AS store_id,
       TRIM(CAST(store_name AS STRING)) AS store_name,
       SAFE_CAST(state_id AS INT64) AS state_id
FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.store`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_silver.state` AS
SELECT SAFE_CAST(state_id AS INT64) AS state_id,
       SAFE_CAST(country_id AS INT64) AS country_id,
       TRIM(CAST(state_name AS STRING)) AS state_name
FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.state`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_silver.country` AS
SELECT SAFE_CAST(country_id AS INT64) AS country_id,
       TRIM(CAST(country_name AS STRING)) AS country_name
FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.country`;
