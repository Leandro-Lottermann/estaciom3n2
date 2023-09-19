CREATE TABLE Pessoa(
	idPessoa INT PRIMARY KEY NOT NULL,
	nome VARCHAR(255),
	logradouro VARCHAR(255),
	cidade VARCHAR(255),
	estado CHAR(2),
	telefone VARCHAR(255),
	email VARCHAR(255),
)

CREATE TABLE Pessoa_juridica(
	idPessoa INT FOREIGN KEY REFERENCES Pessoa(idPessoa),
	cnpj varchar(18) PRIMARY KEY
)

CREATE TABLE Pessoa_fisica(
	idPessoa INT FOREIGN KEY REFERENCES Pessoa(idPessoa),
	cpf varchar(19) PRIMARY KEY
)

CREATE TABLE Usuarios(
	idUsuario INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	login VARCHAR(255),
	senha VARCHAR(255)
)

CREATE TABLE Produtos(
	idProduto INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nome VARCHAR(255),
	quantidade INT,
	precoVenda DECIMAL(20,2)
)

CREATE TABLE Movimentos(
	idMovimento INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	idUsuario INT FOREIGN KEY REFERENCES Usuarios(idUsuario),
	idPessoa INT FOREIGN KEY REFERENCES Pessoa(idPessoa),
	idProduto INT FOREIGN KEY REFERENCES Produtos(idProduto),
	quantidade INT,
	tipo CHAR(1),
	valorUnitario DECIMAL(20,2)
)

