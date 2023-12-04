-- Retorna média global de um aluno em específico usando sua matrícula
SELECT avg(a.nota)
FROM avaliacaodealuno a, alunos c
WHERE a.matriculaaluno = c.matricula and c.matricula ='20230029';