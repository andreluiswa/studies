USE ecommerce;

-- 1. Liste o nome de cada produto com o nome de sua categoria.
SELECT * FROM produtos;
SELECT * FROM categorias;

SELECT * FROM produtos
INNER JOIN categorias
	on produtos.categorias_id = categorias.id;
    
SELECT produtos.nome AS produto, categorias.nome AS categoria 
FROM produtos
INNER JOIN categorias
	on produtos.categorias_id = categorias.id;
    
-- 2. Liste todas as categorias e os produtos (mesmo as categorias sem produtos).
INSERT INTO categorias (nome) VALUES('Cadeiras');

SELECT produtos.nome AS produto, categorias.nome AS categoria 
FROM produtos
RIGHT JOIN categorias
	on produtos.categorias_id = categorias.id;
    
-- 3. Liste todos os produtos e suas categorias (mesmo que algum produto não tenha categoria).
INSERT INTO produtos (nome, preco) VALUES('Teclado Mecânico', '340.00');

SELECT produtos.nome AS produto, categorias.nome AS categoria 
FROM produtos
LEFT JOIN categorias
	on produtos.categorias_id = categorias.id;

-- 4. Mostre o nome do cliente e o ID do pedido que ele fez.
SELECT * FROM clientes;
SELECT * FROM pedidos;

SELECT clientes.nome, pedidos.id
FROM pedidos
JOIN clientes 
	on pedidos.clientes_id = clientes.id;
 
 -- 5. Liste o nome do cliente, o nome do produto e a quantidade comprada.
 SELECT * FROM pedido_has_produto;
 SELECT * FROM clientes;
 SELECT * FROM produtos;
 SELECT * FROM pedidos;
 
SELECT pedidos.data_pedido, clientes.nome, pedido_has_produto.quantidade, produtos.nome
FROM pedidos
INNER JOIN clientes on pedidos.clientes_id = clientes.id
INNER JOIN pedido_has_produto on pedidos.id = pedido_has_produto.pedidos_id
INNER JOIN produtos on pedido_has_produto.produtos_id = produtos.id;

-- 6. Liste o nome do cliente e o total de produtos que ele comprou.
SELECT clientes.nome, pedido_has_produto.quantidade
FROM clientes
JOIN pedidos on pedidos.clientes_id = clientes.id
JOIN pedido_has_produto on pedido_has_produto.pedidos_id = pedidos.id;

-- 7. Liste as categorias que ainda não têm produtos associados. (Disse que ta anulado).

-- 8. Faça um CROSS JOIN entre produtos e categorias e conte quantas combinações foram geradas.
SELECT COUNT(*) AS total_combinacoes
FROM produtos
CROSS JOIN categorias;
