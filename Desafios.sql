USE coderteste;

SELECT * FROM area
SELECT * FROM assuntos
SELECT * FROM coordenador
SELECT * FROM estudantes
SELECT * FROM professores
SELECT * FROM profissoes

/*1. Análise de docentes por área:
- Número do documento, nome do(a) docente e área para identificar a área maior e a
menor segundo o número da área.*/
SELECT * FROM professores
SELECT * FROM area
SELECT * FROM assuntos

SELECT p.CPF,p.Nome, p.sobrenome, a.Nome as area, a.AreaID
from professores p
LEFT JOIN assuntos aa
ON (p.AssuntoID = aa.AssuntoID)
LEFT JOIN area a
ON (aa.Area = a.AreaID)
order by AreaID DESC;

/*- Número de documento, nome do(a) docente e área para identificar a área com data
de entrada maio 2021.*/

SELECT p.CPF, p.nome, p.sobrenome, a.nome as area, p.DataInicio
FROM professores p
LEFT JOIN assuntos aa
ON (p.AssuntoID = aa.AssuntoID)
LEFT JOIN area a
ON (aa.Area = a.AreaID)
WHERE p.DataInicio >= '2021-05-01' and p.DataInicio < '2021-06-01' 
ORDER BY p.DataInicio ASC;

/*- Acrescentar um campo indicador que informe quais são os registros ”maior ou
menor” e os que são “maio 2021” e ordenar a lista do menor para o maior por área.*/ 

SELECT	p.CPF, 
			p.nome, 
			p.sobrenome, 
			p.DataInicio,
	CASE
			WHEN p.Datainicio < '2020-05-01' then 'Antes de maio'
			WHEN p.Datainicio >= '2020-06-01' then 'Depois de maio'
			ELSE 'Maio 2021'
			END AS Maio_ou_não
			aa.nome as area,
			aa.AreaID,
	FROM professores p
	LEFT JOIN assuntos aa
	ON (p.AssuntoID = aa.AssuntoID)
	LEFT JOIN area a
	ON (aa.Area = a.AreaID)
	WHERE p.DataInicio >= '2021-05-01' and p.DataInicio < '2021-06-01' 
	ORDER BY p.DataInicio ASC;

select
		p.Nome,
		p.sobrenome,
		p.CPF,
		p.DataInicio,
		case
			when p.DataInicio < '2021-05-01' then 'Menor que Maio'
			when p.DataInicio > '2021-05-31' then 'Maior que Maio'
			else 'Maio 2021'
		end as maior_menor,
		aa.nome as area,
		aa.AreaID
	from professores p
	left join assuntos a on (
		p.AssuntoID = a.AssuntoID
	)
	left join area aa on (
		a.Area = aa.AreaID
	)
	order by AreaID desc;


/*2. Análise diária de estudantes:
- Por meio da data de ingresso dos(as) estudantes, identificar: quantidade total de
estudantes;*/
select count(distinct DataInicio) as Quantidade_Alunos
FROM estudantes;

/*- Mostrar os períodos de tempo separados por ano, mês e dia e apresentar a
informação ordenada pela data em que mais ingressaram estudantes.*/ 

WITH  Alunos_Data as (
	SELECT nome, DAY(DataInicio) as Dia, MONTH(DataInicio) as Mes, YEAR(DataInicio) as Ano
	FROM estudantes
	)
	SELECT count(Nome) as Alunos, Dia
	FROM Alunos_Data
	Group By Dia 
	Order By Alunos DESC;

/*3. Análise de coordenadores com mais docentes a seu cargo:
- Identificar o top 10 dos coordenadores que têm mais docentes a seu cargo, filtrar
somente os que têm docentes a seu cargo;*/

SELECT  TOP (10) CoordenadorID,  count (Nome) as Qnt_Professores
FROM professores
Group By CoordenadorID
Order By Qnt_Professores DESC;

/*- Ordenar do maior para o menor para obter uma lista ordenada corretamente.*/
SELECT CoordenadorID,  count (Nome) as Qnt_Professores
FROM professores
Group By CoordenadorID
Order By Qnt_Professores DESC;


/*4. Análise de profissões com mais estudantes:
- Identificar a profissão e a quantidade de estudantes que trabalham, mostrar a
lista somente das profissões que têm mais de 5 estudantes;*/

1)Juntar tabela estudantes com os ProfissaoID 

WITH Profissoes2 as (
SELECT COUNT(e.nome) as Qntd_Alunos
FROM  estudantes e
LEFT JOIN profissoes p
ON (e.ProfissaoID = p.ProfissaoID)
Group By Profissoes
)
SELECT Qntd_Alunos
FROM Profissoes2
--WHERE Qntd_Alunos > 5
Order by Qntd_Alunos DESC;
------------------------------------------------------------------------------
USE coderteste;

SELECT COUNT (Nome) 
FROM estudantes;
--1000 alunos

SELECT ProfissaoID, Profissoes 
FROM profissoes
WHERE ProfissaoID = 0;
-- 27- profissoes

WITH Profissoes3 as (
SELECT p.profissoes,COUNT(e.nome) as Qntd_Alunos
FROM profissoes p
LEFT JOIN estudantes e
ON (e.ProfissaoID = P.ProfissaoID)
Group By Profissoes
)
SELECT SUM(Qntd_alunos)
FROM Profissoes3
-- 998 alunos
--Cade os 2 alunos? Todos os alunos tem uma profissãoID Vinculado


SELECT e.ProfissaoID as IDEstudante, p.ProfissaoID as IDProfissao
FROM  estudantes e
LEFT JOIN profissoes p
ON (e.ProfissaoID = p.ProfissaoID)
WHERE p.ProfissaoID = null;





------------------------------------------------------------------------------

/*- Ordenar da maior para a menor pela profissão que tenha mais estudantes.*/ 
SELECT p.profissoes,COUNT(e.nome) as Qntd_Alunos
FROM profissoes p
LEFT JOIN estudantes e
ON (e.ProfissaoID = p.ProfissaoID)
Group By Profissoes
Order By Qntd_Alunos Desc;

/*5. Análise de estudantes por área de educação:
- Identificar: nome da área, se a disciplina é uma especialização ou curso, a qual
período pertence, quantidade de estudantes e valor total do custo da disciplina;*/

SELECT a.nome


/*- Ordenar o relatório do maior para o menor por valor de custos total, levando em
conta os(as) docentes que não têm disciplinas nem estudantes atribuídos e somá-los
também.*/ 




