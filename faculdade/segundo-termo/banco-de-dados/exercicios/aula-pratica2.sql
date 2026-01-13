USE ecommerce;

-- UPDATE
-- Atualizar um unico campo

SELECT * FROM produtos
WHERE id = 2;

-- Alterou o estoque do produto de id = 2 para 60
UPDATE produtos
SET estoque = 60
WHERE id = 2;

-- Alterou o estoque de todos os produtos para 60
UPDATE produtos
SET estoque = 60;

-- Alterar mais de um campo
UPDATE produtos
SET nome = 'Mouse Logitech G305', 
	preco = 427.00
WHERE id = 1;

-- Aumentar em 10%
UPDATE produtos
SET preco = preco * 1.10;

-- DELETE
DELETE FROM produtos
WHERE id = 2;

SELECT * FROM produtos
