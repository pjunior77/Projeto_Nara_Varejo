#Cria o Database PROJETO_NARA_VAREJO
CREATE DATABASE PROJETO_NARA_VAREJO;

#Seta o Database para uso
USE PROJETO_NARA_VAREJO;

##############################################################
# Criação das tabelas
##############################################################

#Cria a tabela Clientes ##########################################################
CREATE TABLE Clientes (
ID_Cliente INT,
Nome VARCHAR(100),
Idade INT,
Sexo VARCHAR(1),
Cidade VARCHAR(100),
Estado VARCHAR(2),
Canal_Aquisicao VARCHAR(50),
Perfil VARCHAR(50),
PRIMARY KEY (ID_Cliente)
);

#Cria a tabela Produtos ##########################################################
CREATE TABLE Produtos (
ID_Produto INT,
Nome_Produto VARCHAR(100),
Categoria VARCHAR(50),
Preco DECIMAL(10,2),
Marca VARCHAR(50),
PRIMARY KEY (ID_Produto)
);

#Cria a tabela Campanhas ##########################################################
CREATE TABLE Campanhas (
ID_Campanha INT,
Canal VARCHAR(50),
Data_Inicio DATE,
Data_Fim DATE,
Tipo_Campanha VARCHAR(50),
Custo DECIMAL(10,2),
PRIMARY KEY(ID_Campanha)
);

#Cria a tabela Atendimentos ##########################################################
CREATE TABLE Atendimentos (
ID_Atendimento INT,
ID_Cliente INT,
Tipo VARCHAR(50),
Data DATE,
Tempo_Resposta DECIMAL(10,2),
Nota_Satisfacao INT,
PRIMARY KEY (ID_Atendimento),
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

#Cria a tabela Avaliacoes ##########################################################
CREATE TABLE Avaliacoes (
ID_Avaliacao INT AUTO_INCREMENT,
ID_Cliente INT,
ID_Produto INT,
Nota INT,
Data_Avaliacao DATE,
Comentario VARCHAR(50),
PRIMARY KEY (ID_Avaliacao),
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto)
);

#Cria a tabela Vendas ##########################################################
CREATE TABLE Vendas (
ID_Venda INT,
ID_Cliente INT,
ID_Produto INT,
Data DATE,
Quantidade INT,
Canal VARCHAR(50),
Valor_Total DECIMAL(10,2),
ID_Campanha INT,
PRIMARY KEY (ID_Venda),
FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto)
);


##############################################################
# Carrega os arquivos CSV nas tabelas
##############################################################
SET GLOBAL local_infile = 1;				#Permissão para acessar arquivos locais no servidor de Banco de Dados


######################################################################################################
# OBS: Antes de incluir os dados nas tabelas tem que executar os arquivos abaixo no Python:
#	ProcessaArqClientesParaBD_Paulo.ipynb
#	ProcessaArqProdutosParaBD_Paulo.ipynb
#	ProcessaArqAtendimentosParaBD_Paulo.ipynb
#	ProcessaArqVendasParaBD_Paulo.ipynb
#	ProcessaArqVendasExtrasParaBD_Paulo.ipynb
######################################################################################################

#Carrega os dados da tabela Clientes ##########################################################
LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/Projeto_Nara_Varejo/dfClientes.csv'
#LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/dfClientes.csv'
INTO TABLE Clientes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Cliente,
Nome,
Idade,
Sexo,
Cidade,
Estado,
Canal_Aquisicao,
Perfil
);
#SELECT * FROM Clientes;

#Carrega os dados da tabela Produtos ##########################################################
LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/Projeto_Nara_Varejo/dfProdutos.csv'
#LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/dfProdutos.csv'
INTO TABLE Produtos
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Produto,
Nome_Produto,
Categoria,
Preco,
Marca
);
#SELECT * FROM Produtos;

#Carrega os dados da tabela Campanhas ##########################################################
LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/Projeto_Nara_Varejo/campanhas_corrigido.csv'
#LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/campanhas_corrigido.csv'
INTO TABLE Campanhas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Campanha,
Canal,
Data_Inicio,
Data_Fim,
Tipo_Campanha,
Custo
);
#SELECT * FROM Campanhas;

#Carrega os dados da tabela Atendimentos ##########################################################
LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/Projeto_Nara_Varejo/dfAtendimentos.csv'
#LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/dfAtendimentos.csv'
INTO TABLE Atendimentos
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Atendimento,
ID_Cliente,
Tipo,
Data,
Tempo_Resposta,
Nota_Satisfacao
);
#SELECT * FROM Atendimentos;

#Carrega os dados da tabela Avaliacoes ##########################################################
LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/Projeto_Nara_Varejo/avaliacoes.csv'
#LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/avaliacoes.csv'
INTO TABLE Avaliacoes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Cliente,
ID_Produto,
Nota,
Data_Avaliacao,
Comentario
);
#SELECT * FROM Avaliacoes;

#Carrega os dados da tabela Vendas ##########################################################
LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/Projeto_Nara_Varejo/dfVendas.csv'
#LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/dfVendas.csv'
INTO TABLE Vendas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Venda,
ID_Cliente,
ID_Produto,
Data,
Quantidade,
Canal,
Valor_Total,
ID_Campanha
);
#SELECT * FROM Vendas;

LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/Projeto_Nara_Varejo/dfVendasExtras.csv'
#LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/dfVendasExtras.csv'
INTO TABLE Vendas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Venda,
ID_Cliente,
ID_Produto,
Data,
Quantidade,
Canal,
Valor_Total,
ID_Campanha
);

/*
DROP TABLE Clientes;
DROP TABLE Produtos;
DROP TABLE Campanhas;
DROP TABLE Atendimentos;
DROP TABLE Avaliacoes;
DROP TABLE Vendas;
*/