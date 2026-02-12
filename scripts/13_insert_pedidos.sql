-- Simulando um pedido completo no sistema
INSERT INTO tbl_pedido (id_cliente, id_funcionario, id_transportadora, frete, nome_destinatario, cidade_destinatario)
VALUES 
(1, 1, 1, 25.50, 'Transportadora TransLog', 'São Paulo'),
(2, 2, 2, 15.00, 'Depósito Central Bradesco', 'Osasco');