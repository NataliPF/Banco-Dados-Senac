-- 1. Crie uma tabela chamada Fornecedor para armazenar informações sobre os fornecedores do sistema.
-- id, nome, endereço, telefone, email e uma observação (text)
USE sistema_vendas;
CREATE TABLE IF NOT EXISTS Fornecedor( 
Id INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
Endereco VARCHAR(100) NOT NULL,
Telefone VARCHAR(50) NOT NULL,
Email VARCHAR (50) NOT NULL,
Observacao text
);

-- 2. Adicione uma coluna chamada CNPJ à tabela Fornecedor para armazenar os números de CNPJ dos fornecedores.
ALTER TABLE Fornecedor
ADD COLUMN CNPJ INT (50);

-- 3. Adicione uma chave estrangeira à tabela Fornecedor para relacioná-la à tabela Categoria, representando a categoria do fornecedor.
ALTER TABLE Fornecedor 
ADD COLUMN CategoriaId INT,
ADD FOREIGN KEY (CategoriaId) REFERENCES Categoria(id);

-- 4. Modifique o tipo da coluna Telefone na tabela Fornecedor para armazenar números de telefone com no máximo 15 caracteres.
ALTER TABLE Fornecedor
CHANGE Telefone Telefone VARCHAR(15) NOT NULL;

-- 5. Remova a coluna Observacao da tabela Fornecedor, pois não é mais necessária.
ALTER TABLE Fornecedor
DROP COLUMN Observacao;

-- 6. Remova a tabela Fornecedor do banco de dados, se existir.
  DROP TABLE Fornecedor;

#################### DML
-- 0. Crie ao menos 5 registros para cada tabela, ignorando o gerneciamento de usuários. Um dos clientes deverá ter o seu nome
INSERT INTO Categoria (Nome, Descricao, UsuarioAtualizacao) VALUES
('Roupas', 'Categoria relacionada a produtos de vestuário.', 1),
('Esportes', 'Categoria relacionada a produtos esportivos.', 2),
('Livros', 'Categoria relacionada a produtos literários.', 3),
('Alimentos', 'Categoria relacionada a produtos alimentícios.', 4),
('Tecnologia', 'Categoria relacionada a produtos de tecnologia.', 5);
INSERT INTO Cliente (Nome, Email, Telefone, UsuarioAtualizacao) VALUES
('Natali Projetti', 'nana_projetti', '123456789', 1),
('Maria Oliveira', 'maria@example.com', '987654321', 2),
('Carlos Santos', 'carlos@example.com', '555444333', 3),
('Ana Souza', 'ana@example.com', '999888777', 1),
('Pedro Mendes', 'pedro@example.com', '111222333', 2);
 
INSERT INTO FormaPagamento (Nome, Descricao, UsuarioAtualizacao) VALUES
('Cartão de Crédito', 'Pagamento realizado através de cartão de crédito.', 1),
('Boleto Bancário', 'Pagamento realizado através de boleto bancário.', 2),
('Transferência Bancária', 'Pagamento realizado através de transferência bancária.', 1),
('Dinheiro', 'Pagamento realizado em espécie.', 3),
('Pix', 'Pagamento realizado através de transferência via Pix.', 2);
 
INSERT INTO GrupoUsuario (Nome, Descricao, UsuarioAtualizacao) VALUES
('Administradores', 'Grupo de usuários com permissões administrativas.', 1),
('Usuários Padrão', 'Grupo de usuários com permissões básicas.', 2),
('Gerentes', 'Grupo de usuários com permissões de gerenciamento.', 3),
('Desenvolvedores', 'Grupo de usuários responsáveis pelo desenvolvimento de software.', 1),
('Analistas', 'Grupo de usuários responsáveis pela análise de dados.', 2);
 
INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID, UsuarioAtualizacao) VALUES 
('Notebook', 'Notebook de alta performance', 25, 1, 1),
('Camisa Polo', 'Camisa Polo de algodão', 35, 3, 2),
('Livro "O Senhor dos Anéis"', 'Clássico da literatura fantástica', 45, 4, 1),
('Fones de ouvido Bluetooth', 'Fones de ouvido sem fio', 79, 1, 3),
('Tênis de Corrida', 'Tênis para corridas de longa distância', 120, 2, 2);
 
INSERT INTO ItemPedido (PedidoId, ProdutoId, Quantidade, UsuarioAtualizacao) VALUES 
(1, 3, 2, 1),
(1, 1, 1, 2),    
(2, 2, 3, 1),   -- --------- Erro Corrigir
(3, 4, 1, 3),
(3, 5, 2, 2);
 
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamentoId, STATUS, UsuarioAtualizacao) VALUES
(1, '2024-03-14 10:30:00', 1, 'Pendente', 1),
(2, '2024-03-14 11:45:00', 2, 'Processando', 2),
(3, '2024-03-14 12:20:00', 3, 'Enviado', 1),
(1, '2024-03-14 13:10:00', 1, 'Pendente', 3),
(4, '2024-03-14 14:00:00', 4, 'Entregue', 2);

-- 1. Atualizar o nome de um cliente:
UPDATE cliente 
SET nome = 'Marlene Augusta'
 WHERE id = 2;

-- 2. Deletar um produto:
DELETE FROM produto WHERE id = 6;

-- 3. Alterar a categoria de um produto:
UPDATE produto 
SET categoriaID = 4 
WHERE id =7;

-- 4. Inserir um novo cliente:
INSERT INTO cliente (Nome,email,telefone,usuarioAtualizacao) VALUES
('Joao Carlos','joaocarlos.com','11123498765',3);

-- 5. Inserir um novo pedido:
INSERT INTO Pedido (ClienteId, DataPedido, FormaPagamentoId, status, UsuarioAtualizacao) VALUES 
(2, CURRENT_DATE(), 3, 'Processando', 1);

-- 6. Atualizar o preço de um produto:
UPDATE produto SET preco = 900.00 WHERE id = 5;

############## DQL - Sem Joins
-- 1. Selecione todos os registros da tabela Produto:
SELECT * FROM produto;

-- 2. Selecione apenas o nome e o preço dos produtos da tabela Produto:
SELECT nome,preco FROM produto;

-- 3. Selecione os produtos da tabela Produto ordenados por preço, do mais barato para o mais caro:
SELECT * FROM produto ORDER BY preco ;

-- 4. Selecione os produtos da tabela Produto ordenados por preço, do mais caro para o mais barato:
SELECT * FROM produto ORDER BY preco DESC ;

-- 5. Selecione os nomes distintos das categorias da tabela Categoria:
SELECT DISTINCT nome FROM categoria;

-- 6. Selecione os produtos da tabela Produto cujo preço esteja entre $10 e $50:
SELECT nome preco FROM produto  WHERE preco BETWEEN  10 and 50; 

-- 7. Selecione os produtos da tabela Produto, mostrando o nome como "Nome do Produto" e o preço como "Preço Unitário":
SELECT Nome AS Nome_do_produto, preco AS Preco_unitário
FROM produto;

-- 8. Selecione os produtos da tabela Produto, adicionando uma coluna calculada "Preço Total" multiplicando a quantidade pelo preço:


-- 9. Selecione os produtos da tabela Produto, mostrando apenas os 10 primeiros registros:
SELECT * 
FROM PRODUTO
LIMIT 10;

-- 10. Selecione os produtos da tabela Produto, pulando os primeiros 5 registros e mostrando os 10 seguintes:
SELECT *
FROM PRODUTO
LIMIT 10 OFFSET 5;

############# DQL - Joins
-- 1. Selecione o nome do produto e sua categoria:


-- 2. Selecione o nome do cliente e o nome do produto que ele comprou:


-- 3. Selecione todos os produtos, mesmo aqueles que não têm uma categoria associada:


-- 4. Selecione todos os clientes, mesmo aqueles que não fizeram nenhum pedido:


-- 5. Selecione todas as categorias, mesmo aquelas que não têm produtos associados:


-- 6. Selecione todos os produtos, mesmo aqueles que não foram pedidos:



############### DQL com joins e demais filtros
-- 1. Selecione o nome da categoria e o número de produtos nessa categoria, apenas para categorias com mais de 5 produtos:


-- 2. Selecione o nome do cliente e o total de pedidos feitos por cada cliente:


-- 3. Selecione o nome do produto, o nome da categoria e a quantidade total de vendas para cada produto:


-- 4. Selecione o nome da categoria, o número total de produtos nessa categoria e o número de pedidos para cada categoria:


-- 5. Selecione o nome do cliente, o número total de pedidos feitos por esse cliente e a média de produtos por pedido, apenas para clientes que tenham feito mais de 3 pedidos:


##### Crie uma View qualquer para qualquer um dos joins desenvolvidos

##### Crie uma transaction que cadastra um cliente e faça uma venda
-- Início da transação

-- Inserir um novo cliente


-- Inserir um novo pedido para o cliente


-- Inserir itens no pedido


-- Commit da transação (confirmação das alterações)
