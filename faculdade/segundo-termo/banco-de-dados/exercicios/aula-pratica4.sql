-- COUNT()
-- SUM()

USE ecommerce;

SELECT COUNT(*) FROM produtos;

SELECT SUM(preco) FROM produtos;

SELECT * FROM produtos;

INSERT INTO produtos (nome, preco, estoque, categorias_id)
VALUES
('Mouse Redragon', 100.00, 50, 1);

-- Contar quantos produtos a gente tem por categoria
SELECT categorias_id, COUNT(*) AS total_produtos
FROM produtos 
GROUP BY categorias_id;

-- Usando INNER JOIN 
SELECT categorias.nome, COUNT(*) AS total_produtos
FROM produtos 
INNER JOIN categorias
	ON produtos.categorias_id = categorias.id
GROUP BY categorias_id;

-- Somar o total que a nossa empresa gastou com o estoque dos produtos 
-- Vamos realizar a seguinte operação (preço + estoque)
-- Valor total por produto
SELECT nome, SUM(preco * estoque) AS total_produto 
FROM produtos
GROUP BY id;

-- Somar o total gasto em cada produto pedido pelos clientes
SELECT produtos_id, p.nome, SUM(pp.preco * pp.quantidade) AS total_produto
FROM pedido_has_produto AS pp
INNER JOIN produtos AS p
	ON p.id = pp.produtos_id
GROUP BY p.id;

-- Utilizando WHERE para filtrar os registros antes de aplicar a função de agregação
SELECT categorias.nome, COUNT(*) AS total_produtos
FROM produtos 
INNER JOIN categorias
	ON produtos.categorias_id = categorias.id
WHERE preco > 500
GROUP BY categorias_id;

-- Utilizando HAVING para filtrar os registros após aplicar a função de agregação
SELECT categorias.nome, COUNT(produtos.id) AS total_produtos
FROM produtos 
INNER JOIN categorias
	ON produtos.categorias_id = categorias.id
GROUP BY categorias_id
HAVING COUNT(produtos.id) > 1;


