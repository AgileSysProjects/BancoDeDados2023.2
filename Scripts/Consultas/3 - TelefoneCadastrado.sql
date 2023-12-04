-- Retorna professores que possuem seus dois telefones cadastrados
SELECT matricula, nome, telefone1, telefone2
FROM professores
WHERE telefone1 IS NOT NULL AND telefone2 IS NOT NULL;