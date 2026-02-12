-- Script adaptado do PDF: Criação da tabela de Produtos
-- Local: scripts/08_create_table_produto.sql

CREATE TABLE IF NOT EXISTS tbl_produto (
    id_produto SERIAL PRIMARY KEY,
    nome_produto VARCHAR(40) NOT NULL,
    id_fornecedor INTEGER NOT NULL,
    id_categoria INTEGER NOT NULL,
    quantidade_por_unidade VARCHAR(20),
    preco_unitario DECIMAL(10,2) DEFAULT 0,
    unidades_em_estoque SMALLINT DEFAULT 0,
    unidades_em_ordem SMALLINT DEFAULT 0,
    nivel_de_reposicao SMALLINT DEFAULT 0,
    descontinuado BOOLEAN DEFAULT FALSE,

    -- Chaves Estrangeiras (Relacionamentos)
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES tbl_fornecedor(id_fornecedor),
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES tbl_categoria(id_categoria)
);

-- Comentário para documentação
COMMENT ON TABLE tbl_produto IS 'Tabela que centraliza os itens do inventário, ligados a fornecedores e categorias.';