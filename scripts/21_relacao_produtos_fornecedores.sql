-- Script baseado no PDF: Relação entre tabelas Produtos e Fornecedores
-- Local: scripts/12_relacao_produtos_fornecedores.sql

DO $$ 
BEGIN
    -- 1. Garantir que a coluna de ligação existe na tabela de Produtos
    -- No SQL Server (PDF) o campo é CodigoDoFornecedor
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name='tbl_produto' AND column_name='id_fornecedor') THEN
        ALTER TABLE tbl_produto ADD COLUMN id_fornecedor INTEGER;
    END IF;

    -- 2. Criar a restrição de Chave Estrangeira
    -- Removemos se já existir para atualizar a regra
    ALTER TABLE tbl_produto DROP CONSTRAINT IF EXISTS fk_produtos_fornecedores;

    ALTER TABLE tbl_produto 
    ADD CONSTRAINT fk_produtos_fornecedores 
    FOREIGN KEY (id_fornecedor) REFERENCES tbl_fornecedor(id_fornecedor)
    ON DELETE RESTRICT; -- Protege os dados: não permite apagar fornecedor com produtos ativos

    RAISE NOTICE 'Relacionamento entre Produtos e Fornecedores estabelecido com sucesso!';
END $$;