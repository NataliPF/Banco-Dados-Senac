 -- DML (INSERT - UPDATE - DELETE)
USE gestaoacademica;

INSERT INTO aluno (Matricula, nome, cpf) values 
(5, 'Pedro Rocha', '56789012345'),
(6, 'Monica Sousa', '67890123456'),
(7, 'Fábio Silva', '78901234567');

select * from aluno;

-- Insira os cursos Ciêcia da Computação, Engenharia Civil, Administração
-- Medicina e Arquitetura na tabela gestaoacademica.curso
select * from curso;

INSERT INTO curso (id, nome) values 
(1,'Ciências da computação'),
(2,'Engenharia da Civil'),
(3, 'Administração'),
(4, 'Medicina'),
(5,'Arquitetura');

-- Cadastre o aluno de ID 1 nos cursos de ID 3 e 5.
-- Cadastre o aluno de ID 2 nos cursos de ID 2 e 4.
-- Cadastre o aluno de ID 3 nos cursos de ID 2 e 5.
-- Para cadastrar uma data, use o formato '2024-02-23'

SELECT * FROM matricula;
INSERT INTO matricula values
(1, 3,'2024-03-21'),
(1, 5,'2024-03-21'),
(2, 2, '2024-03-12'),
(2, 4, '2024-02-13'),
(3, 2, '2024-02-07'),
(3, 5, '2024-02-30');

-- Cadastre 5 professores e 3 disciplinas
-- Associe cada professor a ao menos uma disciplina
select * from professor;

INSERT INTO professor (id, nome, Especializacao) values
(1,'Gilson', 'Tecnologia'),
(2,'João', 'Idiomas'),
(3,'Maria', 'Filosofia'),
(4,'José', 'Pedagogia'),
(5,'Joselito', 'Matematica');

select *from disciplina;
INSERT INTO disciplina (id, horas, nome) values
(1, 50, 'Matematica "Avançado" II'),
(2, 40, "Ingles Tecnico"),
(3, 60, "Filosofia");

select *from professor_disciplina;
INSERT INTO professor_disciplina (Professor_ID, Disciplina_ID) values
(1,1),
(2,1),
(3,2),
(4,2),
(5,1),
(5,3),
(2,3), 	
(1,3);

-- Atualiza o registro na tabela DDL Update
UPDATE professor 
SET especializacao = 'Inteligencia Artifical' 
WHERE id = 5;

select * from disciplina;

UPDATE disciplina
SET nome = 'Matemática Avançada', horas = 80
WHERE ID = 1; 

-- Update de toas as horas para 40 onde Horas for maior que 40
UPDATE disciplina
SET horas = 40
WHERE horas > 40;

-- DML Delete
DELETE FROM disciplina WHERE id = 3;
