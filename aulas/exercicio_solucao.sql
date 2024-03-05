-- Selecionar todos os alunos
SELECT * FROM aluno;
-- Selecionar apenas os nomes e CPFs dos alunos
SELECT nome,cpf FROM aluno;
-- Selecionar alunos matriculados após uma data específica
 -- INSERT INTO Matricula(Aluno_ID, Curso_ID, DataMatricula) VALUES
-- NÃO CONSEGUI
-- Contar quantas disciplinas existem com carga horária maior que X
SELECT COUNT(*) AS QuantidadeDeDisciplina
FROM disciplina
WHERE horas > 30;
-- Contar quantas matrículas existem para cada curso
 SELECT COUNT(*) AS matricula
 FROM matricula
 -- WHERE NÃO CONSEGUI COLOCAR O CURSO
-- Contar quantas disciplinas cada professor leciona
SELECT professor.nome AS Nome_Professor, disciplina.nome AS Nome_disciplina
FROM professor
JOIN
-- Combinar nome do aluno e data da matrícula

-- Combinar nome do curso e nome do aluno

-- Contar quantos alunos se matricularam em cada curso

