-- Script adaptado da página 12 do PDF de Criação de Arquivos
-- O PostgreSQL gerencia o crescimento de dados e log automaticamente.

CREATE DATABASE logistica
    WITH 
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8';

COMMENT ON DATABASE logistica IS 'Banco de dados criado para o curso de Logística - Adaptado para PostgreSQL';