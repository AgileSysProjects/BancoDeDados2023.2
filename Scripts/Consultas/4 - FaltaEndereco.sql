-- Retorna professores que não possuem endereço cadastrado
SELECT professores.matricula, professores.nome
FROM professores
LEFT JOIN enderecoprofessor ON professores.matricula = enderecoprofessor.matriculaprofessor
WHERE enderecoprofessor.matriculaprofessor IS NULL;