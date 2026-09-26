-- Receita por dia
SELECT
  order_date,
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(SUM(item_value * quantity), 2) AS revenue
FROM `project-b6981681-c5fc-44db-ac7.foodflow_gold.fact_order_items`
GROUP BY order_date
ORDER BY order_date;

-- Receita por produto
SELECT
  p.product_name,
  SUM(f.quantity) AS quantity_sold,
  ROUND(SUM(f.item_value * f.quantity), 2) AS revenue
FROM `project-b6981681-c5fc-44db-ac7.foodflow_gold.fact_order_items` f
LEFT JOIN `project-b6981681-c5fc-44db-ac7.foodflow_gold.dim_product` p
  ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Receita por unidade
SELECT
  s.store_name,
  s.state_name,
  COUNT(DISTINCT f.order_id) AS total_orders,
  SUM(f.quantity) AS total_items,
  ROUND(SUM(f.item_value * f.quantity), 2) AS revenue
FROM `project-b6981681-c5fc-44db-ac7.foodflow_gold.fact_order_items` f
LEFT JOIN `project-b6981681-c5fc-44db-ac7.foodflow_gold.dim_store` s
  ON f.store_id = s.store_id
GROUP BY s.store_name, s.state_name
ORDER BY revenue DESC;
