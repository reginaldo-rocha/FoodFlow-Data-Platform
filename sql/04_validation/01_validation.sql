-- Contagens Bronze
SELECT 'orders' AS table_name, COUNT(*) AS total_rows
FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.orders`
UNION ALL
SELECT 'order_items', COUNT(*) FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.order_items`
UNION ALL
SELECT 'product', COUNT(*) FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.product`
UNION ALL
SELECT 'store', COUNT(*) FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.store`
UNION ALL
SELECT 'state', COUNT(*) FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.state`
UNION ALL
SELECT 'country', COUNT(*) FROM `project-b6981681-c5fc-44db-ac7.foodflow_bronze.country`;

-- Itens sem pedido
SELECT oi.order_id, oi.order_item_id
FROM `project-b6981681-c5fc-44db-ac7.foodflow_silver.order_items` oi
LEFT JOIN `project-b6981681-c5fc-44db-ac7.foodflow_silver.orders` o
  ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Produto desconhecido na fato
SELECT DISTINCT f.product_id
FROM `project-b6981681-c5fc-44db-ac7.foodflow_gold.fact_order_items` f
LEFT JOIN `project-b6981681-c5fc-44db-ac7.foodflow_gold.dim_product` p
  ON f.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Unidade desconhecida na fato
SELECT DISTINCT f.store_id
FROM `project-b6981681-c5fc-44db-ac7.foodflow_gold.fact_order_items` f
LEFT JOIN `project-b6981681-c5fc-44db-ac7.foodflow_gold.dim_store` s
  ON f.store_id = s.store_id
WHERE s.store_id IS NULL;
