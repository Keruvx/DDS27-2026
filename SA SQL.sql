CREATE DATABASE ATVSpotf;


CREATE TABLE musicas(
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

SELECT * FROM musicas;

-- Atividade SQL
-- 1
SELECT COUNT(*) FROM musicas WHERE artista IS NULL;

-- 2
SELECT COUNT(*) FROM musicas;

-- 3
SELECT COUNT(*) FROM musicas WHERE maior_posicao = 1;

-- 4
SELECT musica FROM musicas ORDER BY top_vezes DESC LIMIT 1;

-- 5
SELECT COUNT(DISTINCT (artista)) AS diferente FROM musicas ORDER BY artista;

-- 6
SELECT * FROM musicas ORDER BY total_streams DESC LIMIT 1;

-- 7
SELECT * FROM musicas ORDER BY pico_streams DESC LIMIT 1;

-- 8
SELECT artista FROM musicas ORDER BY top_vezes DESC LIMIT 1;

-- 9
SELECT artista FROM musicas COUNT WHERE musica LIMIT 1;
 
 -- 10
SELECT COUNT(DISTINCT artista) AS diferente FROM musicas WHERE artista LIKE 'H%';

-- 11
SELECT musica FROM musicas WHERE artista LIKE '%Anitta%';

-- 12
SELECT COUNT(*) FROM musicas WHERE total_streams >= 500000;

-- 13
SELECT musica FROM musicas WHERE posicao = 3480;

-- 14.1
SELECT COUNT(*) FROM musicas WHERE artista = 'The Weeknd';

-- 14.2
SELECT musica FROM musicas WHERE artista = 'The Weeknd';

-- 15
SELECT COUNT(*) FROM musicas WHERE musica LIKE 'girl';

-- 16
SELECT SUM(total_streams) FROM musicas WHERE artista = 'Post Malone';

-- 17
SELECT artista FROM musicas COUNT WHERE musica LIMIT 5 ;

-- 18
SELECT SUM(total_streams) FROM musicas ORDER BY total_streams DESC LIMIT 10;

-- 19 Antiga
SELECT musica FROM musicas ORDER BY top_vezes BETWEEN 40 AND 60 DESC LIMIT 10;

-- 19 Nova
SELECT musica as vezes, vezes_maior_posicao, maior_posicao FROM musicas WHERE maior_posicao = 1 AND vezes_maior_posicao = '(7x)';
-- 20 
SELECT musica FROM musicas WHERE total_streams <= 500000 AND posicao BETWEEN 5 AND 10;
