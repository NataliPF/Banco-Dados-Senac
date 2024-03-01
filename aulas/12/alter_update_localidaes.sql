USE localidades;

CREATE TABLE PREFEITO (
ID INT AUTO_INCREMENT PRIMARY KEY,  
Nome VARCHAR(50) NOT NULL,
DataPosse DATE NOT NULL
);

ALTER TABLE CIDADE
ADD COLUMN Prefeito_Id INT,
ADD FOREIGN KEY(Prefeito_Id) REFERENCES PREFEITO(Id);

SELECT * FROM CIDADE;
INSERT INTO PREFEITO (Nome, DataPosse) VALUES
('Judas da Silva', '2024-01-01'),
('Maria Aparecida', '2024-01-01'),
('Carlos Carvalho', '2024-01-01');


UPDATE CIDADE
SET Prefeito_ID = 1
WHERE Nome = 'São Paulo';

UPDATE CIDADE
SET Prefeito_ID = 2
WHERE ID = '5';

UPDATE CIDADE
SET Prefeito_ID = 3
WHERE Estado_ID = 2 AND ID = 3;