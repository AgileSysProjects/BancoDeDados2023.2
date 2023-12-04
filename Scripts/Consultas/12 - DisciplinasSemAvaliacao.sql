-- Retorna as disciplinas que não lançaram avaliações
SELECT Nome
FROM Disciplinas D
WHERE NOT EXISTS (
    SELECT *
    FROM Avaliacoes Av
    WHERE Av.idDisciplina = D.idDisciplina
);