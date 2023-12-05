-- Retorna professores que não possuem endereço cadastrado
-- Todos os professores tem endereço cadastrado, por isso o resultado é uma tabela vazia
SELECT professores.matricula, professores.nome
FROM professores
LEFT JOIN enderecoprofessor ON professores.matricula = enderecoprofessor.matriculaprofessor
WHERE enderecoprofessor.matriculaprofessor IS NULL;