SELECT D.Dep_Codigo, D.Cli_Codigo, PD.Pes_Nome AS Dependente, PC.Pes_Nome AS Responsavel
FROM Dependentes D
INNER JOIN Pessoas PD ON PD.Pes_Codigo = D.Pes_Codigo
INNER JOIN Clientes C ON C.Cli_Codigo = D.Cli_Codigo
INNER JOIN Pessoas PC ON PC.Pes_Codigo = C.Pes_Codigo
ORDER BY Dependente, Responsavel
;

SELECT (SELECT dep_codigo FROM dependentes WHERE pes_codigo = p.Pes_Codigo) AS dep,
    (SELECT cli_codigo FROM clientes WHERE pes_codigo = p.Pes_Codigo) AS cli,
p.* FROM pessoas p
;

SELECT * FROM dependentes;


SHOW COLUMNS FROM pessoas;
SELECT * FROM lancamentos;
-- ALUNOS PRESENTES
SELECT L.Lan_Codigo, D.Dep_Codigo, D.Cli_Codigo, PD.Pes_Nome AS Dependente, PC.Pes_Nome AS Responsavel, TIME(Lan_DataHoraEnt) AS Lan_DataHoraEnt
FROM Lancamentos L
INNER JOIN Dependentes D ON D.Dep_Codigo = L.Dep_Codigo
    AND D.Cli_Codigo = L.Cli_Codigo
INNER JOIN Pessoas PD ON PD.Pes_Codigo = D.Pes_Codigo
INNER JOIN Clientes C ON C.Cli_Codigo = D.Cli_Codigo
INNER JOIN Pessoas PC ON PC.Pes_Codigo = C.Pes_Codigo
WHERE Lan_DataHoraSai IS NULL
ORDER BY Dependente, Lan_DataHoraEnt;

SELECT * FROM dependentes
ORDER BY cli_codigo
;


-- LANÇAMENTOS
SELECT L.Lan_Codigo, D.Dep_Codigo, D.Cli_Codigo, PD.Pes_Nome AS Dependente, PC.Pes_Nome AS Responsavel,
    DATE(Lan_DataHoraEnt) AS Lan_Data, TIME(Lan_DataHoraEnt) AS Lan_DataHoraEnt, TIME(Lan_DataHoraSai) AS Lan_DataHoraSai, Lan_Fechado, Lan_VlrHora,
    Lan_VlrTotal
FROM Lancamentos L
INNER JOIN Dependentes D ON D.Dep_Codigo = L.Dep_Codigo
    AND D.Cli_Codigo = L.Cli_Codigo
INNER JOIN Pessoas PD ON PD.Pes_Codigo = D.Pes_Codigo
INNER JOIN Clientes C ON C.Cli_Codigo = D.Cli_Codigo
INNER JOIN Pessoas PC ON PC.Pes_Codigo = C.Pes_Codigo
ORDER BY Lan_Codigo
;

UPDATE Lancamentos SET Lan_DataHoraSai = NULL WHERE Lan_Codigo = 3

;
SELECT * FROM Lancamentos;


SELECT * FROM fechamentos