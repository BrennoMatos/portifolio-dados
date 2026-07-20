---Analises comerciais------------------

--Top 10 clientes por faturamento

SELECT pd.nome_cliente, SUM(pp.valor_unitario * pp.quantidade) AS Faturamento 
FROM pedido_dados pd
JOIN pedido_produto pp ON pd.idpedido = pp.idpedido
GROUP BY pd.nome_cliente
ORDER BY Faturamento DESC  limit 10;

--Top 10 clientes por quantidade vendida

SELECT pd.nome_cliente, SUM(pp.quantidade) AS quantidade_total_vendida
FROM pedido_dados pd
JOIN pedido_produto pp ON pd.idpedido = pp.idpedido
GROUP BY pd.nome_cliente
ORDER BY quantidade_total_vendida DESC limit 10;

--Receita diaria por vendedor

SELECT pd.vendedor, pd.data_pedido,SUM(pp.valor_unitario * pp.quantidade) AS Receita
FROM pedido_dados pd
JOIN pedido_produto pp ON pd.idpedido = pp.idpedido
GROUP BY pd.vendedor,data_pedido
ORDER BY data_pedido asc;

--Produtos mais vendidos
SELECT pd.produto, SUM(pp.quantidade) AS quantidade
FROM produto_dados pd
JOIN pedido_produto pp ON pd.idproduto = pp.idproduto
GROUP BY pd.produto
ORDER BY quantidade desc limit 4;

--Ticket médio por cliente

SELECT 
    pd.nome_cliente,
    Round(SUM(pp.valor_unitario * pp.quantidade) / COUNT(DISTINCT pd.idpedido), 2) AS ticket_medio
FROM 
    pedido_dados pd
JOIN 
    pedido_produto pp ON pd.idpedido = pp.idpedido
GROUP BY 
    pd.nome_cliente;

--Receita por fornecedor

SELECT pd.fornecedor,SUM(pp.valor_unitario * pp.quantidade) AS Receita
FROM produto_dados pd
JOIN pedido_produto pp ON pd.idproduto = pp.idproduto
GROUP BY pd.fornecedor
order by receita;

--Clientes com mais pedidos
SELECT pd.nome_cliente, count(pd.idpedido) AS quantidade_de_pedidos
FROM pedido_dados pd
JOIN pedido_produto pp ON pd.idpedido = pp.idpedido
GROUP BY pd.nome_cliente
ORDER BY quantidade_de_pedidos desc;