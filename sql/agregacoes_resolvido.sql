olist D SELECT customer_state
        count(*) AS clientes FROM customers
        GROUP BY customer_state
        ORDER BY clientes DESC;
Parser Error:
syntax error at or near "("

LINE 2: count(*) AS clientes FROM customers
             ^
olist D SELECT customer_state
        count(*) AS clientes FROM customers
        GROUP BY customer_state
        ORDER BY clientes DESC;
Parser Error:
syntax error at or near "("

LINE 2: count(*) AS clientes FROM customers
             ^
olist D SELECT customer_state
        count(*) AS clientes FROM customers
        GROUP BY customer_state
        ORDER BY clientes DESC;
Parser Error:
syntax error at or near "("

LINE 2: count(*) AS clientes FROM customers
             ^
olist D SELECT customer_state,
        count(*) AS clientes FROM customers
        GROUP BY customer_state
        ORDER BY clientes DESC;
┌────────────────┬──────────┐
│ customer_state │ clientes │
│    varchar     │  int64   │
├────────────────┼──────────┤
│ SP             │    41746 │
│ RJ             │    12852 │
│ MG             │    11635 │
│ RS             │     5466 │
│ PR             │     5045 │
│ SC             │     3637 │
│ BA             │     3380 │
│ DF             │     2140 │
│ ES             │     2033 │
│ GO             │     2020 │
│ PE             │     1652 │
│ CE             │     1336 │
│ PA             │      975 │
│ MT             │      907 │
│ MA             │      747 │
│ MS             │      715 │
│ PB             │      536 │
│ PI             │      495 │
│ RN             │      485 │
│ AL             │      413 │
│ SE             │      350 │
│ TO             │      280 │
│ RO             │      253 │
│ AM             │      148 │
│ AC             │       81 │
│ AP             │       68 │
│ RR             │       46 │
└────────────────┴──────────┘
  27 rows         2 columns
olist D SELECT payment_type, payment_value
        payment_installments,
        count(*) AS qtd
        round(avg(payment_value), 2) AS ticket_medio
        GROUP BY payment_type
        ORDER BY payment_type DESC;
        
Parser Error:
syntax error at or near "round"

LINE 4: round(avg(payment_value), 2) AS ticket_medio
        ^^^^^
olist D 
olist D SELECT payment_type,       count(*)                      AS qtd,       round(sum(payment_value), 2)  AS total,       round(avg(payment_value), 2)  AS ticket_medioFROM paymentsGROUP BY payment_typeORDER BY total DESC;
Parser Error:
syntax error at or near "paymentsGROUP"

LINE 1: ...,       round(avg(payment_value), 2)  AS ticket_medioFROM paymentsGROUP BY payment_typeORDER BY total DESC;
                                                                     ^^^^^^^^^^^^^
olist D SELECT payment_type,
               count(*)                      AS qtd,
               round(sum(payment_value), 2)  AS total,
               round(avg(payment_value), 2)  AS ticket_medio
        FROM payments
        GROUP BY payment_type
        ORDER BY total DESC;
┌──────────────┬───────┬─────────────┬──────────────┐
│ payment_type │  qtd  │    total    │ ticket_medio │
│   varchar    │ int64 │   double    │    double    │
├──────────────┼───────┼─────────────┼──────────────┤
│ credit_card  │ 76795 │ 12542084.19 │       163.32 │
│ boleto       │ 19784 │  2869361.27 │       145.03 │
│ voucher      │  5775 │   379436.87 │         65.7 │
│ debit_card   │  1529 │   217989.79 │       142.57 │
│ not_defined  │     3 │         0.0 │          0.0 │
└──────────────┴───────┴─────────────┴──────────────┘
olist D SELECT product_category_name,
               count(*) AS produtos,
               round(100.0 * count(*) / sum(count(*)) OVER (), 2) AS pct
        FROM products
        WHERE product_category_name IS NOT NULL
        GROUP BY 1)
        ORDER BY ALL DESC
        LIMIT 10;
Parser Error:
syntax error at or near ")"

LINE 6: GROUP BY 1)
                  ^
olist D SELECT product_category_name,
               count(*) AS produtos,
               round(100.0 * count(*) / sum(count(*)) OVER (), 2) AS pct
        FROM products
        WHERE product_category_name IS NOT NULL
        GROUP BY 1
        ORDER BY ALL
        LIMIT 10;
┌───────────────────────────┬──────────┬────────┐
│   product_category_name   │ produtos │  pct   │
│          varchar          │  int64   │ double │
├───────────────────────────┼──────────┼────────┤
│ agro_industria_e_comercio │       74 │   0.23 │
│ alimentos                 │       82 │   0.25 │
│ alimentos_bebidas         │      104 │   0.32 │
│ artes                     │       55 │   0.17 │
│ artes_e_artesanato        │       19 │   0.06 │
│ artigos_de_festas         │       26 │   0.08 │
│ artigos_de_natal          │       65 │    0.2 │
│ audio                     │       58 │   0.18 │
│ automotivo                │     1900 │   5.87 │
│ bebes                     │      919 │   2.84 │
└───────────────────────────┴──────────┴────────┘
  10 rows                             3 columns
olist D SELECT product_category_name,
               count(*) AS produtos,
               round(100.0 * count(*) / sum(count(*)) OVER (), 2) AS pct
        FROM products
        WHERE product_category_name IS NOT NULL
        GROUP BY 1
        ORDER BY produtos ASC
        LIMIT 10;
┌───────────────────────────────────────────────┬──────────┬────────┐
│             product_category_name             │ produtos │  pct   │
│                    varchar                    │  int64   │ double │
├───────────────────────────────────────────────┼──────────┼────────┤
│ cds_dvds_musicais                             │        1 │    0.0 │
│ seguros_e_servicos                            │        2 │   0.01 │
│ pc_gamer                                      │        3 │   0.01 │
│ casa_conforto_2                               │        5 │   0.02 │
│ fashion_roupa_infanto_juvenil                 │        5 │   0.02 │
│ tablets_impressao_imagem                      │        9 │   0.03 │
│ moveis_colchao_e_estofado                     │       10 │   0.03 │
│ la_cuisine                                    │       10 │   0.03 │
│ portateis_cozinha_e_preparadores_de_alimentos │       10 │   0.03 │
│ fraldas_higiene                               │       12 │   0.04 │
└───────────────────────────────────────────────┴──────────┴────────┘
  10 rows                                                 3 columns
olist D SELECT product_category_name,
               count(*) AS produtos,
               round(100.0 * count(*) / sum(count(*)) OVER (), 2) AS pct
        FROM products
        WHERE product_category_name IS NOT NULL
        GROUP BY 1
        ORDER BY produtos DESC
        LIMIT 10;
┌────────────────────────┬──────────┬────────┐
│ product_category_name  │ produtos │  pct   │
│        varchar         │  int64   │ double │
├────────────────────────┼──────────┼────────┤
│ cama_mesa_banho        │     3029 │   9.37 │
│ esporte_lazer          │     2867 │   8.86 │
│ moveis_decoracao       │     2657 │   8.22 │
│ beleza_saude           │     2444 │   7.56 │
│ utilidades_domesticas  │     2335 │   7.22 │
│ automotivo             │     1900 │   5.87 │
│ informatica_acessorios │     1639 │   5.07 │
│ brinquedos             │     1411 │   4.36 │
│ relogios_presentes     │     1329 │   4.11 │
│ telefonia              │     1134 │   3.51 │
└────────────────────────┴──────────┴────────┘
  10 rows                          3 columns
olist D SELECT orders
               count(*) AS total_pedidos,
               round(100.0 * count(*) / sum(count(*)) OVER (), 2) AS pct
        FROM products
        WHERE product_category_name IS NOT NULL
        GROUP BY 1
        ORDER BY produtos ASC
        LIMIT 10;
Parser Error:
syntax error at or near "("

LINE 2:        count(*) AS total_pedidos,
                    ^
olist D SELECT orders
               count(*) AS total_pedidos,
               round(100.0 * count(*) / sum(count(*)) OVER (), 2) AS pct
        FROM products
        WHERE product_category_name IS NOT NULL
        GROUP BY 1
        ORDER BY produtos ASC
        LIMIT 10;
Parser Error:
syntax error at or near "("

LINE 2:        count(*) AS total_pedidos,
                    ^
olist D SELECT orders
               count(*) AS_pedidos,
               SELECT date_trunc ('month', order_purchase_timestamp) AS mes
        FROM orders
        GROUP BY mes
        ORDER BY mes
        LIMIT 10;
Parser Error:
syntax error at or near "("

LINE 2:        count(*) AS_pedidos,
                    ^
olist D SELECT orders
               count(*) AS_pedidos,
               SELECT date_trunc ('month', order_purchase_timestamp) AS mes
        FROM orders
        GROUP BY mes
        ORDER BY mes
        LIMIT 10;
Parser Error:
syntax error at or near "("

LINE 2:        count(*) AS_pedidos,
                    ^
olist D SELECT orders
               count(*) AS_pedidos,
               SELECT date_trunc ('month', order_purchase_timestamp) AS mes count(*) AS pedidos
        FROM orders
        GROUP BY mes
        ORDER BY mes
        LIMIT 10;
Parser Error:
syntax error at or near "("

LINE 2:        count(*) AS_pedidos,
                    ^
olist D SELECT date_trunc('month', order_purchase_timestamp) AS mes,
               count(*) AS pedidos
        FROM orders
        WHERE order_purchase_timestamp >= '2018-01-01'
          AND order_purchase_timestamp <  '2018-12-31'
        GROUP BY mes
        ORDER BY mes;
┌─────────────────────┬─────────┐
│         mes         │ pedidos │
│      timestamp      │  int64  │
├─────────────────────┼─────────┤
│ 2018-01-01 00:00:00 │    7269 │
│ 2018-02-01 00:00:00 │    6728 │
│ 2018-03-01 00:00:00 │    7211 │
│ 2018-04-01 00:00:00 │    6939 │
│ 2018-05-01 00:00:00 │    6873 │
│ 2018-06-01 00:00:00 │    6167 │
│ 2018-07-01 00:00:00 │    6292 │
│ 2018-08-01 00:00:00 │    6512 │
│ 2018-09-01 00:00:00 │      16 │
│ 2018-10-01 00:00:00 │       4 │
└─────────────────────┴─────────┘
  10 rows             2 columns
olist D SELECT date_trunc('month', order_purchase_timestamp) AS mes,
               count(*) AS pedidos
        FROM orders
        WHERE order_purchase_timestamp >= '2018-01-01'
          AND order_purchase_timestamp <  '2018-12-31'
        GROUP BY mes
        ORDER BY mes;
Parser Error:
syntax error at or near ""

LINE 5:   AND order_purchase_timestamp <  '2018-12-31'
                                                      ^
olist D SELECT date_trunc('month', order_purchase_timestamp) AS mes,
               count(*) AS pedidos
        FROM orders WITH status = complete
        WHERE order_purchase_timestamp >= '2018-01-01'
          AND order_purchase_timestamp <  '2018-12-31'
        GROUP BY mes
        ORDER BY mes;
Parser Error:
syntax error at or near "WITH"

LINE 3: FROM orders WITH status = complete
                    ^^^^
olist D SELECT date_trunc('month', order_purchase_timestamp) AS mes,
               count(*) AS pedidos
        FROM orders WHERE order_status = delivered
        WHERE order_purchase_timestamp >= '2018-01-01'
          AND order_purchase_timestamp <  '2019-01-01'
        GROUP BY mes
        ORDER BY mes;
Parser Error:
syntax error at or near "WHERE"

LINE 4: WHERE order_purchase_timestamp >= '2018-01-01'
        ^^^^^
olist D SELECT date_trunc('month', order_purchase_timestamp) AS mes,
               count(*) AS pedidos
        FROM orders
        WHERE order_purchase_timestamp >= '2018-01-01'
          AND order_purchase_timestamp <  '2019-01-01'
        GROUP BY mes
        ORDER BY mes;
Parser Error:
syntax error at or near ""

LINE 5:   AND order_purchase_timestamp <  '2019-01-01'
                                                      ^
olist D SELECT date_trunc('month', order_purchase_timestamp) AS mes,
               count(*) AS pedidos
        FROM orders
        WHERE order_purchase_timestamp >= '2018-01-01'
          AND order_purchase_timestamp <  '2019-01-01'
        GROUP BY mes
        ORDER BY mes;
Parser Error:
syntax error at or near ""

LINE 5:   AND order_purchase_timestamp <  '2019-01-01'
                                                      ^
olist D SELECT date_trunc('month', order_purchase_timestamp) AS mes,
               count(*) AS pedidos
        FROM orders
        WHERE order_purchase_timestamp >= '2018-01-01'
          AND order_purchase_timestamp <  '2019-01-01'
        GROUP BY mes
        ORDER BY mes;
Parser Error:
syntax error at or near ""

LINE 5:   AND order_purchase_timestamp <  '2019-01-01'
                                                      ^
olist D 
olist D SELECT date_trunc('month', order_purchase_timestamp) AS mes,
               count(*) AS pedidos
        FROM orders
        WHERE order_purchase_timestamp >= '2018-01-01'
          AND order_purchase_timestamp <  '2019-01-01'
        SELECT DISTINCT order_status FROM orders ORDER BY 1 GROUP BY mes
        ORDER BY mes;
Parser Error:
syntax error at or near ""

LINE 5:   AND order_purchase_timestamp <  '2019-01-01'
                                                      ^
olist D SELECT date_trunc('month', order_purchase_timestamp) AS mes,
               count(*) AS pedidos
        FROM orders
        WHERE order_purchase_timestamp >= '2018-01-01'
          AND order_purchase_timestamp <  '2019-01-01'
          AND order_status = 'delivered'
        GROUP BY mes
        ORDER BY mes;
┌─────────────────────┬─────────┐
│         mes         │ pedidos │
│      timestamp      │  int64  │
├─────────────────────┼─────────┤
│ 2018-01-01 00:00:00 │    7069 │
│ 2018-02-01 00:00:00 │    6555 │
│ 2018-03-01 00:00:00 │    7003 │
│ 2018-04-01 00:00:00 │    6798 │
│ 2018-05-01 00:00:00 │    6749 │
│ 2018-06-01 00:00:00 │    6099 │
│ 2018-07-01 00:00:00 │    6159 │
│ 2018-08-01 00:00:00 │    6351 │
└─────────────────────┴─────────┘
olist D 