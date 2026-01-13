USE musicbazar; 

# 1. Liste todos os instrumentos cadastrados mostrando: id, titulo, marca, modelo e preco_base.
SELECT id, titulo, marca, modelo, preco_base
FROM instrumentos;

# 2. Liste os instrumentos com ano_fabricacao maior que 2018.
SELECT * FROM instrumentos
WHERE ano_fabricacao > 2018;

# 3. Liste todos os anúncios que estão com o status 'ativo'.

SELECT * FROM anuncios
WHERE status_anuncio = 'ativo';

# 4. Liste todos os compradores que já realizaram alguma compra, mostrando:
# a. nome do comprador
# b. id da venda
# c. valor_venda.
SELECT usuarios.nome AS nome_comprador, vendas.id AS id_venda, vendas.valor_venda
FROM vendas
INNER JOIN usuarios 
	ON vendas.id_comprador = usuarios.id;
    
# 5. Liste os usuários cujo nome termina com a letra "s".
SELECT * FROM usuarios
WHERE nome LIKE '%s';

# 6. Mostre todos os instrumentos que já foram anunciados mais de uma vez.
SELECT instrumentos.id, instrumentos.titulo, COUNT(anuncios.id) AS total_anuncios
FROM instrumentos
INNER JOIN anuncios 
	ON instrumentos.id = anuncios.id_instrumento
GROUP BY instrumentos.id, instrumentos.titulo
HAVING COUNT(anuncios.id) > 1;

# 7. Liste todos os anúncios com as seguintes informações:
# a. id do anúncio
# b. nome do vendedor
# c. titulo do instrumento
# d. preco_anuncio
SELECT anuncios.id AS id_anuncio, usuarios.nome AS nome_vendedor, instrumentos.titulo AS titulo_instrumento, anuncios.preco_anuncio AS preco_anuncio
FROM anuncios
INNER JOIN usuarios
	ON anuncios.id_usuario = usuarios.id
INNER JOIN instrumentos
	ON anuncios.id_instrumento = instrumentos.id;
    
# 8. Mostre o nome do vendedor e os anúncios que já foram vendidos.
SELECT usuarios.nome As nome_vendedor, anuncios.id AS id_anuncio, anuncios.preco_anuncio
FROM anuncios
INNER JOIN usuarios
	ON anuncios.id_usuario = usuarios.id
WHERE anuncios.status_anuncio = 'vendido';

# 9. Mostre quantos instrumentos existem por categoria
SELECT categorias_instrumentos.nome AS categorias, COUNT(instrumentos.id) AS total_instrumentos
FROM categorias_instrumentos
INNER JOIN instrumentos
	ON instrumentos.id_categoria = categorias_instrumentos.id
GROUP BY categorias_instrumentos.nome;

# 10.Mostre as 2 categorias com menos instrumentos cadastrados
SELECT categorias_instrumentos.nome AS categorias, COUNT(instrumentos.id) AS total_instrumentos
FROM categorias_instrumentos 
INNER JOIN instrumentos
	ON instrumentos.id_categoria = categorias_instrumentos.id
GROUP BY categorias_instrumentos.nome
ORDER BY total_instrumentos DESC
LIMIT 2;

# 11. Liste as categorias de instrumentos que não possuem nenhum instrumento cadastrado.
SELECT instrumentos.id, instrumentos.titulo
FROM instrumentos
LEFT JOIN anuncios
	ON instrumentos.id = anuncios.id_instrumento
WHERE anuncios.id IS NULL;

