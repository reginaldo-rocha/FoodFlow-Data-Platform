# 🍽️ FoodFlow Data Platform

![FoodFlow Data Platform](assets/foodflow-banner.png)

## From Batch Pipeline to Production-Ready Data Platform

Projeto autoral de Engenharia de Dados que demonstra a evolução de um pipeline batch
desde um MVP funcional até uma plataforma mais próxima de produção.

A ideia central é simples: **não adicionar ferramentas por adicionar**, mas evoluir a
arquitetura à medida que problemas reais aparecem.

---

## 🎯 Contexto

## 🎯 Contexto do projeto

A **FoodFlow Restaurants** é uma empresa fictícia que começou com poucas unidades e cresceu ao longo do tempo.

Com a expansão da operação, aumentou também o volume de dados gerados diariamente, principalmente relacionados a:

- pedidos;
- itens vendidos;
- valores;
- status das vendas;
- canais de atendimento;
- unidades responsáveis pelas vendas.

Além dos dados operacionais, a matriz também mantém dados mestres sobre:

- produtos;
- unidades;
- estados;
- países.

À medida que a empresa cresceu, surgiu a necessidade de centralizar essas informações, reduzir processos manuais e disponibilizar dados de forma mais rápida e confiável para análise e tomada de decisão.

Foi a partir desse cenário que surgiu o **FoodFlow Data Platform**.

A primeira versão do projeto foi criada com o objetivo de estabelecer uma arquitetura base funcional, capaz de receber os dados, organizá-los em camadas e disponibilizá-los para consumo analítico.

O fluxo inicial foi definido como:

**Dados de origem → Bronze → Silver → Gold → BigQuery → Analytics**

A proposta do projeto é evoluir essa arquitetura gradualmente.

A cada nova versão, um novo desafio de Engenharia de Dados será introduzido, analisado e resolvido.

Entre as próximas evoluções estão:

- Data Quality;
- Schema Validation;
- idempotência;
- reprocessamento;
- carga incremental;
- observabilidade;
- Schema Evolution;
- governança;
- segurança;
- FinOps.

O objetivo é demonstrar como uma arquitetura simples pode ganhar maturidade à medida que novos problemas e necessidades de negócio aparecem.

---

## 🏗️ Arquitetura V1.0

```text
CSV + Dados Mestres
        ↓
foodflow_bronze
        ↓
foodflow_silver
        ↓
foodflow_gold
        ↓
BigQuery Analytics
```

### Bronze
Preserva os dados próximos da origem, com nomenclatura padronizada para o projeto.

### Silver
Aplica limpeza e padronização básica:

- `SAFE_CAST`
- `TRIM`
- `NULLIF`
- padronização de status
- padronização de tipos

### Gold
Modelo analítico simples:

- `dim_product`
- `dim_store`
- `fact_order_items`

---

## ✅ V1.0 concluída

A primeira versão já está funcionando no BigQuery.

Validações executadas:

- contagem consistente entre Bronze e Silver;
- relacionamento entre pedidos e itens;
- integridade com dimensões;
- consultas analíticas executadas com sucesso.

Exemplo de saída analítica já validada:

- 15 pedidos processados;
- receita analítica calculada a partir da camada Gold;
- consultas por data, produto, unidade e canal.

---

## 🚀 Roadmap

- **V1.0** — MVP funcional ✅
- **V1.1** — Data Quality + Schema Validation
- **V1.2** — Idempotência + Reprocessamento
- **V1.3** — Carga incremental
- **V1.4** — Observabilidade + tratamento de falhas
- **V1.5** — Schema Evolution
- **V1.6** — Governança + Segurança
- **V1.7** — FinOps + Performance
- **V2.0** — Alertas + Recomendações

---

## 🧠 Estratégia de evolução

Cada nova versão segue:

```text
Problema
   ↓
Risco
   ↓
Decisão
   ↓
Implementação
   ↓
Resultado
```

---

## 📁 Estrutura

```text
foodflow-data-platform/
├── README.md
├── assets/
├── docs/
│   ├── architecture/
│   ├── screenshots/
│   └── roadmap/
├── sql/
│   ├── 00_setup/
│   ├── 01_bronze/
│   ├── 02_silver/
│   ├── 03_gold/
│   └── 04_validation/
└── .gitignore
```

---

## 📸 Implementação no BigQuery

### Estrutura das camadas

<img width="1897" height="931" alt="image" src="https://github.com/user-attachments/assets/c4c3cd44-09f2-4fb9-824e-102649d21e74" />


### Validação das camadas

<img width="1901" height="963" alt="image" src="https://github.com/user-attachments/assets/1fb25e63-5aa7-4f19-8ae6-4a2aa7dff886" />


### Modelo Gold

<img width="1900" height="960" alt="image" src="https://github.com/user-attachments/assets/348305d3-cae8-4384-ba9c-7f8f8a3668bc" />


### Consulta analítica

<img width="1899" height="921" alt="image" src="https://github.com/user-attachments/assets/b0ea0ed4-41b9-4a2a-950e-c2f551e9bc45" />


## 👨‍💻 Autor

Reginaldo Rocha  
Engenharia de Dados | Cloud | Observabilidade | FinOps
