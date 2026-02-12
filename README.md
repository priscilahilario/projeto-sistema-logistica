# 🚚 Logística DB - Implementação e Migração PostgreSQL

Este repositório contém a implementação completa de um banco de dados relacional voltado para a gestão de logística e inventário. O projeto foi desenvolvido a partir dos guias práticos da **Fundação Bradesco (Escola Virtual)**, originalmente projetados para Microsoft SQL Server, e totalmente adaptados por mim para o ecossistema **PostgreSQL**.



## 🎯 Objetivo do Projeto
Demonstrar competência em **Modelagem de Dados Relacional**, **Migração de Tecnologias (T-SQL para PostgreSQL)** e **Integridade Referencial**. O sistema cobre o fluxo operacional completo: desde o cadastro de fornecedores e categorias até o processamento de pedidos e despacho por transportadoras.

## 🛠️ Desafios de Implementação e Soluções
Durante a transposição dos PDFs originais para o PostgreSQL, foram aplicadas as seguintes melhorias técnicas:

* **Padronização de Entidades:** Unificação dos campos de identificação nominal. Utilizei scripts `PL/pgSQL` para garantir que tanto `tbl_cliente` quanto `tbl_transportadora` utilizassem a coluna `nome_empresa`, eliminando erros de inconsistência em relatórios.
* **Idempotência e Resiliência:** Os scripts de relacionamento foram escritos com cláusulas `IF NOT EXISTS` e `DROP CONSTRAINT IF EXISTS`, permitindo a reexecução dos arquivos sem conflitos.
* **Integridade Referencial:** Configuração manual de todas as Chaves Estrangeiras (FKs), garantindo que nenhum pedido seja registrado sem um cliente, funcionário ou transportadora válidos.



## 📂 Organização dos Scripts
Para garantir a integridade, os scripts devem ser executados na ordem abaixo:

1.  `01_criacao_tabelas_base.sql`: Tabelas independentes (Clientes, Funcionários, Fornecedores, Transportadoras e Categorias).
2.  `02_padronizacao_colunas.sql`: Script de ajuste para unificar o campo `nome_empresa`.
3.  `03_criacao_estoque_vendas.sql`: Tabelas de Produtos, Pedidos e Detalhes do Pedido.
4.  `04_relacionamentos_fk.sql`: Ativação das regras de integridade entre as tabelas.
5.  `05_povoamento_dados.sql`: Inserção de dados para teste.
6.  `06_relatorio_final.sql`: Query de validação com múltiplos `JOINs`.

## 🚀 Como Testar
1. Clone este repositório.
2. Crie um banco de dados chamado `db_logistica`.
3. Execute o script mestre `install_all.sql` para automatizar todo o processo.
4. O script gerará um relatório final mostrando os pedidos vinculados a clientes, funcionários e transportadoras.



## 📊 Relatório de Saída (Exemplo)
O banco permite extrair informações complexas, como:
* Rastreamento de pedidos por transportadora.
* Vendas por categoria de produto e funcionário.
* Análise de estoque por fornecedor.

---
**Desenvolvido por Priscila** *Focado em Engenharia de Dados e SQL.*
