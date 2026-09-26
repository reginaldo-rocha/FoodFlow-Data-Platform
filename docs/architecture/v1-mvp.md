# V1.0 — MVP Funcional

## Objetivo
Estabelecer um pipeline funcional em BigQuery com arquitetura em camadas.

## Fluxo
Bronze → Silver → Gold → Analytics

## Resultado
A V1.0 foi concluída com sucesso:
- Bronze criada com 6 entidades;
- Silver criada com padronização básica;
- Gold criada com modelo analítico;
- consultas analíticas executadas com sucesso.

## Limitações conhecidas
- sem Data Quality automatizada;
- sem Schema Validation;
- sem idempotência;
- sem MERGE/UPSERT;
- sem carga incremental;
- sem observabilidade;
- sem tratamento de schema evolution.

Esses itens compõem o roadmap das próximas versões.
