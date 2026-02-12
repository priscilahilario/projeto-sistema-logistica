-- Script adaptado do PDF: Criação da tabela de Funcionários
-- Local: scripts/06_create_table_funcionario.sql

CREATE TABLE IF NOT EXISTS tbl_funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    sobrenome VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cargo VARCHAR(50),
    tratamento VARCHAR(20), -- Ex: Sr., Sra., Dr.
    data_nascimento DATE,
    data_admissao DATE DEFAULT CURRENT_DATE,
    endereco VARCHAR(150),
    cidade VARCHAR(50),
    regiao VARCHAR(50),
    cep CHAR(8),
    pais VARCHAR(50) DEFAULT 'Brasil',
    telefone_residencial VARCHAR(20),
    extensao VARCHAR(4), -- Ramal interno
    notas TEXT
);

-- Comentário para documentação no PostgreSQL
COMMENT ON TABLE tbl_funcionario IS 'Tabela que armazena o cadastro de colaboradores da empresa de logística.';