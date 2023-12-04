-- Retorna média global das turmas que obtiveram resultado superior a 7
SELECT a.idturma, AVG(nota) AS mediaturma
FROM avaliacoes a, avaliacaodealuno b
WHERE a.idavaliacao = b.idavaliacao
GROUP BY a.idturma
HAVING AVG(nota) > 7;