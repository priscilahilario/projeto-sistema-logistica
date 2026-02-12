DO $$ 
BEGIN
    -- Se a coluna se chamar 'nome_cliente', renomeia para 'nome_empresa'
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name='tbl_cliente' AND column_name='nome_cliente') THEN
        ALTER TABLE tbl_cliente RENAME COLUMN nome_cliente TO nome_empresa;
    
    -- Se não existir nem 'nome_cliente' nem 'nome_empresa', cria a coluna
    ELSIF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                      WHERE table_name='tbl_cliente' AND column_name='nome_empresa') THEN
        ALTER TABLE tbl_cliente ADD COLUMN nome_empresa VARCHAR(100);
    END IF;
END $$;