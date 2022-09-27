USE aula;
SELECT * FROM Filmes;

-- Retirar 'nota', transformar coluna em int
	-- Pegar média, filmes abaixo da média, na media e acima

------TIRAR NOTA DA COLUNA NOTA
UPDATE Filmes
SET Nota = REPLACE(Nota,'nota','');

UPDATE Filmes
SET Nota = REPLACE(Nota,'b7','0');

UPDATE Filmes
SET Nota = TRIM(Nota);

UPDATE Filmes
SET Nota = CAST(Nota as float);


SELECT DISTINCT Distribuidor, Nota
FROM Filmes
WHERE Nota > 6
ORDER BY Nota DESC;

------------------------------------------------------------------------
----- OUTRO GRUPO

--- BUSCAR DISTRIBUIDOR COM MAIOR SOMA BILITERIA
--- DISTRIBUIDOR COM MAIOR MÉDIA BILHETERIA
SELECT ANO, 	COUNT (DISTINCT Filme) as N_FILMESFROM FILMESGROUP BY ANOORDER BY N_FILMES DESCSELECT ANO, 	SUM (BilheteriaEmBilhoes) as SOMA_BILHETERIAFROM FILMESGROUP BY ANOORDER BY SOMA_BILHETERIA DESCSELECT Ano, Distribuidor,	COUNT (DISTINCT Filme) as N_FILMES,	SUM (BilheteriaEmBilhoes) as SOMA_BILHETERIA,	ROUND (SUM (BilheteriaEmBilhoes)/COUNT (DISTINCT Filme),2) as MEDIA_BILHETERIAFROM FILMESGROUP BY Ano, DistribuidorORDER BY MEDIA_BILHETERIA DESCSELECT Ano, Distribuidor,	COUNT (DISTINCT Filme) as N_FILMES,	SUM (BilheteriaEmBilhoes) as SOMA_BILHETERIA,	ROUND (SUM (BilheteriaEmBilhoes)/COUNT (DISTINCT Filme),2) as MEDIA_BILHETERIAFROM FILMESGROUP BY Ano, DistribuidorORDER BY SOMA_BILHETERIA DESC








