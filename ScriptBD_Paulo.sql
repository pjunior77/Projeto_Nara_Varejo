#Cria o Database PROJ_NARA_VAREJO
CREATE DATABASE PROJ_NARA_VAREJO;

#Seta o Database para uso
USE PROJ_NARA_VAREJO;

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
PRIMARY KEY (ID_Cliente, ID_Produto),
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


