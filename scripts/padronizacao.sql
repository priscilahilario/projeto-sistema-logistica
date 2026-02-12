DO $$ 
BEGIN
    -- Ajuste para a Tabela de Clientes
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='tbl_cliente' AND column_name='nome_cliente') THEN
        ALTER TABLE tbl_cliente RENAME COLUMN nome_cliente TO nome_empresa;
    END IF;

    -- Ajuste para a Tabela de Transportadoras (Onde deu o erro atual)
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='tbl_transportadora' AND column_name='nome_transportadora') THEN
        ALTER TABLE tbl_transportadora RENAME COLUMN nome_transportadora TO nome_empresa;
    ELSIF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='tbl_transportadora' AND column_name='nome') THEN
        ALTER TABLE tbl_transportadora RENAME COLUMN nome TO nome_empresa;
    END IF;
END $$;