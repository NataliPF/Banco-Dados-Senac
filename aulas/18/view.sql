# HAVING

-- Selecionar chalé com média de capacidade superior a 3
SELECT codChale, AVG(capacidade) AS capacidade_media
FROM chale
GROUP BY codChale
HAVING capacidade_media > 3;

-- Selecionar os clientes com mais de uma hospedahem registrada
SELECT codCliente, COUNT(*) AS qtd_hospedagem
FROM hospedagem
GROUP BY codCliente
HAVING  COUNT(*) > 1;

-- Selecionar Serviços com valor total superior a 100
SELECT hospedagem_servico.codHospedagem, SUM(servico.valorServico) AS total_valor
FROM hospedagem_servico
JOIN servico ON hospedagem_servico.codServico = servico.codServico
GROUP BY hospedagem_servico.codHospedagem;


-- Criar uma view
CREATE VIEW ViewMediaCapacidade AS
SELECT codChale, AVG(capacidade) AS media_capacidade
FROM chale
GROUP BY codChale;


-- Selecionar dados de view
SELECT * FROM viewmediacapacidade;

-- Crie uma view que informe aos dados da hospedage, com os dados do cliente, inclindo o telefone
CREATE VIEW ViewHospedagemDadosCliente AS
SELECT Hospedagem.*, cliente.nomeCliente, telefone.telefone
FROM hospedagem
LEFT JOIN cliente ON hospedagem.codCliente = cliente.codCliente
INNER JOIN telefone ON cliente .codCliente = telefone.codCliente;

-- Consulte a view ViewHospedagemDadosClientes
SELECT * FROM ViewHospedagemDadosClientes;

 