## Utilize o banco de dados hotel (disponível no github) para responder a atividade
# Consultas sem JOINS
-- Consulte todos os clientes de São Paulo (SP)
SELECT * FROM Cliente WHERE estadoCliente = 'SP';

-- Selecionar hospedagens com mais de 3 pessoas e desconto igual a 0
SELECT * FROM HOSPEDAGEM WHERE qtdPessoas > 3 AND desconto = 0.0;

-- Selecionar telefones de clientes com ID 1 ou 2, limitando a 2 resultados
SELECT * FROM TELEFONE
WHERE codCliente = 1 OR codCliente = 2 LIMIT 2;

-- Selecionar chalés com capacidades entre 4 e 6, ordenaos por valor em alta estação
SELECT * FROM Chale WHERE capacidade BETWEEN 4 AND 6 ORDER BY valorAltaEstacao DESC;

-- Selecione todos os itens que contenham "de" na descrição, pulando os 2 primeiros resultados
SELECT * FROM Item WHERE descricaoItem LIKE ('%de%') LIMIT 100 OFFSET 2;

# Consultas com JOINS
-- Selecioar detalhes da hospedagem, incluindo informações do cliente
SELECT Hospedagem.*, Cliente.nomeCliente
FROM Hospedagem
JOIN cliente ON Hospedagem.codCliente = ClientecodCliente;

-- Selecionar chalés com os itens associados
SELECT Chale.*, Item.nomeItem AS Item
FROM Chale
LEFT JOIN chale_item ON Chale.codChale = chale_item.codChale
LEFT JOIN item ON chale_item.nomeItem = item.nomeItem;

-- Selecionar serviços utilizados em uma hospedagem
SELECT Serviço.*, hospedagem_serviço.dataServiço
FROM hospedagem_serviço
INNER JOIN serviço ON hospedagem_serviço.codServiço = serviço.codServiço
WHERE hospedagem_serviço.codHospedagem = 1;

-- Consultar os clientes com seus telefones
SELECT Cliente.*, GROUP_CONCAT(telefone.telefone) AS Telefone
FROM Cliente
LEFT JOIN Telefone ON Cliente.codCliente = Telefone.codCliente
GROUP BY Cliente.codCliente;

-- Selecionar chalés ocupados em uma data específica
SELECT Chale.*, hospedagem.dataInicio, hospedagem.dataFim
FROM chale
JOIN Hospedagem ON chale.codChale = hospedagem.codchale
WHERE '2024-03-25' BETWEEN hospedagem.dataInicio AND hospedagem.dataFim