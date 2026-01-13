-- Parte 1 – Preparação do Banco de Dados
-- 1. Crie um banco de dados para o sistema da locadora.
CREATE DATABASE cineplus CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
USE cineplus;

CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefone VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE locacao(
	id INT AUTO_INCREMENT PRIMARY KEY,
    data_locacao DATE NOT NULL,
    data_devolucao DATE NOT NULL,
	id_clientes INT NOT NULL,
    FOREIGN KEY (id_clientes) REFERENCES clientes(id)
);

CREATE TABLE categorias(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE filmes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    diretor VARCHAR(50),
	ano_lancamento INT NOT NULL,
	preco FLOAT NOT NULL,
    id_categorias INT NOT NULL,
    FOREIGN KEY (id_categorias) REFERENCES categorias(id)
);

CREATE TABLE locacao_has_filme(
	id INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    id_locacao INT NOT NULL,
    FOREIGN KEY (id_locacao) REFERENCES locacao(id),
    id_filmes INT NOT NULL,
    FOREIGN KEY (id_filmes) REFERENCES filmes(id)
);

-- 3. Insira dados de exemplo nas tabelas, garantindo variedade suficiente para as consultas.
SELECT * FROM clientes;

INSERT INTO clientes(nome, email, telefone, data_nascimento)
VALUES 
('João Pedro Silva', 'joaosilva@email.com', '11998765432', '2000-09-10'),
('Marina Elena Souza', 'marielena@email.com', '14996451457', '2004-12-02'),
('Alexandre Gomes Santos', 'alexandregomes@email.com', '14996451457', '2004-07-01');

SELECT * FROM categorias;

INSERT INTO categorias(nome)
VALUES
('Animação'),
('Ação'),
('Nacional');

SELECT * FROM locacao;

INSERT INTO locacao (data_locacao, data_devolucao, id_clientes)
VALUES
('2025-09-10', '2025-10-10', 1),
('2025-08-06', '2000-08-13', 2),
('2025-07-20', '2025-08-10', 3);

SELECT * FROM filmes;

INSERT INTO filmes (titulo, diretor, ano_lancamento, preco, id_categorias)
VALUES
('Shrek', 'Andrew Adamson, Vicky Jenson', 2001, 8.50, 1),
('Top Gun: Maverick', 'Joseph Kosinski', 2022, 10.90, 2),
('O Homem Que Copiava', 'Jorge Furtado', 2003, 8.90, 3);

SELECT * FROM locacao_has_filme;

INSERT INTO locacao_has_filme (quantidade, id_locacao, id_filmes)
VALUES
(4, 1, 2),
(5, 2, 3),
(6, 3, 1);

-- Parte 2 – Consultas SQL (JOIN + filtros + agrupamento)
-- 1. Liste todos os filmes com suas respectivas categorias.
SELECT * FROM filmes;
SELECT * FROM categorias;

SELECT filmes.titulo AS filmes, categorias.nome AS categorias
FROM filmes
INNER JOIN categorias
	on filmes.id_categorias = categorias.id;
    
-- 2. Liste os nomes dos clientes e as locações que realizaram.
SELECT * FROM clientes;
SELECT * FROM locacao;
SELECT * FROM locacao_has_filme;

SELECT clientes.nome AS nomes, locacao.data_locacao AS data_locacao
FROM clientes
INNER JOIN locacao
	on clientes.id = locacao.id_clientes;
    
-- 3. Liste o nome dos clientes e os títulos dos filmes que cada um alugou.
SELECT * FROM clientes;
SELECT * FROM locacao_has_filme;
SELECT * FROM filmes;

SELECT clientes.nome AS nome_cliente, filmes.titulo AS nome_filme, locacao_has_filme.quantidade AS quantidade, locacao.data_locacao AS data_locacao
FROM locacao
INNER JOIN clientes ON locacao.id_clientes = clientes.id
INNER JOIN locacao_has_filme ON locacao.id = locacao_has_filme.id_locacao
INNER JOIN filmes ON locacao_has_filme.id_filmes = filmes.id;

-- 4. Mostre o total de filmes alugados por cada cliente.
SELECT clientes.nome AS nome_cliente, SUM(locacao_has_filme.quantidade) AS total_filmes_alugados
FROM locacao
INNER JOIN clientes 
	ON locacao.id_clientes = clientes.id
INNER JOIN locacao_has_filme 
	ON locacao.id = locacao_has_filme.id_locacao
GROUP BY clientes.nome;

-- 5. Exiba os filmes que foram alugados mais de uma vez.
INSERT INTO locacao (data_locacao, data_devolucao, id_clientes)
VALUES ('2025-11-01', '2025-11-08', 2);

INSERT INTO locacao_has_filme (quantidade, id_locacao, id_filmes)
VALUES (2, 4, 1);

SELECT filmes.titulo AS titulo_filme, COUNT(locacao_has_filme.id_locacao) AS vezes_alugado
FROM filmes
INNER JOIN locacao_has_filme 
    ON filmes.id = locacao_has_filme.id_filmes
GROUP BY filmes.titulo
HAVING COUNT(locacao_has_filme.id_locacao) > 1;

-- 6. Mostre os filmes e suas categorias, ordenando pelo ano de lançamento mais recente.
SELECT filmes.titulo AS titulo_filme, categorias.nome AS categoria, filmes.ano_lancamento AS ano_lancamento
FROM filmes
INNER JOIN categorias 
    ON filmes.id_categorias = categorias.id
ORDER BY filmes.ano_lancamento DESC;

-- 7. Liste os clientes que ainda não realizaram nenhuma locação.
INSERT INTO clientes (nome, email, telefone, data_nascimento)
VALUES ('Carla Menezes', 'carlamenezes@email.com', '11982387978', '2000-05-15');

SELECT clientes.nome AS nome_cliente, clientes.email AS email
FROM clientes
LEFT JOIN locacao 
    ON clientes.id = locacao.id_clientes
WHERE locacao.id IS NULL;

-- 8. Exiba o nome das categorias e o preço médio dos filmes de cada uma.
SELECT categorias.nome AS categoria, ROUND(AVG(filmes.preco), 2) AS preco_medio
FROM filmes
INNER JOIN categorias 
    ON filmes.id_categorias = categorias.id
GROUP BY categorias.nome;

-- 9. Mostre qual cliente realizou o maior número de locações.
INSERT INTO locacao (data_locacao, data_devolucao, id_clientes)
VALUES 
('2025-10-15', '2025-10-22', 1),
('2025-11-02', '2025-11-09', 1);

INSERT INTO locacao_has_filme (quantidade, id_locacao, id_filmes)
VALUES
(1, 5, 2),  
(2, 6, 1);  

SELECT clientes.nome AS nome_cliente, COUNT(locacao.id) AS total_locacoes
FROM clientes
INNER JOIN locacao 
    ON clientes.id = locacao.id_clientes
GROUP BY clientes.nome
ORDER BY total_locacoes DESC;

-- 10. Liste todas as categorias que ainda não têm filmes cadastrados.
INSERT INTO categorias (nome)
VALUES ('Drama');

SELECT categorias.nome AS categoria_sem_filmes
FROM categorias
LEFT JOIN filmes 
    ON categorias.id = filmes.id_categorias
WHERE filmes.id IS NULL;

-- 11. Exiba os filmes que nunca foram alugados.
INSERT INTO filmes (titulo, diretor, ano_lancamento, preco, id_categorias)
VALUES ('A Viagem de Chihiro', 'Hayao Miyazaki', 2001, 9.50, 1);

SELECT filmes.titulo AS filme_nao_alugado, categorias.nome AS categoria
FROM filmes
LEFT JOIN locacao_has_filme 
    ON filmes.id = locacao_has_filme.id_filmes
INNER JOIN categorias 
    ON filmes.id_categorias = categorias.id
WHERE locacao_has_filme.id_filmes IS NULL;

-- 12. Liste o nome dos clientes e o total gasto em todas as suas locações.
SELECT clientes.nome AS nome_cliente, ROUND(SUM(filmes.preco * locacao_has_filme.quantidade), 2) AS total_gasto
FROM clientes
INNER JOIN locacao 
    ON clientes.id = locacao.id_clientes
INNER JOIN locacao_has_filme 
    ON locacao.id = locacao_has_filme.id_locacao
INNER JOIN filmes 
    ON locacao_has_filme.id_filmes = filmes.id
GROUP BY clientes.nome
ORDER BY total_gasto DESC;

-- 13. . Mostre a categoria mais lucrativa, considerando a soma dos preços de todos os filmes alugados.
SELECT categorias.nome AS categoria, ROUND(SUM(filmes.preco * locacao_has_filme.quantidade), 2) AS total_lucro
FROM categorias
INNER JOIN filmes 
    ON categorias.id = filmes.id_categorias
INNER JOIN locacao_has_filme 
    ON filmes.id = locacao_has_filme.id_filmes
GROUP BY categorias.nome
ORDER BY total_lucro DESC;

-- 14. Liste os clientes que alugaram filmes de mais de uma categoria.
INSERT INTO locacao (data_locacao, data_devolucao, id_clientes)
VALUES ('2025-11-05', '2025-11-12', 1);

INSERT INTO locacao_has_filme (quantidade, id_locacao, id_filmes)
VALUES (1, 7, 3);

SELECT clientes.nome AS nome_cliente, COUNT(DISTINCT categorias.id) AS total_categorias
FROM clientes
INNER JOIN locacao 
    ON clientes.id = locacao.id_clientes
INNER JOIN locacao_has_filme 
    ON locacao.id = locacao_has_filme.id_locacao
INNER JOIN filmes 
    ON locacao_has_filme.id_filmes = filmes.id
INNER JOIN categorias 
    ON filmes.id_categorias = categorias.id
GROUP BY clientes.nome
ORDER BY total_categorias DESC;

-- 15. Mostre o filme mais alugado e quantas vezes ele foi alugado.
SELECT filmes.titulo AS filme_mais_alugado, COUNT(locacao_has_filme.id_locacao) AS total_alugado
FROM filmes
INNER JOIN locacao_has_filme 
    ON filmes.id = locacao_has_filme.id_filmes
GROUP BY filmes.titulo
ORDER BY total_alugado DESC;

-- 16. Liste os clientes que alugaram filmes da categoria “Terror”, mas nunca alugaram da categoria “Comédia” (Pode substituir por outros nomes de categoria)
INSERT INTO categorias (nome)
VALUES ('Terror'), ('Comédia');

INSERT INTO filmes (titulo, diretor, ano_lancamento, preco, id_categorias)
VALUES
('Invocação do Mal', 'James Wan', 2013, 12.90, 5),
('Todo Mundo em Pânico', 'Keenen Ivory Wayans', 2000, 9.90, 6);

INSERT INTO locacao (data_locacao, data_devolucao, id_clientes)
VALUES ('2025-11-10', '2025-11-17', 1);

INSERT INTO locacao_has_filme (quantidade, id_locacao, id_filmes)
VALUES (1, 9, 4);  

INSERT INTO locacao (data_locacao, data_devolucao, id_clientes)
VALUES ('2025-11-10', '2025-11-17', 2);

INSERT INTO locacao_has_filme (quantidade, id_locacao, id_filmes)
VALUES (1, 10, 5);  

SELECT DISTINCT c.nome AS nome_cliente
FROM clientes AS c
INNER JOIN locacao AS l ON c.id = l.id_clientes
INNER JOIN locacao_has_filme lf ON l.id = lf.id_locacao
INNER JOIN filmes AS f ON lf.id_filmes = f.id
INNER JOIN categorias AS cat ON f.id_categorias = cat.id
WHERE cat.nome = 'Terror'
AND c.id NOT IN (
    SELECT c2.id
    FROM clientes c2
    INNER JOIN locacao l2 ON c2.id = l2.id_clientes
    INNER JOIN locacao_has_filme lf2 ON l2.id = lf2.id_locacao
    INNER JOIN filmes f2 ON lf2.id_filmes = f2.id
    INNER JOIN categorias cat2 ON f2.id_categorias = cat2.id
    WHERE cat2.nome = 'Comédia'
);

-- 17. Mostre o cliente que mais gastou por categoria de filme.
SELECT cat.nome AS categoria, cli.nome AS cliente, ROUND(SUM(f.preco * lhf.quantidade), 2) AS total_gasto
FROM categorias AS cat
INNER JOIN filmes AS f 
    ON cat.id = f.id_categorias
INNER JOIN locacao_has_filme AS lhf 
    ON f.id = lhf.id_filmes
INNER JOIN locacao AS l 
    ON l.id = lhf.id_locacao
INNER JOIN clientes AS cli 
    ON cli.id = l.id_clientes
GROUP BY cat.nome, cli.nome
ORDER BY cat.nome, total_gasto DESC;

-- 18. Mostre a média de preço dos filmes alugados por cliente, mas apenas dos que alugaram 3 ou mais filmes.
INSERT INTO locacao (data_locacao, data_devolucao, id_clientes)
VALUES ('2025-11-12', '2025-11-19', 1);

INSERT INTO locacao_has_filme (quantidade, id_locacao, id_filmes)
VALUES 
(1, 11, 1),  
(1, 11, 2);  

SELECT c.nome AS nome_cliente, ROUND(AVG(f.preco), 2) AS media_preco_filmes, COUNT(lhf.id_filmes) AS total_filmes_alugados
FROM clientes AS c
INNER JOIN locacao AS l 
    ON c.id = l.id_clientes
INNER JOIN locacao_has_filme AS lhf 
    ON l.id = lhf.id_locacao
INNER JOIN filmes AS f 
    ON lhf.id_filmes = f.id
GROUP BY c.nome
HAVING COUNT(lhf.id_filmes) >= 3;

-- 19. Atualize o nome de um dos clientes com UPDATE
SELECT * FROM clientes;

UPDATE clientes
SET nome = 'João Pedro da Silva Souza'
WHERE id = 1;

-- 20. Exclua um dos filmes com DELETE
SELECT * FROM filmes;
SELECT * FROM locacao_has_filme;

DELETE FROM locacao_has_filme
WHERE id_filmes = 5;

DELETE FROM filmes
WHERE id = 5;

