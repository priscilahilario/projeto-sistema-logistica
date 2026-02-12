-- Script baseado no PDF: Relação entre tabelas Pedidos e Funcionários
-- Local: scripts/10_relacao_pedidos_funcionarios.sql

DO $$ 
BEGIN
    -- 1. Garantir que a coluna de ligação existe na tabela de Pedidos
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name='tbl_pedido' AND column_name='id_funcionario') THEN
        ALTER TABLE tbl_pedido ADD COLUMN id_funcionario INTEGER;
    END IF;

    -- 2. Criar a restrição de Chave Estrangeira (Foreign Key)
    -- Removemos se já existir para evitar conflitos
    ALTER TABLE tbl_pedido DROP CONSTRAINT IF EXISTS fk_pedidos_funcionarios;

    ALTER TABLE tbl_pedido 
    ADD CONSTRAINT fk_pedidos_funcionarios 
    FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionario(id_funcionario)
    ON DELETE RESTRICT; -- Impede apagar um funcionário que tenha pedidos registados

    RAISE NOTICE 'Relacionamento entre Pedidos e Funcionários estabelecido com sucesso!';
END $$;