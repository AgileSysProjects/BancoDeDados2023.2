CREATE FUNCTION verificarSalario()
 RETURNS TRIGGER AS
 $$
 BEGIN
 	IF NEW.Titulacao = 'Graduação' THEN IF NEW.Salario >= 1200 AND NEW.Salario < 3500 THEN RETURN NEW;
	END IF;
	END IF;
	IF NEW.Titulacao = 'Mestrado' THEN IF NEW.Salario >=3500 AND NEW.Salario < 5000 THEN RETURN NEW;
	
	END IF;
	END IF;
	IF NEW.Titulacao = 'Doutorado' THEN IF NEW.Salario >= 5000 THEN RETURN NEW;
		ELSE RETURN NULL;
		END IF;
	END IF;
 END
 $$
 LANGUAGE PLPGSQL;
 
CREATE TRIGGER verificarSalarioTG
BEFORE INSERT OR UPDATE ON Professores
FOR EACH ROW
EXECUTE PROCEDURE verificarSalario();

CREATE FUNCTION verificarTotalAulas()
 RETURNS TRIGGER AS
 $$
 BEGIN
 	IF NEW.Totalaulas < 1 THEN RETURN NULL;
		ELSE IF NEW.Cargahoraria <= NEW.Totalaulas * 30 THEN RETURN NULL;
			ELSE RETURN NEW;
			END IF;
	END IF;
 END
 $$
 LANGUAGE PLPGSQL;
 
 CREATE TRIGGER verificarTotalAulasTG
 BEFORE INSERT OR UPDATE ON Disciplinas
 FOR EACH ROW
 EXECUTE PROCEDURE verificarTotalAulas();

CREATE FUNCTION verificarAprovacao() RETURNS TRIGGER AS
$$
DECLARE
	mediaGlobal avaliacaoDeAluno.nota%TYPE;
BEGIN
	SELECT INTO mediaGlobal AVG(AL.nota)
	FROM (Avaliacaodealuno AL INNER JOIN Alunos A ON AL.matriculaaluno = A.matricula) 
		  NATURAL INNER JOIN avaliacoes AV
	WHERE A.matricula = NEW.matriculaAluno
	GROUP BY A.matricula;

	IF mediaGlobal >= 7 THEN 
		UPDATE bimestreDeAluno B SET situacao = 'Aprovado'
		WHERE B.matriculaAluno = NEW.matriculaAluno;
	ELSIF mediaGlobal < 7 THEN 
		UPDATE bimestreDeALUNO B SET situacao = 'Reprovado'
		WHERE B.matriculaAluno = NEW.matriculaAluno;
		END IF;
	RETURN NEW;
END
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER alunosAprovados AFTER
INSERT OR UPDATE OR DELETE ON avaliacaoDeAluno
FOR EACH ROW
EXECUTE PROCEDURE verificarAprovacao();