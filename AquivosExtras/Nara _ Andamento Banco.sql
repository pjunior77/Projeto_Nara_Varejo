DROP DATABASE PROJETO_NARA;

CREATE DATABASE PROJETO_NARA;

USE PROJETO_NARA;

CREATE TABLE Atendimentos (
    ID_Atendimento INT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Tipo VARCHAR(50),
    Data DATE,
    Tempo_Resposta DECIMAL(10,2),
    Nota_Satisfacao INT
    );

CREATE TABLE Avaliacoes (
    ID_Cliente INT NOT NULL,
    ID_Produto INT NOT NULL,
    Nota INT,
    Data_Avaliacao DATE,
    Comentario VARCHAR(100)
    );

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nome VARCHAR(100),
    Idade INT,
    Sexo CHAR(1),
    Cidade VARCHAR(100),
    Estado CHAR(2),
    Canal_Aquisicao VARCHAR(50)
);


CREATE TABLE Produtos (
    ID_Produto INT PRIMARY KEY,
    Nome_Produto VARCHAR(150),
    Categoria VARCHAR(100),
    Preco DECIMAL(10,2),
    Marca VARCHAR(100),
    );

CREATE TABLE Vendas (
    ID_Venda INT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    ID_Produto INT NOT NULL,
    Data DATE,
    Quantidade INT,
    Canal VARCHAR(50),
    Valor_Total DECIMAL(12,2),
    ID_Campanha INT NULL
);


CREATE TABLE Campanhas (
    ID_Campanha INT PRIMARY KEY,
    Canal VARCHAR(50),
    Data_Inicio DATE,
    Data_Fim DATE,
    Tipo_Campanha VARCHAR(50),
    Custo DECIMAL(12,2)
);


