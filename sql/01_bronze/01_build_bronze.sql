CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_bronze.orders` AS
SELECT
  Id_Unidade AS store_id,
  Id_Pedido AS order_id,
  Tipo_Pedido AS order_type,
  Data_Pedido AS order_date,
  Vlr_Pedido AS order_value,
  Endereco_Entrega AS delivery_address,
  Taxa_Entrega AS delivery_fee,
  Status AS status
FROM `project-b6981681-c5fc-44db-ac7.bronze.pedido`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_bronze.order_items` AS
SELECT
  Id_Pedido AS order_id,
  Id_Item_Pedido AS order_item_id,
  Id_Produto AS product_id,
  Qtd AS quantity,
  Vlr_Item AS item_value,
  Observacao AS observation
FROM `project-b6981681-c5fc-44db-ac7.bronze.item pedido`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_bronze.product` AS
SELECT Id_Produto AS product_id, Nome_Produto AS product_name
FROM `project-b6981681-c5fc-44db-ac7.bronze.produto`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_bronze.store` AS
SELECT Id_Unidade AS store_id, Nome_Unidade AS store_name, Id_Estado AS state_id
FROM `project-b6981681-c5fc-44db-ac7.bronze.unidade`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_bronze.state` AS
SELECT Id_Estado AS state_id, Id_Pais AS country_id, Nome_Estado AS state_name
FROM `project-b6981681-c5fc-44db-ac7.bronze.estado`;

CREATE OR REPLACE TABLE `project-b6981681-c5fc-44db-ac7.foodflow_bronze.country` AS
SELECT Id_Pais AS country_id, Nome_Pais AS country_name
FROM `project-b6981681-c5fc-44db-ac7.bronze.pais`;
