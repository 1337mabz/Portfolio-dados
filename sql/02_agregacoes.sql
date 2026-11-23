-- ============================================================
-- AULA 2 — AGREGAÇÕES: COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING
-- Abrir:  cd ~/Documentos/portfolio-dados && duckdb data/olist.duckdb
-- ============================================================

-- ------------------------------------------------------------
-- 1) Agregar a tabela inteira em UMA linha
--    COUNT(*) conta linhas | COUNT(col) ignora NULL
-- ------------------------------------------------------------
SELECT count(*) AS total_pedidos
FROM orders;

SELECT count(*)               AS linhas,
       count(DISTINCT customer_id) AS clientes_unicos
FROM orders;

-- ------------------------------------------------------------
-- 2) SUM, AVG, MIN, MAX
-- ------------------------------------------------------------
SELECT round(sum(payment_value), 2) AS total_pago,
       round(avg(payment_value), 2) AS ticket_medio,
       min(payment_value)           AS menor,
       max(payment_value)           AS maior
FROM payments;

-- ------------------------------------------------------------
-- 3) GROUP BY — uma linha por grupo
--    "para cada X, me mostre Y"
-- ------------------------------------------------------------
SELECT order_status,
       count(*) AS pedidos
FROM orders
GROUP BY order_status
ORDER BY pedidos DESC;

-- ------------------------------------------------------------
-- 4) Agrupar por mais de uma coluna
-- ------------------------------------------------------------
SELECT payment_type,
       payment_installments,
       count(*)                    AS qtd,
       round(avg(payment_value),2) AS ticket_medio
FROM payments
GROUP BY payment_type, payment_installments
ORDER BY payment_type, qtd DESC;

-- ------------------------------------------------------------
-- 5) HAVING — filtra DEPOIS de agrupar (WHERE filtra linhas)
--    WHERE  -> antes do GROUP BY
--    HAVING -> depois do GROUP BY
-- ------------------------------------------------------------
SELECT customer_state,
       count(*) AS clientes
FROM customers
GROUP BY customer_state
HAVING count(*) > 5000
ORDER BY clientes DESC;

-- ------------------------------------------------------------
-- 6) Agrupar por mês (datas)
-- ------------------------------------------------------------
SELECT date_trunc('month', order_purchase_timestamp) AS mes,
       count(*) AS pedidos
FROM orders
WHERE order_purchase_timestamp >= '2017-01-01'
  AND order_purchase_timestamp <  '2018-01-01'
GROUP BY mes
ORDER BY mes;

-- ============================================================
-- EXERCÍCIOS
-- ============================================================
-- 1) Top 10 estados com mais clientes.
-- 2) Por tipo de pagamento: quantidade, total pago e ticket médio,
--    ordenado do maior total para o menor.
-- 3) Top 10 categorias de produto com mais produtos cadastrados.
-- 4) Quantos pedidos por mês em 2018 (só status 'delivered').

-- ============================================================
-- RESPOSTAS
-- ============================================================
-- 1)
-- SELECT customer_state, count(*) AS clientes
-- FROM customers
-- GROUP BY customer_state
-- ORDER BY clientes DESC
-- LIMIT 10;

-- 2)
-- SELECT payment_type,
--        count(*)                    AS qtd,
--        round(sum(payment_value),2) AS total,
--        round(avg(payment_value),2) AS ticket_medio
-- FROM payments
-- GROUP BY payment_type
-- ORDER BY total DESC;

-- 3)
-- SELECT product_category_name, count(*) AS produtos
-- FROM products
-- WHERE product_category_name IS NOT NULL
-- GROUP BY product_category_name
-- ORDER BY produtos DESC
-- LIMIT 10;

-- 4)
-- SELECT date_trunc('month', order_purchase_timestamp) AS mes,
--        count(*) AS pedidos
-- FROM orders
-- WHERE order_status = 'delivered'
--   AND order_purchase_timestamp >= '2018-01-01'
--   AND order_purchase_timestamp <  '2019-01-01'
-- GROUP BY mes
-- ORDER BY mes;

-- ============================================================
-- EXTRA — % DO TOTAL (window function)
-- ============================================================
-- Ideia: pct = total do grupo / total geral * 100
-- O OVER () enxerga o resultado inteiro, não só o grupo.
--
--   sum(payment_value)             -> total do grupo
--   sum(sum(payment_value)) OVER () -> total geral
--
SELECT payment_type,
       round(sum(payment_value), 2) AS total,
       round(100.0 * sum(payment_value) / sum(sum(payment_value)) OVER (), 2) AS pct
FROM payments
GROUP BY payment_type
ORDER BY total DESC;

-- Alternativa sem window function: CTE + subquery
WITH por_tipo AS (
    SELECT payment_type, sum(payment_value) AS total
    FROM payments
    GROUP BY payment_type
)
SELECT payment_type,
       round(total, 2) AS total,
       round(100.0 * total / (SELECT sum(total) FROM por_tipo), 2) AS pct
FROM por_tipo
ORDER BY total DESC;

-- ============================================================
-- EXTRA — QUALIFY e ranking
-- ============================================================
-- QUALIFY filtra o resultado de uma window function
-- (como o HAVING filtra o resultado do GROUP BY).

-- Top 10 categorias por quantidade, sem LIMIT
SELECT product_category_name,
       count(*) AS produtos,
       round(100.0 * count(*) / sum(count(*)) OVER (), 2) AS pct
FROM products
WHERE product_category_name IS NOT NULL
GROUP BY 1
QUALIFY row_number() OVER (ORDER BY count(*) DESC) <= 10
ORDER BY produtos DESC;

-- row_number x rank x dense_rank (com valores 10, 10, 8, 5):
--   row_number -> 1, 2, 3, 4   (nunca empata)
--   rank       -> 1, 1, 3, 4   (empata e pula)
--   dense_rank -> 1, 1, 2, 3   (empata sem pular)

-- Top 1 por estado (padrão "top N por grupo")
SELECT customer_state,
       count(*) AS clientes
FROM customers
GROUP BY customer_state
QUALIFY row_number() OVER (ORDER BY count(*) DESC) = 1
ORDER BY clientes DESC;

-- ============================================================
-- ORDEM DE EXECUÇÃO DE UMA QUERY
-- ============================================================
-- FROM -> WHERE -> GROUP BY -> HAVING -> WINDOW -> QUALIFY
--      -> SELECT -> ORDER BY -> LIMIT

-- ============================================================
-- ATALHOS DO DUCKDB
-- ============================================================
-- GROUP BY ALL      agrupa por todas as colunas não agregadas
-- GROUP BY 1        agrupa pela posição da coluna no SELECT
-- ORDER BY 2        ordena pela posição da coluna no SELECT
-- SUMMARIZE tabela  perfil completo (min, max, média, quartis, nulos)
-- SELECT * EXCLUDE (col)  tudo menos a coluna
