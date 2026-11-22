-- ============================================================
-- AULA 1 — SELECT, FROM, LIMIT, ORDER BY, WHERE
-- Como abrir:  cd ~/Documentos/portfolio-dados
--              duckdb data/olist.duckdb
-- Sair:        .quit   (ou Ctrl+D)
-- ============================================================

-- ------------------------------------------------------------
-- 1) Espiar a tabela inteira (só as 5 primeiras linhas)
-- ------------------------------------------------------------
SELECT * FROM orders LIMIT 5;

-- ------------------------------------------------------------
-- 2) Escolher apenas algumas colunas
--    Regra de ouro: só traga o que você precisa
-- ------------------------------------------------------------
SELECT order_id, order_status, order_purchase_timestamp
FROM orders
LIMIT 5;

-- ------------------------------------------------------------
-- 3) ORDER BY — ordenar o resultado
--    ASC = crescente (padrão) | DESC = decrescente
-- ------------------------------------------------------------
SELECT order_id, order_purchase_timestamp
FROM orders
ORDER BY order_purchase_timestamp DESC
LIMIT 10;

-- ------------------------------------------------------------
-- 4) WHERE — filtrar linhas
--    =  igual | <> ou !=  diferente | >  >=  <  <=
--    AND / OR / NOT  para combinar condições
-- ------------------------------------------------------------
SELECT order_id, order_status
FROM orders
WHERE order_status = 'canceled'
LIMIT 20;

-- ------------------------------------------------------------
-- 5) Tudo junto: filtro + ordenação
-- ------------------------------------------------------------
SELECT order_id, order_purchase_timestamp
FROM orders
WHERE order_status = 'delivered'
  AND order_purchase_timestamp >= '2018-01-01'
ORDER BY order_purchase_timestamp
LIMIT 10;

-- ============================================================
-- EXERCÍCIOS (tente antes de olhar as respostas)
-- ============================================================
-- 1) Liste 10 clientes mostrando customer_city e customer_state.
-- 2) Quais são os 10 produtos mais pesados? (tabela products)
-- 3) Liste os pedidos cancelados feitos em 2017.
-- 4) Mostre os 5 pagamentos de maior valor (tabela payments).

-- ============================================================
-- RESPOSTAS
-- ============================================================
-- 1)
-- SELECT customer_city, customer_state FROM customers LIMIT 10;

-- 2)
-- SELECT product_id, product_weight_g
-- FROM products
-- ORDER BY product_weight_g DESC
-- LIMIT 10;

-- 3)
-- SELECT order_id, order_purchase_timestamp
-- FROM orders
-- WHERE order_status = 'canceled'
--   AND order_purchase_timestamp >= '2017-01-01'
--   AND order_purchase_timestamp <  '2018-01-01';

-- 4)
-- SELECT order_id, payment_type, payment_value
-- FROM payments
-- ORDER BY payment_value DESC
-- LIMIT 5;
