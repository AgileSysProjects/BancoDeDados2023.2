-- Retorna dados de professores a partir do seu nome ou sobrenome
SELECT matricula, nome
FROM professores
WHERE nome LIKE '%Silva%';