-- Script baseado no PDF: Relação entre tabelas Produtos e Categorias
-- Local: scripts/11_relacao_produtos_categorias.sql

DO $$ 
BEGIN
    -- 1. Garantir que a coluna de ligação existe na tabela de Produtos
    -- No SQL Server original o nome é CodigoDaCategoria
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name='tbl_produto' AND column_name='id_categoria') THEN
        ALTER TABLE tbl_produto ADD COLUMN id_categoria INTEGER;
    END IF;

    -- 2. Criar a restrição de Chave Estrangeira
    -- Removemos se já existir para evitar erros de execução duplicada
    ALTER TABLE tbl_produto DROP CONSTRAINT IF EXISTS fk_produtos_categorias;

    ALTER TABLE tbl_produto 
    ADD CONSTRAINT fk_produtos_categorias 
    FOREIGN KEY (id_categoria) REFERENCES tbl_categoria(id_categoria)
    ON DELETE RESTRICT; -- Impede apagar categorias que tenham produtos vinculados

    RAISE NOTICE 'Relacionamento entre Produtos e Categorias estabelecido com sucesso!';
END $$;