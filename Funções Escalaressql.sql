-- ESTUDO FUNÇÕES ESCALRES
USE aula;
SELECT * FROM Vendas;



-- Caractéres 
-----UPDATE para atualizar os valores da tabela mãe. ALTER TABLE altera estrutura da coluna

-----Left (Extrai pelas letras do lado esquerda)
	SELECT LEFT(Item,3) as Iniciais
	FROM Vendas;

-----Right (Extrai pelas letras do lado direito)
SELECT RIGHT(Item,3) as Iniciais
FROM Vendas;

-----CONCAT (Unir informações de colunas diferentes)
SELECT CONCAT(Item,' - ',Categoria) as ItemCategoria
FROM Vendas;
SELECT CONCAT(Valor,' * ',Quantidade ;'=';Total) as ItemCategoria
FROM Vendas;

-----REPLACE (Substituir campos ou caractéres)
SELECT REPLACE(Categoria,'cc','c') as Doce
FROM Vendas;

update Vendas
set Categoria = replace(Categoria, 'cc', 'c')

-----UPPER/LOWER (Substituir garrafais ou minísculas)
SELECT UPPER(Categoria) as Garrafais
FROM Vendas;
SELECT LOWER(Categoria) as Minusculas
FROM Vendas;

-----TRIM (Excluir espaços em branco antes ou depois do campo)
SELECT TRIM(Item) as Item
FROM Vendas;



-- DATA E TEMPO

-----MONTH (Puxa o mes)
SELECT Item,MONTH(DataLancamento) as Mes FROM Vendas;
-----YEAR (Puxa o ano)
SELECT Item,YEAR(DataLancamento) as Mes FROM Vendas;
-----DAY (Puxa o dia)
SELECT Item,DAY(DataLancamento) as Mes FROM Vendas;

SELECT DISTINCT DAY(DataLancamento) As Dias
FROM Vendas;





-- MATEMATICA E CONVERSÃO

-----FLOOR (Arredonda pra baixo)
SELECT FLOOR(Valor) FROM Vendas;

-----CEILING (Arredonda pra cima)
SELECT CEILING(Valor) FROM Vendas;

-----ABS (Transforma valor negativo em absoluto)
SELECT ABS(Valor) FROM Vendas;

-----CAST (Transforma tipos de dados)
SELECT CAST(FLOOR(Valor) AS INT) AS valorinteiro FROM Vendas;

SELECT CAST(DataLancamento as VARCHAR) AS DataString FROM VENDAS;

-----Alteração valor da coluna
SELECT Item, Total * 100 as Novacoluna
FROM VENDAS;
SELECT Item, Total / 2 as Novacoluna
FROM VENDAS;
select Item,Total, (100*Total) as vezes_100 from vendas;







