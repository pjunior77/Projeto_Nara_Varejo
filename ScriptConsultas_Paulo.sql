#Identificar padrões de compra por perfil de cliente
SELECT c.Perfil, SUM(Valor_Total)
FROM F_vendas v
INNER JOIN D_clientes c
ON v.ID_Cliente = c.ID_Cliente
GROUP BY c.Perfil;

#Identificar padrões de compra por perfil de cliente (Tip)
SELECT p.Nome_Produto, c.Perfil, SUM(v.Valor_Total) AS TOTAL
FROM F_vendas v
INNER JOIN D_clientes c
ON v.ID_Cliente = c.ID_Cliente
INNER JOIN D_Produtos p
ON v.ID_Produto = p.ID_Produto
GROUP BY p.Nome_produto, c.Perfil
ORDER BY p.Nome_Produto ASC, TOTAL DESC;

#Detectar produtos com desempenho abaixo do esperado
SELECT p.Nome_Produto, SUM(v.Valor_Total) AS TOTAL
FROM F_Vendas v
INNER JOIN D_Produtos p
ON v.ID_Produto = p.ID_Produto
GROUP BY p.Nome_Produto
ORDER BY TOTAL ASC;

#Avaliar o impacto das campanhas de marketing sobre o volume de vendas
SELECT c.ID_Campanha, c.Canal, c.Tipo_Campanha, c.Custo, SUM(v.Valor_Total) AS TOTAL_VENDIDO, SUM(v.Valor_Total) - c.Custo AS SALDO
FROM F_Vendas v
INNER JOIN D_Campanhas c
ON v.ID_Campanha = c.ID_Campanha
GROUP BY c.ID_Campanha
ORDER BY TOTAL_VENDIDO DESC;