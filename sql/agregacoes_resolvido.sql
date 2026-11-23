-- ============================================================
-- EXERCÍCIOS RESOLVIDOS — AULA 2 (agregações)
-- Banco: duckdb data/olist.duckdb
-- Rodar:  duckdb data/olist.duckdb -f sql/agregacoes_resolvido.sql
-- ============================================================

-- ------------------------------------------------------------
-- 1) Top 10 estados com mais clientes
-- ------------------------------------------------------------
SELECT customer_state,
       count(*) AS clientes
FROM customers
GROUP BY customer_state
ORDER BY clientes DESC
LIMIT 10;

-- Leitura: SP tem mais clientes que RJ + MG juntos.
-- ES (2.033) e GO (2.020) praticamente empatados.

-- ------------------------------------------------------------
-- 2) Por tipo de pagamento: quantidade, total, ticket médio e %
-- ------------------------------------------------------------
SELECT payment_type,
       count(*)                                        AS qtd,
       round(sum(payment_value), 2)                    AS total,
       round(avg(payment_value), 2)                    AS ticket_medio,
       round(100.0 * sum(payment_value)
             / sum(sum(payment_value)) OVER (), 2)     AS pct_total
FROM payments
GROUP BY payment_type
ORDER BY total DESC;

-- Leitura: cartão de crédito concentra ~78% do faturamento.
-- Voucher tem ticket baixo porque é cupom/desconto.

-- ------------------------------------------------------------
-- 3) Top 10 categorias de produto por quantidade
-- ------------------------------------------------------------
SELECT product_category_name,
       count(*)                                        AS produtos,
       round(100.0 * count(*)
             / sum(count(*)) OVER (), 2)               AS pct
FROM products
WHERE product_category_name IS NOT NULL
GROUP BY product_category_name
ORDER BY produtos DESC
LIMIT 10;

-- Leitura: as 10 maiores categorias somam ~64% do catálogo.
-- Versão com ranking (sem LIMIT):
--   QUALIFY row_number() OVER (ORDER BY count(*) DESC) <= 10

-- ------------------------------------------------------------
-- 4) Pedidos entregues por mês em 2018
-- ------------------------------------------------------------
SELECT strftime(date_trunc('month', order_purchase_timestamp), '%Y-%m') AS mes,
       count(*) AS pedidos
FROM orders
WHERE order_status = 'delivered'
  AND order_purchase_timestamp >= '2018-01-01'
  AND order_purchase_timestamp <  '2019-01-01'
GROUP BY mes
ORDER BY mes;

-- Leitura: o dataset termina em agosto/2018 (só 8 meses).
-- Junho/2018 tem o menor volume, reflexo da greve dos caminhoneiros.
