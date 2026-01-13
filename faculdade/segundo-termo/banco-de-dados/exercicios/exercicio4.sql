-- Nível 1 – Atualizações diretas
USE ecommerce;
-- 1. Atualize o nome da categoria “Hardware” para “Componentes de PC”.
UPDATE categorias
SET nome = 'Componentes de PC'
WHERE id = 3;

-- 2. Corrija o nome do produto “Mouse logitech G512” para “Mouse Logitech G512”
UPDATE produtos
SET nome = 'Mouse Logitech G512'
WHERE id = 1;

-- 3. Atualize o preço do produto “PS5 Pro” para 6299.00.
UPDATE produtos
SET preco = 6299.00
WHERE id = 3;

-- 4. Altere a quantidade do produto “Memoria RAM 32” para 40 unidades.
UPDATE produtos
SET estoque = 40
WHERE id = 5;

-- 5. Diminua em 1 unidade a quantidade do produto “PS5 Pro”, simulando uma venda.
UPDATE produtos
SET estoque = 29
WHERE id = 3;

SELECT * FROM produtos;

-- Nível 2 – Atualizações condicionais
-- 6. Aumente o preço de todos os produtos que custam menos de 1000.00 em 10%.
UPDATE produtos
SET preco = preco * 1.10
WHERE preco < 1000.00;

-- 7. Diminua a quantidade de todos os produtos que custam mais de 5000.00 em 2 unidades.
UPDATE produtos
SET estoque = 27
WHERE id = 3;

-- 8. Corrija o preço de todos os produtos com valor igual a 0.00 para 100.00.
INSERT INTO produtos(nome, preco, estoque, categorias_id)
VALUES 
('Redmi Poco C65', 0.00, 20, 3);

UPDATE produtos
SET preco = 100.00
WHERE id = 6;

-- 9. Altere o nome de todos os produtos que contenham a palavra “RAM” para “Memória RAM DDR4”.
UPDATE produtos
SET nome = 'Memória RAM DDR4'
WHERE nome LIKE '%RAM%'; 

-- 10. Aumente o preço de todos os produtos que tenham quantidade menor que 20 unidades em 5%.
-- Fiz com arredondamento pq tava dando problemas
UPDATE produtos
SET preco = ROUND(preco * 1.05, 2)
WHERE estoque < 20;

-- Nível 3 – Atualizações com múltiplos campos
-- 11. Atualize o produto com id 1 alterando o nome para “Mouse Gamer Logitech G Pro X” e o preço para 799.90.
UPDATE produtos
SET nome = 'Mouse Gamer Logitech G Pro X',
	preco = 799.90
WHERE id = 1;

-- 12. Modifique o produto “Memoria RAM 32” para que o nome fique “Memória RAM DDR5 32GB” e a quantidade seja 25.
INSERT INTO produtos(nome, preco, estoque, categorias_id)
VALUES 
('Memoria RAM 32', 760.00, 20, 3);

UPDATE produtos
SET nome = 'Memória RAM DDR5 32GB',
	estoque = 25
WHERE id = 7;

-- 13. Aumente o preço de todos os produtos em 8% e reduza o estoque em 1 unidade.
UPDATE produtos
SET preco = ROUND(preco * 1.08, 2),
	estoque = estoque - 1;

-- Nível 4 – Desafios
-- 14. Aplique um aumento de 8% em todos os produtos com quantidade menor que 20 unidades.
UPDATE produtos
SET preco = ROUND(preco * 1.08, 2)
WHERE estoque < 20;

-- 15. Corrija eventuais preços negativos, definindo-os como 0.00.
UPDATE produtos
SET preco = 0.00
WHERE preco < 0;

-- 16. Aumente o preço de todos os produtos cujo nome contenha “Logitech” em 12%
UPDATE produtos
SET preco = ROUND(preco * 1.12, 2)
WHERE nome LIKE '%Logitech%'; 

-- 17. Simule uma venda do produto “PS5 Pro”: reduza a quantidade em 1 unidade.
UPDATE produtos
SET estoque = estoque - 1
WHERE nome = 'PS5 PRO';

-- 18. Dê um desconto de 5% em todos os produtos cujo nome contenha “Memória”.
UPDATE produtos
SET preco = ROUND(preco * 0.95, 2)
WHERE nome LIKE '%Memória%';

-- 19. Corrija produtos sem categoria (onde categorias_id está nulo), atribuindo a categoria 1.
UPDATE produtos
SET categorias_id = 1
WHERE categorias_id IS NULL;

-- 20. Aumente o estoque de todos os produtos para 100 unidades.
UPDATE produtos
SET estoque = 100;

SELECT * FROM produtos;
