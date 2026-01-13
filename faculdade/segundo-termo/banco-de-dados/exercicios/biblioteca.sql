-- Foi meus primeiros codigos de MySQL Workbench
  
CREATE DATABASE biblioteca CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
USE biblioteca;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ra INT NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

SELECT * FROM usuario;

INSERT INTO usuario (nome, ra, telefone, email)
VALUES
("João Pedro", 123456, "14987654321", "joao_pedro@email.com"),
("Maria Souza", 654321, "11997654321", "maria.souza@email.com"),
("Carlos Cunha", 789123, "18996543217", "carlos.cunha@email.com");

CREATE TABLE livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(100) NOT NULL,
    resumo VARCHAR(500) NOT NULL,
    ano_publicacao INT NOT NULL,
    editora VARCHAR(100) NOT NULL,
    genero VARCHAR(100) NOT NULL
);

SELECT * FROM livro;

INSERT INTO livro (titulo, isbn, resumo, ano_publicacao, editora, genero)
VALUES
("Dom Casmurro", "9781234567897", "Romance clássico da literatura brasileira", 1899, "Editora A", "Romance"),
("Clean Code", "9780132350884", "Guia de boas práticas de programação", 2008, "Prentice Hall", "Tecnologia"),
("O Senhor dos Anéis", "9780261102385", "Fantasia épica em três volumes", 1954, "Allen & Unwin", "Fantasia");

CREATE TABLE autor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pais_origem VARCHAR(50) NOT NULL
);

SELECT * FROM autor;

INSERT INTO autor (nome, pais_origem)
VALUES
("Machado de Assis", "Brasil"),
("Robert C. Martin", "EUA"),
("J. R. R. Tolkien", "Reino Unido");

CREATE TABLE exemplar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL,
    livro_id INT NOT NULL,
    FOREIGN KEY (livro_id) REFERENCES livro(id)
);

SELECT * FROM exemplar;

INSERT INTO exemplar (codigo, livro_id)
VALUES
("EX001", 1),
("EX002", 2),
("EX003", 3);

CREATE TABLE emprestimo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_retirada DATE NOT NULL,
    prazo_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20),
    usuario_id INT NOT NULL,
    exemplar_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (exemplar_id) REFERENCES exemplar(id)
);

SELECT * FROM emprestimo;

INSERT INTO emprestimo (data_retirada, prazo_devolucao, data_devolucao, status, usuario_id, exemplar_id)
VALUES
("2025-09-10", "2025-09-20", "2025-09-18", "Devolvido", 1, 2),
("2025-09-12", "2025-09-22", "2025-09-22", "Em andamento", 2, 3),
("2025-09-15", "2025-09-25", "2025-09-29", "Atrasado", 3, 1);

CREATE TABLE autor_has_livro(
	id INT AUTO_INCREMENT PRIMARY KEY,
    autor_id INT NOT NULL,
    livro_id INT NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES autor(id),
    FOREIGN KEY (livro_id) REFERENCES livro(id)
);

SELECT * FROM autor_has_livro;

INSERT INTO autor_has_livro(autor_id, livro_id)
VALUES
(1, 2),
(2, 3),
(3, 1);
