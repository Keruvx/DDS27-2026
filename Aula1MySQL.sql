
-- CREATE DATABASE - Criar banco de dados
CREATE DATABASE bercario; 

-- DROP DATABASE - Apagar banco de dados
DROP DATABASE bercario; 

-- UTILIZA UM BANCO PARA REALIZER AS OPERAÇÕES
USE bercario;

-- CREATE TABLE - CRIA UMA TABELA NO BANCO
-- PRIMARY KEY - DIZ QUAL E A CHAVE PRIMARIA
-- AUTO INCREMENT - DIZ QUE AQUELE ATRIBUTO AUMENTA O NUMERO AUTOMATICAMENTE
-- NOT NULL - DIZ QUE AQUELE ATRIBUTO DEVE SER PREENCHIDO, NÃO PODE SER VAZIO
-- UNIQUE - DIZ QUE SO PODE TER UM DAQUELE REGISTRO NA TABELA

CREATE TABLE tb_mae(
	cod_mae INT PRIMARY KEY AUTO_INCREMENT,
    nome_mae VARCHAR (255) NOT NULL,
	tel_mae VARCHAR (255),
    email_mae VARCHAR (255) UNIQUE
);
CREATE TABLE tb_med(
	cod_med INT PRIMARY KEY AUTO_INCREMENT,
    nome_med VARCHAR (255),
    crm VARCHAR (255) DEFAULT '123456-ES'
);

-- ALTER TABLE - Usado para adicionar lago existente no banco
-- ADD - Adiciona coluna a uma tabela existente
-- ENUM - Vai funcionar como uma validação de dados
ALTER TABLE tb_med
ADD especialidade ENUM("GERAL","PEDIATRA","OBSTETRA");

-- DROP COLUMN - Deleta uma coluna de uma tabela existente
ALTER TABLE tb_med
DROP COLUMN especialidade;

-- MODIFY - Modifica uma coluna de uma tabela existente
ALTER TABLE tb_med
MODIFY COLUMN especialidade VARCHAR(255);


-- DROP TABLE - Apagar a tabela
-- DROP TABLE tb_med

CREATE TABLE tb_bebe(
	cod_bebe INT PRIMARY KEY AUTO_INCREMENT,
    nome_bebe VARCHAR (255),
    data_nasc DATE,
    hora_nasc TIME,
    peso DECIMAL(6,4),
    id_mae INT,
    id_med INT,
    -- REFERENCIANDO AS CHAVES ESTRANGEIRAS
    FOREIGN KEY (id_mae) REFERENCES tb_mae (cod_mae),
    FOREIGN KEY (id_med) REFERENCES tb_med (cod_med)
);

