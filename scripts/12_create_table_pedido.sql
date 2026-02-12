-- Script adaptado do PDF: Criação da tabela de Pedidos
-- Local: scripts/07_create_table_pedido.sql

CREATE TABLE IF NOT EXISTS tbl_pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_funcionario INTEGER NOT NULL,
    id_transportadora INTEGER NOT NULL,
    data_pedido DATE DEFAULT CURRENT_DATE,
    data_entrega DATE,
    data_envio DATE,
    frete DECIMAL(10,2) DEFAULT 0.00,
    nome_destinatario VARCHAR(100),
    endereco_destinatario VARCHAR(150),
    cidade_destinatario VARCHAR(50),
    cep_destinatario CHAR(8),
    pais_destinatario VARCHAR(50) DEFAULT 'Brasil',

    -- Chaves Estrangeiras (Relacionamentos)
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id_cliente),
    CONSTRAINT fk_pedido_funcionario FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionario(id_funcionario),
    CONSTRAINT fk_pedido_transportadora FOREIGN KEY (id_transportadora) REFERENCES tbl_transportadora(id_transportadora)
);

-- Comentário para documentação
COMMENT ON TABLE tbl_pedido IS 'Tabela mestre de pedidos que relaciona clientes, funcionários e transportadoras.';