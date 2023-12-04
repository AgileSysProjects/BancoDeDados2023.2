-- Retorna matricula de professores que possuem apenas um telefone
SELECT matricula
FROM professores
WHERE EXISTS(
	SELECT *
	FROM turmas
	WHERE telefone2 IS NULL
);