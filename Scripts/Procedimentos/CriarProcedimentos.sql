CREATE FUNCTION contarPresenca(CHARACTER(8)) RETURNS INTEGER AS
$$
DECLARE
	buscarAluno ALIAS FOR $1;
	faltas INTEGER;
BEGIN
	SELECT INTO faltas COUNT(*)
	FROM alunos A INNER JOIN faltas F ON A.matricula = F.matriculaaluno
	WHERE A.matricula = buscarAluno
	GROUP BY A.matricula;
	RETURN faltas;
END
$$
LANGUAGE PLPGSQL;

CREATE FUNCTION verificarDificuldade(INTEGER) RETURNS FLOAT AS
$$
DECLARE
	buscarid ALIAS FOR $1;
	dificuldade FLOAT;
BEGIN
	SELECT INTO dificuldade AVG(nota)
	FROM avaliacoes AV INNER JOIN avaliacaodealuno AA ON AV.idavaliacao = AA.idavaliacao
	WHERE AV.idavaliacao = buscarid
	GROUP BY AV.idavaliacao;
	RETURN dificuldade;
END
$$
LANGUAGE PLPGSQL;

CREATE FUNCTION contagemAulas(INTEGER) RETURNS INTEGER AS
$$
DECLARE
	buscarturma ALIAS FOR $1;
	quantidadeaulas INTEGER;
BEGIN
	SELECT INTO quantidadeaulas COUNT(*) 
	FROM turmas T INNER JOIN aulas A on T.idturma = A.idturma
	WHERE T.idturma = buscarTurma
	GROUP BY T.idturma;
	RETURN quantidadeaulas;
END
$$
LANGUAGE PLPGSQL;