CREATE VIEW AlunosAprovados AS( 
SELECT BA.Matriculaaluno, A.Nome
FROM BimestreDeAluno BA INNER JOIN Alunos A ON BA.matriculaaluno = A.matricula
WHERE BA.Situacao = 'Aprovado');

CREATE VIEW TurmasProfessor AS
SELECT P.Matricula as MatriculaProfessor, P.Nome as Professor, T.idTurma, T.Serie
FROM (Professores P INNER JOIN ProfessoresPorTurma PPT ON P.Matricula = PPT.MatriculaProfessor) 
		NATURAL INNER JOIN Turmas T
ORDER BY T.idTurma;

CREATE VIEW TurmasAtuaisDosAlunos AS
SELECT A.Matricula, A.Nome AS NomeAluno, T.idTurma, T.Serie 
FROM (Alunos A INNER JOIN TurmasDeAluno TA ON A.Matricula = TA.MatriculaAluno) NATURAL INNER JOIN Turmas T;

CREATE VIEW AlunosMatriculadosPorSecretarios AS
SELECT S.Matricula as MatriculaSecretario, S.Nome as Secretario, A.Matricula as MatriculaAluno, A.Nome as Aluno
FROM Secretarios S INNER JOIN Alunos A ON S.Matricula = A.MatriculaSecretario
ORDER BY S.Matricula;
