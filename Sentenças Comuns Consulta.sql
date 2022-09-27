USE aula;

SELECT * FROM VENDAS;
SELECT * FROM Filmes;

SELECT Valor + Quantidade as soma 
From Vendas;
-- DISTINCT (Quais são elementos distintos existem?)
SELECT DISTINCT Categoria FROM Vendas;

-- DISTINCT COUNT (Quantidade de elementos distintos)
SELECT COUNT (DISTINCT Categoria)  AS 'Qntd. Categorias' FROM Vendas;

SELECT COUNT(*) AS QtdItens,
Categoria
FROM Vendas
GROUP BY Categoria;
---------------------------------------------------------------------------

-- WHERE (Busca exclusiva em cima de um parâmetro)
SELECT * FROM Vendas WHERE Categoria = 'Doce';
--Selecione todas colunas da tabela vendas, onde, esteja na categoria somente DOCE
SELECT * FROM Vendas WHERE Quantidade > 5;
---------------------------------------------------------------------------
-- OPERADORES RELACIONAIS: >; <; =; !=; <>;
SELECT *FROM Vendas WHERE Quantidade != 10;
SELECT * FROM Vendas WHERE Total <50;
SELECT * FROM Vendas WHERE Valor > 3;
---------------------------------------------------------------------------
--OPERADOR LÓGICO: AND, OR, NOT, IN, LIKE
-- AND
SELECT * FROM Vendas WHERE Categoria = 'Doce' AND Quantidade >= 10;
-- OR
SELECT * FROM Vendas WHERE Valor = 10 OR Valor = 24;
SELECT * FROM Vendas WHERE Valor = 10 OR Quantidade = 24;
-- LIKE (Busca coisas que não sabemos ao certo. Quero uma palavra que tem A no meio)
SELECT * FROM Vendas WHERE Item LIKE 'C%';
SELECT * FROM Vendas WHERE Item LIKE '%a%';
SELECT * FROM Vendas WHERE Item LIKE '%a';
SELECT * FROM Vendas WHERE Quantidade LIKE '%4';
---------------------------------------------------------------------------
-- GROUP BY (Agrupar)
-- Quero saber quantos doces venderam 
SELECT Categoria, Sum(Quantidade) AS 'Quantidade' 
FROM Vendas
WHERE Categoria = 'Doce'
GROUP BY Categoria; 
-- 1: Seleciona o que você quer (Mostar Soma de quantidade por categoria)
-- 2: Seleciona a tabela
-- 3: Especifica dentro da categoria por exemplo
-- 4: Agrupa

-- Saber quais items tem valor = 3 reais

---------------------------------------------------------------------------
-- MAX (Saber maior)
-- Esse trás a venda de maior valor do MESMO ITEM 
SELECT Categoria, MAX(Total) as MaisCaro 
FROM Vendas
GROUP BY Categoria;

SELECT MAX(TOTAL) as Total 
FROM Vendas;

SELECT * FROM filmes
WHERE ano in (SELECT MIN(ano) from Filmes);

---------------------------------------------------------------------------
-- ORDER BY  (ORDENAR)
-- ASC OU DESC 
SELECT * FROM Vendas 
ORDER BY Total DESC;
---------------------------------------------------------------------------
-- LIMITE (Quantas linhas quero trazer
SELECT TOP(1) * FROM Vendas 
ORDER BY Total DESC;

SELECT TOP(1) Item,Total FROM Vendas 
ORDER BY Total DESC;
