-- Retorna dados de professores a partir do seu email
SELECT matricula, nome, email
FROM professores
WHERE email LIKE '%gmail%';