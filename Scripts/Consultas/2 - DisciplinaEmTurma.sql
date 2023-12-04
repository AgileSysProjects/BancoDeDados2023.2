-- Retornar disciplinas ministradas por um professor em uma turma específica
SELECT Professores.Nome AS NomeProfessor, Disciplinas.Nome AS NomeDisciplina, Turmas.Ano, Turmas.Serie
FROM Professores
JOIN ProfessoresPorTurma ON Professores.Matricula = ProfessoresPorTurma.MatriculaProfessor
JOIN Turmas ON ProfessoresPorTurma.idTurma = Turmas.idTurma
JOIN Disciplinas ON ProfessoresPorTurma.idDisciplina = Disciplinas.idDisciplina
WHERE Professores.Matricula = '20190005' AND Turmas.idTurma = '2';