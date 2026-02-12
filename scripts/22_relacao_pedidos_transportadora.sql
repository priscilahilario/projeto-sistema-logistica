-- Script baseado no PDF: Relação entre tabelas Pedidos e Transportadora
-- Local: scripts/13_relacao_pedidos_transportadora.sql

DO $$ 
BEGIN
    -- 1. Garantir que a coluna de ligação existe na tabela de Pedidos
    -- No manual original (SQL Server) o nome é CodigoDaTransportadora
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name='tbl_pedido' AND column_name='id_transportadora') THEN
        ALTER TABLE tbl_pedido ADD COLUMN id_transportadora INTEGER;
    END IF;

    -- 2. Criar a restrição de Chave Estrangeira (FK)
    -- Removemos se já existir para evitar conflitos de migração
    ALTER TABLE tbl_pedido DROP CONSTRAINT IF EXISTS fk_pedidos_transportadoras;

    ALTER TABLE tbl_pedido 
    ADD CONSTRAINT fk_pedidos_transportadoras 
    FOREIGN KEY (id_transportadora) REFERENCES tbl_transportadora(id_transportadora)
    ON DELETE SET NULL; -- Se a transportadora for apagada, o pedido fica com o campo nulo em vez de ser apagado

    RAISE NOTICE 'Relacionamento entre Pedidos e Transportadora estabelecido com sucesso!';
END $$;