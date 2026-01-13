-- Nível 1 – Consultas simples
-- 1. Liste todos os produtos com todas as colunas.
USE ecommerce;
SELECT * FROM produtos;

-- 2. Liste apenas os nomes e preços dos produtos
SELECT nome, preco FROM produtos;

-- 3. Liste os produtos cujo preço seja maior que 500.
SELECT * FROM produtos
WHERE preco > 500;

-- Nível 2 – Filtrando e ordenando
-- 4. Liste os produtos cujo estoque seja menor que 20, ordenados pelo preço crescente.
SELECT * FROM produtos
WHERE estoque < 20 ORDER BY estoque ASC;

-- 5. Liste os produtos cujo nome contenha “PS5”.
SELECT * FROM produtos
WHERE nome LIKE '%PS5%';

-- 6. Liste os 2 produtos mais caros.
SELECT * FROM produtos
WHERE preco > 500;

-- Nível 3 – Funções agregadas
-- 7. Conte quantos produtos existem na tabela produtos.
SELECT COUNT(*) FROM produtos;

-- 8. Calcule a soma de todos os estoques. 
SELECT COUNT(estoque) FROM produtos;

-- 9. Descubra o preço médio dos produtos.
SELECT AVG(preco) FROM produtos;

-- 10. Descubra o menor e maior preço dos produtos.
SELECT MIN(preco), MAX(preco) FROM produtos;

