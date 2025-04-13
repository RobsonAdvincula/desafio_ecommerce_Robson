-- Quantos pedidos por cliente
SELECT c.nome, COUNT(p.id_pedido) AS total_pedidos
FROM CLIENTE c
LEFT JOIN PEDIDO p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;

-- Produtos e seus fornecedores
SELECT f.nome AS fornecedor, p.nome AS produto
FROM PRODUTO p
JOIN FORNECEDOR f ON p.id_fornecedor = f.id_fornecedor;

-- Produtos com estoque baixo
SELECT p.nome, e.quantidade
FROM ESTOQUE e
JOIN PRODUTO p ON e.id_produto = p.id_produto
WHERE e.quantidade < 20;

-- Valor total por pedido
SELECT i.id_pedido, SUM(i.quantidade * p.preco) AS total
FROM ITEM_PEDIDO i
JOIN PRODUTO p ON i.id_produto = p.id_produto
GROUP BY i.id_pedido;

-- Pedidos com valor acima de R$1000
SELECT i.id_pedido, SUM(i.quantidade * p.preco) AS total
FROM ITEM_PEDIDO i
JOIN PRODUTO p ON i.id_produto = p.id_produto
GROUP BY i.id_pedido
HAVING total > 1000;

-- Detalhes da entrega
SELECT c.nome AS cliente, e.status, e.codigo_rastreio
FROM ENTREGA e
JOIN PEDIDO p ON e.id_pedido = p.id_pedido
JOIN CLIENTE c ON p.id_cliente = c.id_cliente;

-- Verificar se algum vendedor é também fornecedor
SELECT v.nome
FROM VENDEDOR v
JOIN FORNECEDOR f ON v.nome = f.nome;