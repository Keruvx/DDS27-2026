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




