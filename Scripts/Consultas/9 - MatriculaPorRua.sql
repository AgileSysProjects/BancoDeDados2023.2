-- Retorna matricula de alunos de acordo com sua rua
SELECT matriculaaluno
FROM Enderecoalunos
WHERE logradouro IN(
	SELECT logradouro
 	FROM enderecoalunos
 	WHERE logradouro = 'Rua Josival Messyas'
);