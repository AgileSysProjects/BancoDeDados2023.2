-- Retorna as disciplinas que não lançaram avaliações
-- Todas possuem avaliações, por isso retorna uma tabela vazia
SELECT Nome
FROM Disciplinas D
WHERE NOT EXISTS (
    SELECT *
    FROM Avaliacoes Av
    WHERE Av.idDisciplina = D.idDisciplina
);