CREATE DATABASE escola;

DROP DATABASE escola;


CREATE TABLE campus(
	cod_campus INT PRIMARY KEY,
    cidade VARCHAR(150) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE curso (
	cod_curso INT PRIMARY KEY,
    cod_camp INT,
	nome_curso VARCHAR (150) NOT NULL,
    turno VARCHAR(150) NOT NULL,
    duracao INT NOT NULL,
	valor DECIMAL(10,2),
	FOREIGN KEY (cod_camp) REFERENCES campus(cod_campus)
);

CREATE TABLE aluno (
	ra_aluno INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_nasc DATE NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    sex_aluno CHAR(1) NOT NULL
);

CREATE TABLE matricula (
	cod_matricula INT PRIMARY KEY,
    data_mat DATE,
    ra_alunos INT,
    cod_cursos INT,
	FOREIGN KEY (ra_alunos) REFERENCES aluno(ra_aluno),
    FOREIGN KEY (cod_cursos) REFERENCES curso(cod_curso)
);

SELECT * FROM campus;
SELECT * FROM curso;
SELECT * FROM aluno;
SELECT * FROM matricula;

-- 1
SELECT cod_camp,nome_curso FROM curso WHERE cod_camp = 2;

-- 2
SELECT nome_curso FROM curso ORDER BY nome_curso ASC;

-- 3
SELECT nome_curso, valor FROM curso ORDER BY valor DESC LIMIT 5;

-- 4
SELECT cod_camp,nome_curso, valor FROM curso WHERE cod_camp = 1 ORDER BY valor ASC LIMIT 1;

-- 5
SELECT turno, COUNT(turno)FROM curso;

-- 6
SELECT nome_curso, duracao FROM curso WHERE duracao >= 3;

-- 7
SELECT cod_cursos, COUNT(ra_alunos) FROM matricula;

-- 8
SELECT AVG(valor) FROM curso;
SELECT MAX(valor) FROM curso;
SELECT MIN(valor) FROM curso;

-- 9
SELECT duracao, nome_curso FROM curso ORDER BY duracao DESC LIMIT 5;

-- 10
SELECT turno, COUNT(*) AS quantidade_alunos FROM curso GROUP BY turno;

-- 11
SELECT ca.cod_campus, ca.cidade, COUNT(c.cod_curso) AS total_cursos 
FROM campus ca 
JOIN curso c ON ca.cod_campus = c.cod_camp 
GROUP BY ca.cod_campus, ca.cidade 
ORDER BY total_cursos 
DESC LIMIT 1;

-- 12
SELECT c.cod_curso, c.nome_curso
FROM curso c LEFT JOIN matricula m ON c.cod_curso = m.cod_cursos WHERE m.cod_matricula IS NULL;

-- 13
SELECT a.ra_aluno, a.nome, m.data_mat FROM matricula m JOIN aluno a ON m.ra_alunos = a.ra_aluno WHERE m.data_mat BETWEEN '2021-01-01' AND '2021-12-31';

-- 14
SELECT a.ra_aluno, m.data_mat 
FROM aluno a
JOIN matricula m ON a.ra_aluno = m.ra_alunos
WHERE a.nome = 'Fernanda Lima';

-- 15
SELECT a.ra_aluno, a.nome
FROM aluno a
LEFT JOIN matricula m ON a.ra_aluno = m.ra_alunos
WHERE m.cod_matricula IS NULL;

-- 16 
SELECT COUNT(DISTINCT a.ra_aluno) AS total_alunas
FROM aluno a
JOIN matricula m ON a.ra_aluno = m.ra_alunos
WHERE a.sex_aluno = 'F';

-- 17
SELECT a.ra_aluno, a.nome, COUNT(m.cod_cursos) AS total_cursos
FROM aluno a
JOIN matricula m ON a.ra_aluno = m.ra_alunos
GROUP BY a.ra_aluno, a.nome
HAVING COUNT(m.cod_cursos) = 3;

-- 18 
SELECT a.nome, c.nome_curso
FROM aluno a
JOIN matricula m ON a.ra_aluno = m.ra_alunos
JOIN curso c ON m.cod_cursos = c.cod_curso
WHERE a.nome = 'Guilherme Costa';

-- 19
SELECT DISTINCT a.ra_aluno, a.nome
FROM aluno a
JOIN matricula m ON a.ra_aluno = m.ra_alunos
JOIN curso c ON m.cod_cursos = c.cod_curso
WHERE c.nome_curso = 'Ciência da computação';

-- 20
SELECT a.ra_aluno, a.nome, c.nome_curso
FROM aluno a
LEFT JOIN matricula m ON a.ra_aluno = m.ra_alunos
LEFT JOIN curso c ON m.cod_cursos = c.cod_curso;
