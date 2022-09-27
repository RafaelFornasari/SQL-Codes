CREATE DATABASE loja_database;
USE loja_database;

CREATE TABLE Clientes (
	ClienteID int NOT NULL,
	PrimeiroNome varchar(255) NOT NULL,
	UltimoNome varchar(255),
	AnoNascimento int,
	PRIMARY KEY (ClienteID)
);

CREATE TABLE Categorias (
	CategoriaID int NOT NULL, 
	Categoria varchar(255) NOT NULL,
	PRIMARY KEY (CategoriaID)
);

CREATE TABLE Produtos (
	ProdutoID int NOT NULL,
	Nome varchar(255) NOT NULL,
	Preco decimal NOT NULL,
	CategoriaID int NOT NULL,
	PRIMARY KEY (ProdutoID),
	FOREIGN KEY (CategoriaID) REFERENCES Categorias (CategoriaID)
);

--DROP TABLE Produtos;

CREATE TABLE Compras (
	CompraID int NOT NULL,
	ClienteID int NOT NULL,
	ProdutoID int NOT NULL,
	PRIMARY KEY (CompraID),
	FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID),
	FOREIGN KEY (ProdutoID) REFERENCES Produtos (ProdutoID)
);

-- INSERIR DADOS (DML AGORA)
INSERT INTO Clientes (ClienteID, PrimeiroNome, UltimoNome,AnoNascimento)
VALUES (1,'João','Macedo',1990);

INSERT INTO Categorias(CategoriaID, Categoria )
VALUES (1,'Higiene');

INSERT INTO Produtos(ProdutoID,Nome,Preco,CategoriaID)
VALUES (1,'Shampoo',15,1);

INSERT INTO Compras(CompraID, ClienteID, ProdutoID)
VALUES (1,1,1)

SELECT * FROM Compras;
