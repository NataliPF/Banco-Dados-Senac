-- ---------------------
-- Consultas Básicas
-- ---------------------

-- Exemplo: Selecionar todos os alunos
SELECT * FROM Aluno;

-- SELECT
-- FROM
-- WHERE
-- ORDER BY

SELECT nome, cpf
FROM aluno;

SELECT *
FROM aluno
WHERE matricula > 3;

SELECT *
FROM aluno
WHERE matricula > 3
ORDER BY nome;

-- Operadores Matemáticos e lógicos
SELECT * FROM disciplina;

SELECT nome, horas 
FROM disciplina
WHERE horas >= 40 AND horas <= 50;

-- Aliases para Melhor Legibilidade
SELECT nome AS nome_disciplina, horas AS carga_horaria
FROM disciplina;

-- Exiba da tabela professor, todos os professores por ordem alfabética 
-- Ordem o professor tenha ID maior do 2 e menor do que 6
-- Não exibindo a especialização e mudando a coluna "Nome" para "Nome_Professor"

SELECT Id,Nome AS Nome_Professor
FROM professor
WHERE Id > 2 AND Id < 6
ORDER BY nome;

-- Exemplo: Contar quantas disciplinas existem 
SELECT COUNT(*) AS QuantidadeDeDisciplinas
FROM disciplina
WHERE horas > 50;

-- Me informe quantas matrículas foram feitas no curso de ID 2
SELECT COUNT(*) AS QuantidadedeMatricula
FROM matricula
where curso_id = 2;

-- Exemplo: Selecionar professor com especialização que envolva Tecnologia
SELECT *
FROM professor
WHERE especializacao LIKE '%Tecnologia%';




 
 


