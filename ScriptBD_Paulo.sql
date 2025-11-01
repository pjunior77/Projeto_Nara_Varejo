#Cria o Database PROJ_NARA_VAREJO
CREATE DATABASE PROJ_NARA_VAREJO;

#Seta o Database para uso
USE PROJ_NARA_VAREJO;

##############################################################
# Criação das tabelas
##############################################################

#Cria a tabela D_clientes ##########################################################
CREATE TABLE D_clientes (
ID_Cliente INT,
Nome VARCHAR(100),
Idade INT,
Sexo VARCHAR(1),
Cidade VARCHAR(100),
Estado VARCHAR(2),
Canal_Aquisicao VARCHAR(50),
PRIMARY KEY (ID_Cliente)
);

#Cria a tabela D_produtos ##########################################################
CREATE TABLE D_produtos (
ID_Produto INT,
Nome_Produto VARCHAR(100),
Categoria VARCHAR(50),
Preco DECIMAL(10,2),
Marca VARCHAR(50),
PRIMARY KEY (ID_Produto)
);

#Cria a tabela D_campanhas ##########################################################
CREATE TABLE D_campanhas (
ID_Campanha INT,
Canal VARCHAR(50),
Data_Inicio DATE,
Data_Fim DATE,
Tipo_Campanha VARCHAR(50),
Custo DECIMAL(10,2),
PRIMARY KEY(ID_Campanha)
);

#Cria a tabela F_atendimentos ##########################################################
CREATE TABLE F_atendimentos (
ID_Atendimento INT,
ID_Cliente INT,
Tipo VARCHAR(50),
Data DATE,
Tempo_Resposta INT,
Nota_Satisfacao INT,
PRIMARY KEY (ID_Atendimento),
FOREIGN KEY (ID_Cliente) REFERENCES D_clientes(ID_Cliente)
);

#Cria a tabela F_avaliacoes ##########################################################
CREATE TABLE F_avaliacoes (
ID_Cliente INT,
ID_Produto INT,
Nota INT,
Data_Avaliacao DATE,
Comentario VARCHAR(50),
PRIMARY KEY (ID_Cliente, ID_Produto, Data_avaliacao),
FOREIGN KEY (ID_Cliente) REFERENCES D_clientes(ID_Cliente),
FOREIGN KEY (ID_Produto) REFERENCES D_produtos(ID_Produto)
);

#Cria a tabela F_vendas ##########################################################
CREATE TABLE F_vendas (
ID_Venda INT,
ID_Cliente INT,
ID_Produto INT,
Data DATE,
Quantidade INT,
Canal VARCHAR(50),
Valor_Total DECIMAL(10,2),
ID_Campanha INT,
PRIMARY KEY (ID_Venda),
FOREIGN KEY (ID_Cliente) REFERENCES D_clientes(ID_Cliente),
FOREIGN KEY (ID_Produto) REFERENCES D_produtos(ID_Produto),
FOREIGN KEY (ID_Campanha) REFERENCES D_campanhas(ID_Campanha)
);

##############################################################
# Carrega os arquivos CSV nas tabelas
##############################################################
SET GLOBAL local_infile = 1;				#Permissão para acessar arquivos locais no servidor de Banco de Dados
SHOW VARIABLES LIKE 'secure_file_priv';		#Para verificar o local da pasta onde se pode carregar os arquivos


#Carrega os dados da tabela D_clientes ##########################################################
#LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/ProjetoNara_Varejo/D_clientes.csv'
LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/D_clientes.csv'
INTO TABLE D_clientes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Cliente,
Nome,
Idade,
Sexo,
Cidade,
Estado,
Canal_Aquisicao
);

#Carrega os dados da tabela D_produtos ##########################################################
#LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/ProjetoNara_Varejo/D_produtos.csv'
LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/D_produtos.csv'
INTO TABLE D_produtos
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Produto,
Nome_Produto,
Categoria,
Preco,
Marca
);

#Carrega os dados da tabela D_campanhas ##########################################################
#LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/ProjetoNara_Varejo/D_campanhas.csv'
LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/D_campanhas.csv'
INTO TABLE D_campanhas
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

#Carrega os dados da tabela F_atendimentos ##########################################################
#LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/ProjetoNara_Varejo/F_atendimentos.csv'
LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/F_atendimentos.csv'
INTO TABLE F_atendimentos
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

#Carrega os dados da tabela F_avaliacoes ##########################################################
#LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/ProjetoNara_Varejo/F_avaliacoes.csv'
LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/F_avaliacoes.csv'
INTO TABLE F_avaliacoes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS						#Ignora a primeira linha por causa do cabeçalho
(ID_Cliente,
ID_Produto,
Nota,
Data_Avaliacao,
Comentario
);

#Carrega os dados da tabela F_vendas ##########################################################
#LOAD DATA INFILE 'C:/PauloFrederico/PosGraduacao/SENAC_BigData/ProjetoNara_Varejo/F_vendas.csv'
LOAD DATA INFILE 'C:/Users/paulo.frederico/Documents/Projeto_Nara_Varejo/dfVendas.csv'
INTO TABLE F_vendas
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
