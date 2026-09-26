CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_gold.dim_product` AS
SELECT DISTINCT product_id, product_name
FROM `project-b6981681-c5fc-44db-ac7.foodflow_silver.product`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_gold.dim_store` AS
SELECT DISTINCT
  s.store_id,
  s.store_name,
  st.state_id,
  st.state_name,
  c.country_id,
  c.country_name
FROM `project-b6981681-c5fc-44db-ac7.foodflow_silver.store` s
LEFT JOIN `project-b6981681-c5fc-44db-ac7.foodflow_silver.state` st
  ON s.state_id = st.state_id
LEFT JOIN `project-b6981681-c5fc-44db-ac7.foodflow_silver.country` c
  ON st.country_id = c.country_id;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_gold.fact_order_items` AS
SELECT
  o.order_id,
  oi.order_item_id,
  o.order_date,
  o.store_id,
  oi.product_id,
  o.order_type,
  o.status,
  oi.quantity,
  oi.item_value,
  o.order_value,
  o.delivery_fee
FROM `project-b6981681-c5fc-44db-ac7.foodflow_silver.orders` o
INNER JOIN `project-b6981681-c5fc-44db-ac7.foodflow_silver.order_items` oi
  ON o.order_id = oi.order_id;
