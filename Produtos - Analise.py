import pandas as pd
import plotly.express as px

# Carregar os dados dos arquivos CSV
produtos = pd.read_csv('produtos.csv')
vendas = pd.read_csv('vendas.csv')

# Agrupar vendas por ID_Produto para obter total de quantidade e valor
vendas_agrupadas = vendas.groupby('ID_Produto').agg({
    'Quantidade': 'sum',
    'Valor_Total': 'sum'
}).reset_index()

# Calcular média geral de quantidade e valor
media_quantidade = vendas_agrupadas['Quantidade'].mean()
media_valor = vendas_agrupadas['Valor_Total'].mean()

# Identificar produtos com desempenho abaixo da média
produtos_fracos = vendas_agrupadas[(vendas_agrupadas['Quantidade'] < media_quantidade) &
                                   (vendas_agrupadas['Valor_Total'] < media_valor)]

# Juntar com dados dos produtos
produtos_fracos = produtos_fracos.merge(produtos, on='ID_Produto')

# Selecionar colunas relevantes
resultado = produtos_fracos[['ID_Produto', 'Nome_Produto', 'Categoria', 'Quantidade', 'Valor_Total']]
resultado = resultado.rename(columns={
    'Quantidade': 'Total_Quantidade',
    'Valor_Total': 'Total_Valor'
})

# Gerar gráfico de barras dos produtos com desempenho abaixo da média
fig = px.bar(resultado, x='Nome_Produto', y='Total_Valor', color='Categoria',
             title='Produtos com desempenho abaixo da média (Valor Total de Vendas)',
             labels={'Total_Valor': 'Valor Total de Vendas', 'Nome_Produto': 'Produto'})

# Salvar gráfico
fig.write_image('produtos_abaixo_media.png')
fig.write_json('produtos_abaixo_media.json')

# Exibir tabela de produtos com desempenho abaixo da média
print(resultado.sort_values(by='Total_Valor'))