-- Script baseado no PDF: Como relacionar TablePedidos e TableClientes
-- Local: scripts/09_relacao_pedidos_clientes.sql

DO $$ 
BEGIN
    -- 1. Verificar se a coluna id_cliente existe na tbl_pedido
    -- No manual original (T-SQL) o nome costuma ser CodigoDoCliente
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name='tbl_pedido' AND column_name='id_cliente') THEN
        ALTER TABLE tbl_pedido ADD COLUMN id_cliente INTEGER;
    END IF;

    -- 2. Criar a restrição de Chave Estrangeira
    -- Se já existir uma, removemos para atualizar
    ALTER TABLE tbl_pedido DROP CONSTRAINT IF EXISTS fk_pedidos_clientes;

    ALTER TABLE tbl_pedido 
    ADD CONSTRAINT fk_pedidos_clientes 
    FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id_cliente)
    ON DELETE CASCADE; -- Se um cliente for apagado, os seus pedidos também serão (opcional)

    RAISE NOTICE 'Relacionamento entre Pedidos e Clientes estabelecido com sucesso!';
END $$;