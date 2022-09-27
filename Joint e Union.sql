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
1 - Quantos Funcionários não têm Projeto Atribuído?
--FULL OUTER JOIN
USE Aula8;

SELECT * FROM funcionarios f
FULL OUTER JOIN funcionario_projeto fp
ON fp.FuncionarioID = f.FuncionarioID
WHERE f.funcionarioID IS NULL;

-- UM funcionário está atribuido a projetos, porém não tem registro na tabela de funcionarios


SELECT * FROM funcionarios f
FULL OUTER JOIN funcionario_projeto fp
ON fp.FuncionarioID = f.FuncionarioID
WHERE fp.funcionarioID IS NULL;
-- 13 Funcionários não estão atribuidos a nenhum projeto
------------------------------------------------------------------------------

2 - Quais Projetos não têm Funcionário Atribuído?
SELECT * FROM projetos p
RIGHT JOIN funcionario_projeto fp
ON p.ProjetoID = fp.ProjetoID;
-- Zero, todos os projetos tem funcionários atribuidos
------------------------------------------------------------------------------

3 - Quantos funcionários tiveram algum projeto concluído?
SELECT * FROM projetos p
RIGHT JOIN funcionario_projeto fp
ON p.ProjetoID = fp.ProjetoID
WHERE Status = 'Concluído';

--13 funcionários tiveram seus projetos concluídos.
----------------------------------------------------------------------------

4 - Qual o projeto mais custoso (segundo o salário dos funcionários)?
SELECT * FROM funcionario_projeto fp
RIGHT JOIN funcionarios f
ON f.FuncionarioID = fp.FuncionarioID
WHERE Salario = MAX(salario);

SELECT * FROM funcionario_projeto fp
RIGHT JOIN funcionarios f
ON f.FuncionarioID = fp.FuncionarioID
ORDER BY Salario DESC;
-- PROJETO 55 feito pelo funcionpario ID47 com salário R$5.994,00
----------------------------------------------------------------------------

5 - Qual/quais projetos do funcionário mais jovem?
SELECT * FROM funcionario_projeto fp
RIGHT JOIN funcionarios f
ON f.FuncionarioID = fp.FuncionarioID
--ORDER BY Datanascimento DESC
WHERE Nome = 'Anthony Sales';
--O funcionário mais jovem (ID = 57) executa os projetos número:
--55

SELECT * FROM funcionario_projeto
WHERE FuncionarioID = 57;
