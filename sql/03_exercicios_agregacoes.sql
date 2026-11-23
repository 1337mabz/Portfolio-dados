-- ============================================================
-- BATERIA DE EXERCÍCIOS — AULA 2 (agregações)
-- Banco: duckdb data/olist.duckdb
-- Tente sem olhar resposta. Anote onde travar.
-- ============================================================

-- COLUNAS ÚTEIS (para consulta rápida)
--   orders:       order_id, customer_id, order_status, order_purchase_timestamp,
--                 order_delivered_customer_date, order_estimated_delivery_date
--   customers:    customer_id, customer_unique_id, customer_city, customer_state
--   order_items:  order_id, order_item_id, product_id, seller_id, price, freight_value
--   payments:     order_id, payment_type, payment_installments, payment_value
--   reviews:      order_id, review_score
--   products:     product_id, product_category_name, product_weight_g
--   sellers:      seller_id, seller_city, seller_state

-- ============================================================
-- NÍVEL 1 — aquecimento (COUNT, MIN, MAX)
-- ============================================================

-- 1.1 Quantos pedidos existem no total?
--     E quantos clientes únicos (customer_unique_id)?

-- 1.2 Quantos pedidos têm status 'canceled'?

-- 1.3 Qual o maior e o menor valor de pagamento (payments)?
--     Mostre também a média, arredondada em 2 casas.

-- 1.4 Quantas avaliações (reviews) têm nota 5?

-- ============================================================
-- NÍVEL 2 — GROUP BY (o coração)
-- ============================================================

-- 2.1 Quantos pedidos por status? Ordene do maior para o menor.

-- 2.2 Top 10 estados com mais vendedores (sellers).

-- 2.3 Ticket médio por tipo de pagamento.
--     Mostre só os tipos com MAIS de 1.000 pagamentos.

-- 2.4 Quantos clientes por cidade? Traga só as 10 cidades com mais clientes.

-- ============================================================
-- NÍVEL 3 — datas e múltiplas colunas
-- ============================================================

-- 3.1 Quantos pedidos por ano? (use date_trunc('year', ...))

-- 3.2 Quantos pedidos por status E por ano, considerando só 2017 e 2018.
--     Ordene por ano e, dentro de cada ano, do status mais frequente
--     para o menos frequente.

-- 3.3 Média de itens por pedido na tabela order_items.
--     Dica: itens = count(*), pedidos = count(DISTINCT order_id).
--     Cuidado com divisão inteira.

-- 3.4 Qual a nota média das avaliações por mês em 2018?
--     (reviews tem review_creation_date)

-- ============================================================
-- NÍVEL 4 — % do total e ranking
-- ============================================================

-- 4.1 Qual o percentual de pedidos por status sobre o total?
--     Mostre status, quantidade e pct (2 casas).

-- 4.2 Top 5 categorias de produto por PESO MÉDIO,
--     considerando só categorias com mais de 50 produtos.

-- 4.3 Quais as 3 cidades com mais clientes dentro do estado de SP?
--     (Dica: WHERE customer_state = 'SP' + ORDER BY + LIMIT)

-- 4.4 Desafio: para cada estado, mostre o total de clientes e o
--     percentual que aquele estado representa do total de clientes.
--     Ordene do maior para o menor e traga só os 10 primeiros.

-- ============================================================
-- CHECKLIST antes de rodar
-- ============================================================
-- [ ] Tem FROM?
-- [ ] Cada item do SELECT separado por vírgula?
-- [ ] Toda coluna solta está no GROUP BY?
-- [ ] WHERE filtra linhas / HAVING filtra grupos?
-- [ ] ORDER BY aponta para a coluna certa?
-- [ ] Texto entre aspas simples?
-- [ ] Query termina com ponto e vírgula?
