CREATE DATABASE Aula8;

USE aula8;

SELECT * FROM funcionario_projeto;
SELECT * FROM funcionarios;
SELECT * FROM projetos;


--INNER JOIN
SELECT l.*, t.PrimeiroNome FROM livros l
INNER JOIN tradutores t
ON l.TradutorId = t.TradutorId;


--LEFT JOIN
SELECT * FROM tradutores t
LEFT JOIN livros l
ON t.TradutorId = l.TradutorId;

--RIGHT JOIN
SELECT * FROM livros l
RIGHT JOIN editores e
ON l.EditorId = e.EditorId;


--LEFT JOIN
SELECT * FROM livros l
LEFT JOIN editores e
ON l.EditorId = e.EditorId;

--FULL OUTER JOIN
SELECT * FROM livros l
FULL OUTER JOIN tradutores t
ON l.TradutorId = t.TradutorId
WHERE t.TradutorId IS NOT NULL
;





SELECT * FROM funcionarios;
SELECT * FROM funcionario_projeto;
SELECT * FROM projetos;

------------------------------------------------------------------------------
1 - Quantos Funcion�rios n�o t�m Projeto Atribu�do?
--FULL OUTER JOIN
USE Aula8;

SELECT * FROM funcionarios f
FULL OUTER JOIN funcionario_projeto fp
ON fp.FuncionarioID = f.FuncionarioID
WHERE f.funcionarioID IS NULL;

-- UM funcion�rio est� atribuido a projetos, por�m n�o tem registro na tabela de funcionarios


SELECT * FROM funcionarios f
FULL OUTER JOIN funcionario_projeto fp
ON fp.FuncionarioID = f.FuncionarioID
WHERE fp.funcionarioID IS NULL;
-- 13 Funcion�rios n�o est�o atribuidos a nenhum projeto
------------------------------------------------------------------------------

2 - Quais Projetos n�o t�m Funcion�rio Atribu�do?
SELECT * FROM projetos p
RIGHT JOIN funcionario_projeto fp
ON p.ProjetoID = fp.ProjetoID;
-- Zero, todos os projetos tem funcion�rios atribuidos
------------------------------------------------------------------------------

3 - Quantos funcion�rios tiveram algum projeto conclu�do?
SELECT * FROM projetos p
RIGHT JOIN funcionario_projeto fp
ON p.ProjetoID = fp.ProjetoID
WHERE Status = 'Conclu�do';

--13 funcion�rios tiveram seus projetos conclu�dos.
----------------------------------------------------------------------------

4 - Qual o projeto mais custoso (segundo o sal�rio dos funcion�rios)?
SELECT * FROM funcionario_projeto fp
RIGHT JOIN funcionarios f
ON f.FuncionarioID = fp.FuncionarioID
WHERE Salario = MAX(salario);

SELECT * FROM funcionario_projeto fp
RIGHT JOIN funcionarios f
ON f.FuncionarioID = fp.FuncionarioID
ORDER BY Salario DESC;
-- PROJETO 55 feito pelo funcionpario ID47 com sal�rio R$5.994,00
----------------------------------------------------------------------------

5 - Qual/quais projetos do funcion�rio mais jovem?
SELECT * FROM funcionario_projeto fp
RIGHT JOIN funcionarios f
ON f.FuncionarioID = fp.FuncionarioID
--ORDER BY Datanascimento DESC
WHERE Nome = 'Anthony Sales';
--O funcion�rio mais jovem (ID = 57) executa os projetos n�mero:
--55

SELECT * FROM funcionario_projeto
WHERE FuncionarioID = 57;
