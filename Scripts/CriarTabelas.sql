CREATE TABLE professores (
    matricula CHARACTER(8),
    cpf CHARACTER(14) UNIQUE,
    nome VARCHAR(100) NOT NULL,
    dtadmissao DATE NOT NULL,
    salario REAL NOT NULL,
    email VARCHAR(30) NOT NULL,
    areaensino VARCHAR(40) NOT NULL,
    titulacao VARCHAR(40) NOT NULL,
    telefone1 VARCHAR(15) NOT NULL,
    telefone2 VARCHAR(15),
    PRIMARY KEY (matricula)
);

CREATE TABLE enderecoprofessor (
    matriculaprofessor CHARACTER(8),
    municipio VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    numero INTEGER NOT NULL,
    logradouro VARCHAR(30) NOT NULL,
    PRIMARY KEY (matriculaprofessor),
    FOREIGN KEY (matriculaprofessor) REFERENCES professores(matricula)
);

CREATE TABLE secretarios (
    matricula CHARACTER(8),
    cpf CHARACTER(14) UNIQUE,
    nome VARCHAR(100) NOT NULL,
    dtadmissao DATE NOT NULL,
    salario REAL NOT NULL,
    email VARCHAR(30) NOT NULL,
    tipocargo VARCHAR(30) NOT NULL,
    horariotrabalho VARCHAR(30) NOT NULL,
    telefone1 VARCHAR(15) NOT NULL,
    telefone2 VARCHAR(15),
    PRIMARY KEY (matricula)
);

create table enderecosecretario (
    matriculasecretario CHARACTER(8),
    municipio VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    numero INTEGER NOT NULL,
    logradouro VARCHAR(30) NOT NULL,
    primary key (matriculasecretario),
    foreign key (matriculasecretario) REFERENCES secretarios(matricula)
);

CREATE TABLE disciplinas (
    iddisciplina INTEGER,
    totalaulas INTEGER NOT NULL,
    cargahoraria INTEGER NOT NULL,
    nome VARCHAR(20) NOT NULL,
    PRIMARY KEY (iddisciplina)
);

CREATE TABLE turmas (
    idturma INTEGER, 
    ano INTEGER NOT NULL,
    quantalunos INTEGER NOT NULL,
    sala VARCHAR(40) NOT NULL,
    serie VARCHAR(20) NOT NULL,
    PRIMARY KEY (idturma)
);

CREATE TABLE aulas (
    idaula INTEGER,
    conteudo VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    idturma INTEGER,
    iddisciplina INTEGER,
    PRIMARY KEY (idaula),
    FOREIGN KEY (idturma) REFERENCES turmas(idturma),
    FOREIGN KEY (iddisciplina) REFERENCES disciplinas(iddisciplina)
);

CREATE TABLE alunos (
    matricula CHARACTER(8),
    cpf CHARACTER(14) UNIQUE,
    sexo CHARACTER(1) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    datanascimento DATE NOT NULL,
    nomeresponsavel VARCHAR(100) NOT NULL,
    telefoneresponsavel1 VARCHAR(15) NOT NULL,
    telefoneresponsavel2 VARCHAR(15),
    matriculasecretario CHARACTER(8),
    PRIMARY KEY (matricula),
    FOREIGN KEY (matriculasecretario) REFERENCES secretarios(matricula)
);

CREATE TABLE enderecoalunos(
    matriculaaluno CHARACTER(8),
    zona CHARACTER(20),
    municipio VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    numero INTEGER NOT NULL,
    logradouro VARCHAR(30) NOT NULL,
    PRIMARY KEY (matriculaaluno),
    FOREIGN KEY (matriculaaluno) REFERENCES alunos(matricula)
);

CREATE TABLE bimestres (
    idbimestre INTEGER,
    anoletivo INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    dtinicio DATE,
    dttermino DATE,
    PRIMARY KEY (idbimestre)
);

CREATE TABLE avaliacoes (
    idavaliacao INTEGER,
    tipo varchar(30) NOT NULL,
    data date NOT NULL,
    idbimestre INTEGER,
    iddisciplina INTEGER,
    idturma INTEGER,
    PRIMARY KEY (idavaliacao),
    FOREIGN KEY (idbimestre) REFERENCES bimestres(idbimestre),
    FOREIGN KEY (iddisciplina) REFERENCES disciplinas(iddisciplina),
    FOREIGN KEY (idturma) REFERENCES turmas(idturma)
);

CREATE TABLE faltas (
    idfalta INTEGER, 
    matriculaaluno CHARACTER(8),
    justificativa VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    PRIMARY KEY (idfalta),
    FOREIGN KEY (matriculaaluno) REFERENCES alunos(matricula)
);

CREATE TABLE faltasporaula (
    idfalta INTEGER,
    idaula INTEGER,
    PRIMARY KEY (idfalta, idaula),
    FOREIGN KEY (idfalta) REFERENCES faltas(idfalta),
    FOREIGN KEY (idaula) REFERENCES aulas(idaula)
);

CREATE TABLE avaliacaodealuno (
    matriculaaluno CHARACTER(8),
    idavaliacao INTEGER,
    nota REAL NOT NULL,
    PRIMARY KEY (matriculaaluno, idavaliacao),
    FOREIGN KEY (matriculaaluno) REFERENCES alunos(matricula),
    FOREIGN KEY (idavaliacao) REFERENCES avaliacoes(idavaliacao)
);

CREATE TABLE bimestredealuno (
    matriculaaluno CHARACTER(8),
    idbimestre INTEGER, 
    situacao VARCHAR(20),
    PRIMARY KEY (matriculaaluno, idbimestre),
    FOREIGN KEY (matriculaaluno) REFERENCES alunos(matricula),
    FOREIGN KEY (idbimestre) REFERENCES bimestres(idbimestre)
);

CREATE TABLE turmasdealuno (
    idturma INTEGER,
    matriculaaluno CHARACTER(8),
    anomatriculado INTEGER NOT NULL,
    PRIMARY KEY (idturma, matriculaaluno),
    FOREIGN KEY (idturma) REFERENCES turmas(idturma),
    FOREIGN KEY (matriculaaluno) REFERENCES alunos(matricula)
);

CREATE TABLE professoresporturma (
    matriculaprofessor CHARACTER(8),
    idturma INTEGER,
    iddisciplina INTEGER,
    PRIMARY KEY (matriculaprofessor, idturma, iddisciplina),
    FOREIGN KEY (matriculaprofessor) REFERENCES professores(matricula),
    FOREIGN KEY (idturma) REFERENCES turmas(idturma),
    FOREIGN KEY (iddisciplina) REFERENCES disciplinas(iddisciplina)
);