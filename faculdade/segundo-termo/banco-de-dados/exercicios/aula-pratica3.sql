CREATE DATABASE aula_join CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

USE aula_join;

CREATE TABLE tabela_a (
	nome varchar(50) NULL
);

CREATE TABLE tabela_b (
	nome varchar(50) NULL
);

INSERT INTO tabela_a VALUES ('Fernanda');
INSERT INTO tabela_a VALUES ('José');
INSERT INTO tabela_a VALUES ('Luiz');
INSERT INTO tabela_a VALUES ('Fernando');

SELECT * FROM tabela_a;

INSERT INTO tabela_b VALUES ('Carlos');
INSERT INTO tabela_b VALUES ('Roberto');
INSERT INTO tabela_b VALUES ('Luiz');
INSERT INTO tabela_b VALUES ('Fernando');

SELECT * FROM tabela_b;

-- INNER JOIN 
-- Traz os registros que são comuns as 2 tabelas
-- tabela_a é a tabela principal,
-- tabela_a é a tabela da esquerda 
SELECT * FROM tabela_a
INNER JOIN tabela_b
	on tabela_a.nome = tabela_b.nome;
    
-- Apelido para as tabelas
SELECT a.nome AS nome_a, b.nome AS nome_b
FROM tabela_a AS a
INNER JOIN tabela_b AS b
	on a.nome = b.nome;
    
-- LEFT JOIN
SELECT a.nome AS nome_a, b.nome AS nome_b
FROM tabela_a AS a
LEFT JOIN tabela_b AS b
	on a.nome = b.nome;
    
-- RIGHT JOIN
SELECT a.nome AS nome_a, b.nome AS nome_b
FROM tabela_a AS a
RIGHT JOIN tabela_b AS b
	on a.nome = b.nome;
    
-- OUTER JOIN / FULL OUTER JOIN (Não funciona no MySQL)
-- O que funciona é UNION
SELECT a.nome AS nome_a, b.nome AS nome_b
FROM tabela_a AS a
LEFT JOIN tabela_b AS b
	on a.nome = b.nome
UNION
SELECT a.nome AS nome_a, b.nome AS nome_b
FROM tabela_a AS a
RIGHT JOIN tabela_b AS b
	on a.nome = b.nome;
    
-- LEFT EXCLUDING JOIN
SELECT a.nome AS nome_a, b.nome AS nome_b
FROM tabela_a AS a
LEFT JOIN tabela_b AS b
	on a.nome = b.nome
WHERE b.nome is null;

-- RIGHT EXCLUDING JOIN
SELECT a.nome AS nome_a, b.nome AS nome_b
FROM tabela_a AS a
RIGHT JOIN tabela_b AS b
	on a.nome = b.nome
WHERE a.nome is null;

-- CROSS JOIN
SELECT a.nome AS nome_a, b.nome AS nome_b
FROM tabela_a AS a
CROSS JOIN tabela_b AS b;

-- ECOMMERCE
USE ecommerce;

-- Listar o nome de todos os produtos junto com o nome da categoria
-- INNER JOIN
SELECT * FROM produtos;
SELECT * FROM categorias;

SELECT * FROM produtos AS p
INNER JOIN categorias AS c
	on p.categorias_id = c.id;
    
SELECT p.nome, c.nome FROM produtos AS p
INNER JOIN categorias AS c
	on p.categorias_id = c.id;
    
SELECT p.nome AS produto, c.nome AS categoria 
FROM produtos AS p
INNER JOIN categorias AS c
	on p.categorias_id = c.id;
    
-- Listar todos os produtos mesmo que ele não tenha uma categoria
-- LEFT JOIN
SELECT p.nome AS produto, c.nome AS categoria
FROM produtos AS p
LEFT JOIN categorias AS c
	on p.categorias_id = c.id;

-- Listar todas as categorias mesmo que elas não tenham produtos cadastrados
-- RIGHT JOIN
INSERT INTO categorias (nome) VALUES('Cadeiras');

SELECT p.nome AS produto, c.nome AS categoria
FROM produtos AS p
RIGHT JOIN categorias AS c
	on p.categorias_id = c.id;
    
-- JOIN COM MULTIPLAS TABELAS
-- Listar todos os pedidos, com nome do cliente e o nome do produto comprado
SELECT * FROM pedidos; -- numero do pedido
SELECT * FROM clientes; -- nome do cliente
SELECT * FROM produtos; -- nome do produto
SELECT * FROM pedido_has_produto; -- vincular o pedido com produto

SELECT 
	pedidos.id, 
    pedidos.data_pedido, 
    clientes.nome,
    pedido_has_produto.preco,
    pedido_has_produto.quantidade,
    produtos.nome AS produto
FROM pedidos
INNER JOIN clientes on pedidos.clientes_id = clientes.id
INNER JOIN pedido_has_produto on pedidos.id = pedido_has_produto.pedidos_id
INNER JOIN produtos on pedido_has_produto.produtos_id = produtos.id;
