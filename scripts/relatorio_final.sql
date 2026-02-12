SELECT 
    p.id_pedido AS "Nº Pedido",
    c.nome_empresa AS "Cliente",
    f.nome || ' ' || f.sobrenome AS "Funcionário Responsável",
    pr.nome_produto AS "Produto",
    cat.nome_categoria AS "Categoria",
    dp.quantidade AS "Qtd",
    dp.preco_unitario AS "Preço Unit.",
    t.nome_empresa AS "Transportadora",
    p.data_pedido AS "Data"
FROM tbl_pedido p
JOIN tbl_cliente c ON p.id_cliente = c.id_cliente
JOIN tbl_funcionario f ON p.id_funcionario = f.id_funcionario
JOIN tbl_transportadora t ON p.id_transportadora = t.id_transportadora
JOIN tbl_detalhes_pedido dp ON p.id_pedido = dp.id_pedido
JOIN tbl_produto pr ON dp.id_produto = pr.id_produto
JOIN tbl_categoria cat ON pr.id_categoria = cat.id_categoria
ORDER BY p.id_pedido;