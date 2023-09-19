/*USUÁRIOS*/
INSERT INTO Usuarios(login, senha)
VALUES
('op1', 'op1'),
('op2', 'op2')

SELECT * FROM Usuarios

/*PRODUTOS*/
INSERT INTO Produtos(nome, quantidade, precoVenda)
VALUES
('Melancia', 400, 12.42),
('Morango', 1000, 5.99),
('Abóbora', 500, 15.25)

SELECT * FROM Produtos

/*PRODUTOS*/

CREATE SEQUENCE idPessoa_sequence
	AS NUMERIC
	START WITH 1
	INCREMENT BY 1;



declare @id varchar
SELECT @id = NEXT VALUE FOR idPessoa_sequence


INSERT INTO Pessoa(idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES
(@id, 'Leandro', 'Rua da esperanca', 'Montenegro', 'RS', '(51) 99763-6644', 'leandro@estacio.com')

INSERT INTO Pessoa_fisica(cpf, idPessoa)
VALUES
('039.123.412-31', @id)


SELECT @id = NEXT VALUE FOR idPessoa_sequence


INSERT INTO Pessoa(idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES
(@id, 'Lottermann`s', 'Rua do desespero', 'Montenegro', 'RS', '(51) 3635-1122', 'lottermanns@estacio.com')

INSERT INTO Pessoa_juridica(cnpj, idPessoa)
VALUES
('13.456.313/0001-96', @id)

SELECT P.idPessoa, P.nome, P.logradouro, P.cidade, P.estado, P.telefone, P.email, F.cpf FROM Pessoa as	P
INNER JOIN Pessoa_fisica F on P.idPessoa = F.idPessoa

SELECT P.idPessoa, P.nome, P.logradouro, P.cidade, P.estado, P.telefone, P.email, J.cnpj FROM Pessoa as	P
INNER JOIN Pessoa_juridica J on P.idPessoa = J.idPessoa

INSERT INTO Movimentos(idPessoa, idProduto, idUsuario, quantidade, tipo, valorUnitario)
VALUES
(2, 2, 1, 100, 'E', 22),
(2, 3, 2, 200, 'E', 50),
(2, 1, 1, 100, 'E', 99),
(1, 2, 1, 100, 'C', 20),
(1, 2, 2, 100, 'C', 30),
(1, 2, 1, 100, 'C', 42)

/*Atividade de consultas*/
SELECT P.idPessoa, P.nome, P.logradouro, P.cidade, P.estado, P.telefone, P.email, F.cpf 
FROM Pessoa as	P
INNER JOIN Pessoa_fisica F on P.idPessoa = F.idPessoa

SELECT P.idPessoa, P.nome, P.logradouro, P.cidade, P.estado, P.telefone, P.email, J.cnpj 
FROM Pessoa as	P
INNER JOIN Pessoa_juridica J on P.idPessoa = J.idPessoa

SELECT M.idMovimento, M.idUsuario, M.idPessoa, M.idProduto, M.quantidade, M.tipo, M.valorUnitario, P.nome 
FROM Movimentos as M 
INNER JOIN Pessoa P on M.idPessoa = P.idPessoa
WHERE M.tipo = 'E'


SELECT M.idMovimento, M.idUsuario, M.idPessoa, M.idProduto, M.quantidade, M.tipo, M.valorUnitario, P.nome 
FROM Movimentos as M 
INNER JOIN Pessoa P on M.idPessoa = P.idPessoa
WHERE M.tipo = 'C'

SELECT idProduto, SUM(valorUnitario) AS Total
FROM Movimentos
WHERE TIPO = 'E'
GROUP BY idProduto

SELECT idProduto, SUM(valorUnitario) AS Total
FROM Movimentos
WHERE TIPO = 'C'
GROUP BY idProduto

SELECT * FROM Usuarios AS U
FULL OUTER JOIN Movimentos M 
ON M.idUsuario = U.idUsuario
WHERE  NOT TIPO = 'C' 

SELECT idUsuario, sum(valorUnitario) AS Total
FROM Movimentos
WHERE TIPO = 'E'
GROUP BY idUsuario

SELECT idUsuario, sum(valorUnitario) AS Total
FROM Movimentos
WHERE TIPO = 'C'
GROUP BY idUsuario

SELECT idProduto, AVG(valorUnitario) AS mediaVenda
FROM Movimentos
WHERE tipo = 'C'
GROUP BY idProduto