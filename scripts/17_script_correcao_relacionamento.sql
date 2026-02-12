DO $$ 
BEGIN
    -- 1. Corrigindo a coluna de Cliente (caso necessário)
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='tbl_pedido' AND column_name='id_cliente') THEN
        ALTER TABLE tbl_pedido ADD COLUMN id_cliente INTEGER;
    END IF;

    -- 2. Corrigindo a coluna de Funcionário (O erro atual)
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='tbl_pedido' AND column_name='id_funcionario') THEN
        ALTER TABLE tbl_pedido ADD COLUMN id_funcionario INTEGER;
    END IF;

    -- 3. Corrigindo a coluna de Transportadora
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='tbl_pedido' AND column_name='id_transportadora') THEN
        ALTER TABLE tbl_pedido ADD COLUMN id_transportadora INTEGER;
    END IF;

    -- 4. Agora aplicamos os relacionamentos (Foreign Keys)
    ALTER TABLE tbl_pedido DROP CONSTRAINT IF EXISTS fk_pedido_cliente;
    ALTER TABLE tbl_pedido ADD CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES tbl_cliente(id_cliente);
    
    ALTER TABLE tbl_pedido DROP CONSTRAINT IF EXISTS fk_pedido_funcionario;
    ALTER TABLE tbl_pedido ADD CONSTRAINT fk_pedido_funcionario FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionario(id_funcionario);
    
    ALTER TABLE tbl_pedido DROP CONSTRAINT IF EXISTS fk_pedido_transportadora;
    ALTER TABLE tbl_pedido ADD CONSTRAINT fk_pedido_transportadora FOREIGN KEY (id_transportadora) REFERENCES tbl_transportadora(id_transportadora);

    RAISE NOTICE 'Tabela tbl_pedido corrigida e relacionamentos criados!';
END $$;