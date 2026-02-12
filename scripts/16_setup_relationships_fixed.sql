-- scripts/08_setup_relationships_fixed.sql

DO $$ 
BEGIN
    -- 1. Tentar adicionar a coluna caso ela realmente tenha sido esquecida
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name='tbl_produto' AND column_name='id_categoria') THEN
        ALTER TABLE tbl_produto ADD COLUMN id_categoria INTEGER;
    END IF;

    -- 2. Agora criamos o relacionamento
    -- Primeiro removemos se existir para evitar erro de duplicidade
    ALTER TABLE tbl_produto DROP CONSTRAINT IF EXISTS fk_produtos_categorias;

    -- Aplicamos a Foreign Key
    ALTER TABLE tbl_produto 
    ADD CONSTRAINT fk_produtos_categorias 
    FOREIGN KEY (id_categoria) REFERENCES tbl_categoria (id_categoria)
    ON DELETE RESTRICT;

    RAISE NOTICE 'Relacionamento fk_produtos_categorias criado com sucesso!';
END $$;