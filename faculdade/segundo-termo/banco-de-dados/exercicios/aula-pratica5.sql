-- Exercício de Revisão – JOINs em SQL
-- Cenário: Loja de Tecnologia

-- Criação do banco de dados e das tabelas
CREATE DATABASE loja_tech CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
USE loja_tech;

CREATE TABLE clientes (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50)
);

CREATE TABLE pedidos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	data_pedido DATE,
	cliente_id INT,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome_produto VARCHAR(50),
	preco DECIMAL(10,2)
);

CREATE TABLE itens_pedido (
	id INT AUTO_INCREMENT PRIMARY KEY,
	pedido_id INT,
	produto_id INT,
	quantidade INT,
	FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
	FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserindo dados de exemplo
INSERT INTO clientes (nome) VALUES
('Alice'),
('Bruno'),
('Carla'),
('Daniel');

INSERT INTO pedidos (data_pedido, cliente_id) VALUES
('2025-10-20', 1),
('2025-10-21', 2),
('2025-10-22', NULL);

INSERT INTO produtos (nome_produto, preco) VALUES
('Mouse Gamer', 120.00),
('Teclado Mecânico', 350.00),
('Monitor 27"', 1800.00),
('Headset', 250.00);

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 4, 1);

-- Parte 1 – Compreensão do Cenário
-- 1. Clientes que ainda não fizeram pedidos: Carla e Daniel
-- 2. Pedidos sem cliente associado: Pedido 3 (2025-10-22)
-- 3. Produtos ainda não vendidos: Monitor 27"

-- Parte 2 – Consultas com JOINs

-- a) INNER JOIN
-- Mostrar o nome do cliente, a data do pedido e o nome dos produtos comprados
SELECT 
	c.nome AS cliente,
	p.data_pedido,
	pr.nome_produto
FROM clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
INNER JOIN itens_pedido i ON p.id = i.pedido_id
INNER JOIN produtos pr ON i.produto_id = pr.id;

-- b) LEFT JOIN
-- Listar todos os clientes e seus pedidos (mesmo quem não fez pedido)
SELECT 
	c.nome AS cliente,
	p.data_pedido
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id;

-- c) RIGHT JOIN
-- Listar todos os pedidos, inclusive os que não têm cliente
SELECT 
	c.nome AS cliente,
	p.data_pedido
FROM clientes c
RIGHT JOIN pedidos p ON c.id = p.cliente_id;

-- d) LEFT EXCLUDING JOIN
-- Mostrar apenas os clientes que ainda não fizeram pedidos
SELECT 
	c.nome AS cliente
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id
WHERE p.id IS NULL;
