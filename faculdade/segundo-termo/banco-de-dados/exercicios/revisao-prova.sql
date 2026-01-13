# Revisão Prova

USE turmas;

# Quantos alunos cada turma possui?
# tabela: alunos e turmas

SELECT turmas.id, turmas.nome_turma, COUNT(alunos.id)
FROM turmas
LEFT JOIN alunos #traz todos os registros da tabela turmas e seus correspondentes, mesmo que estejam vazios
	ON alunos.turma_id = turmas.id
GROUP BY turmas.id;

# Exibir somente as turmas que tenham 2 alunos ou mais
SELECT turmas.id, turmas.nome_turma, COUNT(alunos.id)
FROM turmas
LEFT JOIN alunos 
	ON alunos.turma_id = turmas.id
GROUP BY turmas.id
HAVING COUNT(alunos.id) >= 2;

# Exibir apenas as diciplinas que a nota média seja maior ou igual a 7
SELECT disciplina_id, AVG(nota)
FROM matriculas
GROUP BY disciplina_id
HAVING AVG(nota) >= 7;

SELECT disciplina_id, AVG(nota) AS media
FROM matriculas
GROUP BY disciplina_id
HAVING media >= 7;

SELECT disciplina_id, ROUND(AVG(nota), 2) AS media
FROM matriculas
GROUP BY disciplina_id
HAVING media >= 7
ORDER BY media DESC;

