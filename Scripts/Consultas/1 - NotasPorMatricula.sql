-- Obter notas de um aluno a partir de sua matrícula
SELECT Alunos.Nome AS NomeAluno, Avaliacoes.Tipo, AvaliacaoDeAluno.Nota
FROM Alunos
JOIN AvaliacaoDeAluno ON Alunos.Matricula = AvaliacaoDeAluno.MatriculaAluno
JOIN Avaliacoes ON AvaliacaoDeAluno.idAvaliacao = Avaliacoes.idAvaliacao
WHERE Alunos.Matricula = '20230024' AND Avaliacoes.idAvaliacao = '7';