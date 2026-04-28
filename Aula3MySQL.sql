CREATE DATABASE livraria;

 SELECT * FROM autores;
 SELECT * FROM generos;
 SELECT * FROM livros;
 
 
 
 
 -- INNER JOIN - Cobina duas tabelas com informações semelhantes
 SELECT L.titulo, A.name FROM autores AS A JOIN livros AS L ON A.autor_id = L.autor_id;
-- AS = Nome da tabala
-- JOIN = Juntar uma tabela com a outra
-- ON = estabelesse a conecxão, diz qual a informação deve ser relacionado


-- LEFT JOIN
SELECT L.titulo, A.name AS autor 
FROM autores AS A 
LEFT JOIN livros AS L 
ON A.autor_id = L.autor_id;

-- RIGHT JOIN
SELECT L.titulo, A.name AS autor 
FROM autores AS A 
RIGHT JOIN livros AS L 
ON A.autor_id = L.autor_id;

-- LEFT EXCLUDING JOIN
-- Mostra só o que esta na tabela left
-- Nesse caso, mostra so os autores que não tem livro associado
SELECT L.titulo, A.name AS autor 
FROM autores AS A 
LEFT JOIN livros AS L 
ON A.autor_id = L.autor_id
WHERE L.livros_id IS NULL;

-- RIGHT EXCLUDING JOIN
-- Mostra só o que esta na tabela right
-- Nesse caso, mostra so os livros que não tem autores associado
SELECT L.titulo, A.name AS autor 
FROM autores AS A 
RIGHT JOIN livros AS L 
ON A.autor_id = L.autor_id
WHERE A.autor_id IS NULL;

-- OUTER JOIN
-- Juncao de dois ou mais JOINS

-- Faça o RIGHT JOIN
SELECT L.titulo, A.name AS autor FROM autores AS A RIGHT JOIN livros AS L ON A.autor_id = L.autor_id

-- Operador e uniao
UNION

-- Faça  left JOIN
SELECT L.titulo, A.name AS autor FROM autores AS A LEFT JOIN livros AS L ON A.autor_id = L.autor_id;

-- JOIN MAIS TOP
-- JOIN ENTRE 3 TABELAS

SELECT * FROM livros AS L
JOIN autores AS A
ON A.autor_id = L.autor_id
JOIN generos AS G ON g.genero_id = L.genero_id;

SELECT titulo, G.name AS genero, A.name AS autor
FROM livros AS L
JOIN autores AS A
ON A.autor_id = L.autor_id
JOIN generos AS G ON g.genero_id = L.genero_id;