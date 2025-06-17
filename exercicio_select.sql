create database exercicios;
use exercicios;

CREATE TABLE filmes (
id INT PRIMARY KEY IDENTITY,
titulo VARCHAR(100),
genero VARCHAR(50),
data_lancamento DATE
);

CREATE TABLE clientes(
id INT PRIMARY KEY IDENTITY,
nome VARCHAR(100),
email VARCHAR(100),
data_nascimento DATE
);

CREATE TABLE locacoes (
id INT PRIMARY KEY IDENTITY,
cliente_id INT,
filme_id INT,
data_locacao DATE,
FOREIGN KEY ( cliente_id ) REFERENCES clientes(id),
FOREIGN KEY ( filme_id ) REFERENCES filmes(id)
);

INSERT INTO filmes (titulo, genero , data_lancamento ) VALUES
('Matrix', 'Ação', '1999-03-31'),
('Titanic', 'Romance', '1997-12-19'),
('Toy Story', 'Animação', '1995-11-22'),
('John Wick ', 'Ação', '2014-10-24'),
('Divertidamente', 'Animação', '2015-06-19'),
('A Origem', 'Ficção', '2010-07-16');

INSERT INTO clientes (nome, email , data_nascimento ) VALUES
('Lucas Martins', 'lucas@email.com', '2000-05-15'),
('Ana Beatriz', NULL, '1995-09-10'),
('José Alves', 'jose@email.com', '1988-01-25'),
('Mariana Dias', NULL, '2002-07-02'),
('Bruno Lima', 'bruno@email.com', '2010-03-08');

INSERT INTO locacoes (cliente_id , filme_id , data_locacao ) VALUES
(1, 1, '2024-05-01'),
(1, 3, '2024-06-01'),
(2, 2, '2024-06-02'),
(3, 4, '2024-06-03'),
(4, 1, '2024-06-01'),
(5, 6, '2024-06-01'),
(1, 2, '2024-06-01');

--1.Liste os gêneros distintos de filmes disponíveis.
--SELECT genero from filmes;
SELECT DISTINCT genero FROM filmes;

--2.Mostre os nomes dos clientes que não têm e mail cadastrado
SELECT nome FROM clientes WHERE email IS NULL;

--3. Quantas locações foram feitas por cliente?
SELECT cliente_id, COUNT(*) AS total FROM locacoes GROUP BY cliente_id;

--4. Liste o nome dos clientes e sua idade.
SELECT nome, DATEDIFF(YEAR, data_nascimento , GETDATE()) AS idade FROM clientes

--5. Liste os filmes alugados no mês de junho de 2024.

SELECT * from locacoes where MONTH(data_locacao) = 6 and YEAR(data_locacao) = 2024;