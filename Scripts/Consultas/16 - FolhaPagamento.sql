-- Retorna total da folha de pagamento da escola
SELECT SUM(sum) AS folhapagamento
FROM (
    SELECT SUM(salario) 
	FROM professores
    UNION
    SELECT SUM(salario) 
	FROM secretarios
);