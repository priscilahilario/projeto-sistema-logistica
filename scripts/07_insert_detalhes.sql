-- Inserindo itens em um pedido existente
-- (Assume-se que o id_pedido 1 e id_produto 1 já existem de scripts anteriores)

INSERT INTO tbl_detalhes_pedido (id_pedido, id_produto, quantidade, preco_unitario, desconto)
VALUES 
(1, 1, 5, 45.00, 2.50), -- 5 unidades do produto 1 no pedido 1
(1, 2, 10, 25.50, 0.00); -- 10 unidades do produto 2 no pedido 1