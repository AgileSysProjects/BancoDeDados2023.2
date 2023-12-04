-- Retorna nome dos professores de acordo com sua titulação
SELECT nome
FROM professores
WHERE titulacao IN(
	SELECT titulacao
 	FROM professores
 	WHERE titulacao = 'Mestrado'
);