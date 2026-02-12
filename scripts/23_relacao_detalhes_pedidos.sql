-- Script baseado no PDF: Relação entre Detalhes do Pedido e Pedidos
-- Local: scripts/14_relacao_detalhes_pedidos.sql

DO $$ 
BEGIN
    -- 1. Garantir que a coluna de ligação (FK) existe na tabela de Detalhes
    -- No manual original o nome é NumeroDoPedido
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name='tbl_detalhes_pedido' AND column_name='id_pedido') THEN
        ALTER TABLE tbl_detalhes_pedido ADD COLUMN id_pedido INTEGER;
    END IF;

    -- 2. Criar a restrição de Chave Estrangeira
    ALTER TABLE tbl_detalhes_pedido DROP CONSTRAINT IF EXISTS fk_detalhes_pedidos;

    ALTER TABLE tbl_detalhes_pedido 
    ADD CONSTRAINT fk_detalhes_pedidos 
    FOREIGN KEY (id_pedido) REFERENCES tbl_pedido(id_pedido)
    ON DELETE CASCADE; -- Se o pedido principal for apagado, os itens dele também serão

    RAISE NOTICE 'Relacionamento entre Detalhes e Pedidos estabelecido com sucesso!';
END $$;