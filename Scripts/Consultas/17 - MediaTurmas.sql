-- Retorna média global (todos os alunos) de cada turma
SELECT a.idturma, AVG(nota)
FROM avaliacoes a, avaliacaodealuno b
WHERE a.idavaliacao = b.idavaliacao
GROUP BY a.idturma;