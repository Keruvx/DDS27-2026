CREATE DATABASE Campeonato;
DROP DATABASE campeonato;
USE campeonato;

CREATE TABLE equipe(
	cod_equipe INT PRIMARY KEY AUTO_INCREMENT,
    nome_equipe VARCHAR(42) NOT NULL,
	sigla_equipe CHAR(3) UNIQUE,
    estado CHAR(2)
);
CREATE TABLE jogador(
	cod_jogador INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (50) NOT NULL,
    nacionalidade VARCHAR (50),
	altura DECIMAL (3,2),
    peso DECIMAL (6,3),
    idade INT,
    numero_camisa INT,
    posicao ENUM("GOLEIRO", "ZAGUEIRO", "MEIO", "ATACANTE"),
    id_equipe INT,
    FOREIGN KEY (id_equipe) REFERENCES equipe(cod_equipe)

);

-- CRUD NO BANCO
-- C = CREATE
-- FORMA 1 COM COLUNAS
INSERT INTO equipe (nome_equipe, sigla_equipe, estado)
			VALUES 	("Gama","GAM","DF"),
					("Milan","MIL","BA");
                    
-- FORMA 2 - SEM COLUNAS
INSERT INTO equipe
		VALUES 	(DEFAULT,"Ituano", "ITU", "ES"),
				(DEFAULT,"Vasco", "VAS", "RJ"),     
				(DEFAULT,"Vitoria", "VIT", "ES"),     
				(DEFAULT,"Rio Branco", "RIB", "ES");    
                
-- R - READ
SELECT * FROM equipe;

-- U - UPDATA
UPDATE equipe
SET estado = "MD"
WHERE nome_equipe = "Milan";

-- D - DELETE
DELETE FROM equipe
WHERE cod_equipe = 4;

-- INSERIR JOGADORES
INSERT INTO jogador (nome, peso, numero_camisa, posicao, id_equipe)
			VALUES 	("Vini Jr", 73.0, 7,"ATACANTE", 2);
INSERT INTO jogador (nome, peso, numero_camisa, posicao, id_equipe)
            VALUES 	("Paqueta", 78.9, 5,"GOLEIRO",3),
					("Messi", 42.9, 3,"MEIO",3);

-- VER TABELA JOGADOR
SELECT * FROM jogador;