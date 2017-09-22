SELECT * FROM Lancamentos;

SELECT PDep.Pes_Nome, Lan_DataHoraEnt
FROM Lancamentos L
INNER JOIN Dependentes D ON D.Cli_Codigo = L.Cli_Codigo
    AND D.Dep_Codigo = L.Dep_Codigo
INNER JOIN Pessoas PDep ON PDep.Pes_Codigo = D.Pes_Codigo
WHERE Lan_DataHoraSai IS NULL;

SELECT @valor := 10;
SELECT ROUND((HOUR(dif) * @valor) + (MINUTE(Lan_DataHoraEnt) / 60 * @Valor),2) AS RES, t.*
FROM (
SELECT TIMEDIFF(Lan_DataHoraSai, Lan_DataHoraent) AS dif, l.* FROM Lancamentos l
WHERE Lan_DatahoraSai IS NOT NULL
) AS t;;


SELECT TIMEDIFF(Lan_DataHoraSai, Lan_DataHoraent) AS dif, l.* FROM Lancamentos l