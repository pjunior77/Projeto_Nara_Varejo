USE PROJETO_NARA_VAREJO;

#Identificar padrões de compra por perfil de cliente
SELECT c.Perfil, SUM(Valor_Total)
FROM Vendas v
INNER JOIN Clientes c
ON v.ID_Cliente = c.ID_Cliente
GROUP BY c.Perfil;

#Identificar padrões de compra por perfil de cliente (Tip)
SELECT p.Nome_Produto, c.Perfil, SUM(v.Valor_Total) AS TOTAL
FROM Vendas v
INNER JOIN Clientes c
ON v.ID_Cliente = c.ID_Cliente
INNER JOIN Produtos p
ON v.ID_Produto = p.ID_Produto
GROUP BY p.Nome_produto, c.Perfil
ORDER BY p.Nome_Produto ASC, TOTAL DESC;

#Detectar produtos com desempenho abaixo do esperado
SELECT p.Nome_Produto, SUM(v.Valor_Total) AS TOTAL
FROM Vendas v
INNER JOIN Produtos p
ON v.ID_Produto = p.ID_Produto
GROUP BY p.Nome_Produto
ORDER BY TOTAL ASC;

#Avaliar o impacto das campanhas de marketing sobre o volume de vendas
SELECT c.ID_Campanha, c.Canal, c.Tipo_Campanha, c.Custo, SUM(v.Valor_Total) AS TOTAL_VENDIDO, SUM(v.Valor_Total) - c.Custo AS SALDO
FROM Vendas v
INNER JOIN Campanhas c
ON v.ID_Campanha = c.ID_Campanha
GROUP BY c.ID_Campanha
ORDER BY TOTAL_VENDIDO DESC;

#Medir a eficiência dos atendimentos e sua relação com a satisfação
SELECT a.tipo, COUNT(ID_Atendimento) AS ATENDIMENTOS
FROM Atendimentos a
GROUP BY a.tipo;

SELECT a.tipo, c.Nome, COUNT(ID_Atendimento) AS ATENDIMENTOS
FROM Atendimentos a
INNER JOIN Clientes c
ON a.ID_CLiente = c.ID_Cliente
GROUP BY a.tipo, c.Nome
ORDER BY a.tipo ASC, ATENDIMENTOS DESC;

#Criar indicadores temporais para acompanhar a evolução dos resultados
SELECT YEAR(v.Data) AS ANO, MONTH(v.data) AS MES, v.canal, SUM(v.Valor_Total) AS VALOR_TOTAL
FROM vendas v
GROUP BY YEAR(v.Data), MONTH(v.data), v.canal
ORDER BY YEAR(v.Data) ASC, MONTH(v.data) ASC, v.canal ASC;


