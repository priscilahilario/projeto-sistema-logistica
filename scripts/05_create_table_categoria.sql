-- Script adaptado do PDF: Criação da tabela de Categorias
-- Local: scripts/03_create_table_categoria.sql

CREATE TABLE IF NOT EXISTS tbl_categoria (
    id_categoria SERIAL PRIMARY KEY,    -- Adaptado de CodCategoria (INT)
    nome_categoria VARCHAR(50) NOT NULL -- Adaptado de NomeCategoria
);

-- Comentário para documentação
COMMENT ON TABLE tbl_categoria IS 'Tabela que armazena as categorias dos produtos (ex: Frágil, Químico, etc).';