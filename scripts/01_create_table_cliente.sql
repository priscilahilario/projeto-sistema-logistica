-- Criar a tabela de clientes adaptada do manual original
-- Local: scripts/01_create_table.sql

CREATE TABLE IF NOT EXISTS tbl_cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    cidade VARCHAR(50),
    estado CHAR(2),
    cep CHAR(8),
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Comentário para documentação no banco
COMMENT ON TABLE tbl_cliente IS 'Tabela que armazena dados cadastrais dos clientes da logística.';