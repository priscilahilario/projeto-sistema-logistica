-- Inserção de dados para validação da estrutura criada
INSERT INTO tbl_cliente (nome, endereco, cidade, estado, cep, telefone)
VALUES 
('Transportadora TransLog', 'Rua da Logística, 450', 'São Paulo', 'SP', '01010000', '11999998888'),
('Depósito Central Bradesco', 'Av. Industrial, 100', 'Osasco', 'SP', '06000000', '1133334444');

-- Consulta para verificar se os dados foram inseridos
SELECT * FROM tbl_cliente;