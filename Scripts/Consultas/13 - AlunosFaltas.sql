-- Retorna a matrícula dos alunos que tem faltas
SELECT A.Matricula
FROM Alunos A
INTERSECT
SELECT F.MatriculaAluno
FROM Faltas F;