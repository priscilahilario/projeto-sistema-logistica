-- Script adaptado do PDF: Criação da tabela de Transportadoras
-- Local: scripts/02_create_table_transportadora.sql

CREATE TABLE IF NOT EXISTS tbl_transportadora (
    id_transportadora SERIAL PRIMARY KEY,    -- Adaptado de INT para SERIAL
    nome_transportadora VARCHAR(30) NOT NULL,
    contato VARCHAR(50),
    telefone VARCHAR(20)
);

-- Comentário para o banco de dados
COMMENT ON TABLE tbl_transportadora IS 'Tabela que armazena as transportadoras parceiras do sistema de logística.';