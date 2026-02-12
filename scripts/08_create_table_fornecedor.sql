-- Script adaptado do PDF: Criação da tabela de Fornecedores
-- Local: scripts/05_create_table_fornecedor.sql

CREATE TABLE IF NOT EXISTS tbl_fornecedor (
    id_fornecedor SERIAL PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    nome_contato VARCHAR(50),
    cargo_contato VARCHAR(50),
    endereco VARCHAR(150),
    cidade VARCHAR(50),
    cep CHAR(8),
    pais VARCHAR(50) DEFAULT 'Brasil',
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Comentário para documentação
COMMENT ON TABLE tbl_fornecedor IS 'Tabela que armazena os dados dos fornecedores de produtos.';