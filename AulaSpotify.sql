CREATE DATABASE spotify;
DROP DATABASE spotify;

USE spotify;

CREATE TABLE top(
	posicao INT PRIMARY KEY AUTO_INCREMENT,
    artista VARCHAR(42),
    musica VARCHAR(42),
    dias int,
    top_vezes DOUBLE,
	maior_posicao INT,
    vezes_maior_posicao VARCHAR(10),
    pico_streams INT,
    total_streams INT
);

SELECT * FROM top;

-- FILTARANDO COLUNAS
SELECT posicao, artista, musica FROM top;

-- FILTRANDO COM WHERE
SELECT posicao, artista, musica FROM top WHERE artista = "Kendrick Lamar";

-- FILTRARNDO COM OPERADORES RELACIONAIS
SELECT * FROM TOP WHERE top_vezes >= 100;
SELECT * FROM TOP WHERE top_vezes <= 100;
SELECT * FROM TOP WHERE top_vezes = 100;

SELECT * FROM top WHERE artista = "SZA" AND maior_posicao = 5;

-- ORDENANDO ORDER BY, ASC = DE CIMA PARA BAIXO, DESC = DE BAIXO PRA CIMA
SELECT * FROM TOP ORDER BY artista DESC;

-- ENTRE = BETWEEN
SELECT * FROM TOP WHERE maior_posicao BETWEEN 10 AND 15;
SELECT * FROM TOP WHERE artista BETWEEN 'SZA' AND 'Kendrick Lamar'
ORDER BY artista;

SELECT * FROM TOP WHERE artista IN ('Justin Bieber', 'Maroon 5', 'Queen');
SELECT * FROM TOP WHERE dias IN (20, 30, 40);

-- LIKE - PESQUISA NOMES
-- NO FIM
SELECT artista, musica FROM TOP WHERE musica LIKE 'Super%';
-- NO INICIO
SELECT artista, musica FROM TOP WHERE musica LIKE '%Blue';
-- NO MEIO
SELECT artista, musica FROM TOP WHERE musica LIKE '%Blue%';

-- COUNT
SELECT COUNT(*) FROM TOP; 

SELECT COUNT(*) FROM TOP WHERE artista = 'Travis Scott';

-- DISTINCT - REGISTROS DIFERENTES
SELECT DISTINCT (artista) AS diferente FROM top ORDER BY artista;

-- CONTAGEM DE ARTISTAS DIFERENTES
SELECT COUNT(DISTINCT (artista)) AS diferente FROM top ORDER BY artista;

SELECT artista, musica FROM top GROUP BY artista;

-- AGRUPAR RESULTADOS
SELECT artista, COUNT(artista)FROM top GROUP BY artista;

-- LIMIT = LIMITA OS RESULTADOS
SELECT * FROM TOP WHERE maior_posicao = 7
LIMIT 5;


-- SOMA DE RESULTADOS
SELECT SUM(total_streams) FROM TOP;

-- MEDIA DE RESULTADOS
SELECT AVG(total_streams) FROM TOP;

-- VALOR MAXIMO DE RESULTADOS
SELECT MAX(total_streams) FROM TOP;
-- VALOR MINIMO DE RESULTADOS
SELECT MIN(total_streams) FROM TOP;