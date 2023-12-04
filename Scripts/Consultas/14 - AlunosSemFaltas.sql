-- Retorna a matricula dos alunos que não possuem faltas
SELECT A.Matricula
FROM Alunos A
EXCEPT
SELECT F.MatriculaAluno
FROM Faltas F;