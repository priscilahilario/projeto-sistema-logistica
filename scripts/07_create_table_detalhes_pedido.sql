-- Script adaptado do PDF: Criação da tabela de Detalhes do Pedido
-- Local: scripts/04_create_table_detalhes_pedido.sql

CREATE TABLE IF NOT EXISTS tbl_detalhes_pedido (
    id_detalhe SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2) DEFAULT 0,
    
    -- Criando os relacionamentos (Chaves Estrangeiras)
    CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES tbl_pedido(id_pedido),
    CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES tbl_produto(id_produto)
);

-- Comentário para documentação
COMMENT ON TABLE tbl_detalhes_pedido IS 'Tabela que armazena os itens específicos de cada pedido de logística.';