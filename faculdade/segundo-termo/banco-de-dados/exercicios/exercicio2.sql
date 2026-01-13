CREATE DATABASE ecommerce CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
USE ecommerce;
CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    categorias_id INT,
    FOREIGN KEY (categorias_id) REFERENCES categorias(id)
);

CREATE TABLE pedidos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME NOT NULL DEFAULT NOW(),
    total DECIMAL(10,2) DEFAULT 0,
    clientes_id INT NOT NULL,
    FOREIGN KEY (clientes_id) REFERENCES clientes(id)
);

CREATE TABLE pedido_has_produto (
	id INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT DEFAULT 1,
    preco DECIMAL(10,2) NOT NULL,
    produtos_id INT NOT NULL,
    pedidos_id INT NOT NULL,
    FOREIGN KEY (produtos_id) REFERENCES produtos(id),
    FOREIGN KEY (pedidos_id) REFERENCES pedidos(id)
);

INSERT INTO clientes (nome, email)
VALUES
('Roberto Souza', 'roberto_souza@email.com'),
('Cesar Augusto', 'cesar_augusto@email.com'),
('Emanuel Aguiar', 'emanuel@email.com');

SELECT * FROM clientes;

INSERT INTO categorias (nome)
VALUES
('Periférico'),
('Consoles'),
('Hardware');

SELECT * FROM categorias;

INSERT INTO produtos (nome, preco, estoque, categorias_id)
VALUES
('Teclado Logitech G588', 1000.00, 5, 1),
('Processador Itel 2gen', 500.00, 20, 3),
('PS5 PRO', 7000.00, 30, 2);

SELECT * FROM produtos;

INSERT INTO pedidos (clientes_id)
VALUES
(2),
(3),
(2),
(1);

SELECT * FROM pedidos;

INSERT INTO pedido_has_produto (produtos_id, pedidos_id, quantidade, preco)
VALUES
(3, 1, 1, 7000.00),
(2, 2, 5, 100.00),
(1, 3, 10, 1000.00);

SELECT * FROM pedido_has_produto;
