USE ecommerce;

-- CRUD
-- R - Read
-- Consulta que vai exibir todas as colunas (*) de uma tabela em especifico (produtos)
SELECT * FROM produtos;
-- Selecionar apenas as colunas que a gente quer exibir (no caso as colunas nome e preco)
SELECT nome, preco FROM produtos;

-- Limitar qtd de registros
SELECT nome, preco FROM produtos
LIMIT 1;

SELECT nome, preco FROM produtos
LIMIT 5;

-- Filtros
--  WHERE
-- Filtrar produtos que tenham preco maior que 500 reais
SELECT * FROM produtos
WHERE preco > 500;

SELECT * FROM produtos
WHERE preco >= 500;

SELECT * FROM produtos
WHERE preco = 500;

SELECT * FROM produtos
WHERE preco != 500;

SELECT * FROM produtos
WHERE preco >= 600 AND preco <= 1000;

SELECT * FROM produtos
WHERE preco >= 600 OR preco <= 1000;

-- ORDERNAÇÃO
-- ORDER BY
SELECT nome, preco FROM produtos
ORDER BY preco;

SELECT nome, preco FROM produtos
ORDER BY preco ASC;

SELECT nome, preco FROM produtos
ORDER BY preco DESC;

SELECT nome, preco FROM produtos
ORDER BY preco DESC
LIMIT 1;

-- Funções agregadas
-- Contagem de registros
-- Quero saber quantos produtos a gente tem cadastros
SELECT COUNT(*) FROM produtos;

SELECT COUNT(nome) FROM produtos;

SELECT COUNT(*) AS qtd_produtos FROM produtos;

SELECT COUNT(nome) AS qtd_produtos_maior_700 FROM produtos
WHERE preco >= 700;

-- Soma de valores
SELECT SUM(estoque) FROM produtos;

SELECT SUM(preco) FROM produtos;

-- Minimo e maximo
SELECT MIN(preco) FROM produtos;

SELECT MAX(preco) FROM produtos;

SELECT MIN(preco), MAX(preco) FROM produtos;

SELECT MAX(preco) FROM produtos;

-- Filtros de texto
-- LIKE
SELECT * FROM clientes;
-- Buscar clientes com sobrenome Augusto

SELECT * FROM clientes
WHERE nome LIKE 'Augusto';

SELECT * FROM clientes
WHERE nome LIKE 'Cesar Augusto';


SELECT * FROM clientes
WHERE nome LIKE 'cesar augusto';

SELECT * FROM clientes
WHERE nome LIKE 'CESAR AUGUSTO';

-- Buscar por nomes que terminem com 'Augusto'
SELECT * FROM clientes
WHERE nome LIKE '%AUGUSTO';

-- Buscar por nomes que comecem com 'Augusto'
SELECT * FROM clientes
WHERE nome LIKE 'AUGUSTO%';

-- Buscar nomes que terminem com a letra 'o'
SELECT * FROM clientes
WHERE nome LIKE '%o';

-- Buscar nomes que contenha a letra
SELECT * FROM clientes
WHERE nome LIKE '%o%';

SELECT * FROM clientes
WHERE nome LIKE '%augusto%';

SELECT * FROM produtos
WHERE nome LIKE '%PS5%'; -- Sony PS5, PS5, PS5 Pro, Sony PS5 Pro


-- Buscar todos os produtos q nao sejam um ps5
SELECT * FROM produtos
WHERE nome NOT LIKE '%PS5%';


-- 50%, 30%

INSERT INTO produtos (nome, preco, estoque, categorias_id)
VALUES
('PS5 com 50% de desconto', 1000.00, 5, 1);

-- Busca pelo texto 50%
SELECT * FROM produtos
WHERE nome LIKE '%50\\%%' ESCAPE '\\';

