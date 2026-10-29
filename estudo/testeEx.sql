-- =====================================================================
-- Teste prático de treino — Biblioteca
-- Resolução
-- =====================================================================

USE ULHT_DB26
GO

-- Q1 ------------------------------------------------------------------
CREATE SCHEMA bib
GO

-- Q2 ------------------------------------------------------------------
-- Tabelas sem PK nem FK (as restrições entram na Q3)
CREATE TABLE bib.autor (
    cod_autor     VARCHAR(10)  NOT NULL,
    nome          VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)  NULL
)
GO

CREATE TABLE bib.livro (
    isbn      VARCHAR(13)  NOT NULL,
    titulo    VARCHAR(150) NOT NULL,
    ano       SMALLINT     NOT NULL,
    preco     DECIMAL(6,2) NOT NULL,
    cod_autor VARCHAR(10)  NOT NULL
)
GO

CREATE TABLE bib.leitor (
    num_leitor INT          NOT NULL,
    nome       VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NULL
)
GO

CREATE TABLE bib.emprestimo (
    num_leitor INT         NOT NULL,
    isbn       VARCHAR(13) NOT NULL,
    data_emp   DATE        NOT NULL,
    data_dev   DATE        NULL
)
GO

-- Q3 ------------------------------------------------------------------
-- a) Chaves primárias (têm de existir antes das FKs)
ALTER TABLE bib.autor      ADD CONSTRAINT pk_autor      PRIMARY KEY (cod_autor)
ALTER TABLE bib.livro      ADD CONSTRAINT pk_livro      PRIMARY KEY (isbn)
ALTER TABLE bib.leitor     ADD CONSTRAINT pk_leitor     PRIMARY KEY (num_leitor)
ALTER TABLE bib.emprestimo ADD CONSTRAINT pk_emprestimo PRIMARY KEY (num_leitor, isbn, data_emp)
GO

-- b) Chaves estrangeiras
ALTER TABLE bib.livro      ADD CONSTRAINT fk_livro_autor
    FOREIGN KEY (cod_autor)  REFERENCES bib.autor(cod_autor)
ALTER TABLE bib.emprestimo ADD CONSTRAINT fk_emprestimo_leitor
    FOREIGN KEY (num_leitor) REFERENCES bib.leitor(num_leitor)
ALTER TABLE bib.emprestimo ADD CONSTRAINT fk_emprestimo_livro
    FOREIGN KEY (isbn)       REFERENCES bib.livro(isbn)
GO

-- c) Email único
ALTER TABLE bib.leitor ADD CONSTRAINT uq_leitor_email UNIQUE (email)
GO

-- d) Ano entre 1450 e 2026; preço não negativo
ALTER TABLE bib.livro ADD CONSTRAINT ck_livro_ano   CHECK (ano BETWEEN 1450 AND 2026)
ALTER TABLE bib.livro ADD CONSTRAINT ck_livro_preco CHECK (preco >= 0)
GO

-- e) Data de empréstimo por defeito = hoje (sintaxe diferente: DEFAULT ... FOR coluna)
ALTER TABLE bib.emprestimo ADD CONSTRAINT df_emprestimo_data DEFAULT GETDATE() FOR data_emp
GO

-- Q4 ------------------------------------------------------------------
-- Restrições do schema (esperado: 10 = 4 PK + 3 FK + 1 UNIQUE + 2 CHECK; o DEFAULT não aparece aqui)
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
WHERE tc.TABLE_SCHEMA = 'bib'
ORDER BY tc.TABLE_NAME, tc.CONSTRAINT_TYPE

-- Colunas de cada chave (esperado: 10 = 6 das PKs + 3 das FKs + 1 do UNIQUE)
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu
WHERE kcu.TABLE_SCHEMA = 'bib'
ORDER BY kcu.TABLE_NAME, kcu.CONSTRAINT_NAME, kcu.ORDINAL_POSITION

-- Q5 ------------------------------------------------------------------
-- Ordem: pais primeiro (autor -> livro -> leitor -> emprestimo)
-- Sem IDENTITY: todos os valores são escritos, pela ordem das colunas

-- 3 autores (A3 fica sem livros)
INSERT INTO bib.autor VALUES ('A1', 'José Saramago',     'Portuguesa')
INSERT INTO bib.autor VALUES ('A2', 'Eça de Queirós',    'Portuguesa')
INSERT INTO bib.autor VALUES ('A3', 'Jorge Luis Borges', 'Argentina')

-- 5 livros, só de A1 e A2
INSERT INTO bib.livro VALUES ('9780000000001', 'Ensaio sobre a Cegueira',        1995, 16.60, 'A1')
INSERT INTO bib.livro VALUES ('9780000000002', 'Memorial do Convento',           1982, 17.70, 'A1')
INSERT INTO bib.livro VALUES ('9780000000003', 'O Ano da Morte de Ricardo Reis', 1984, 18.80, 'A1')
INSERT INTO bib.livro VALUES ('9780000000004', 'Os Maias',                       1888, 14.90, 'A2')
INSERT INTO bib.livro VALUES ('9780000000005', 'O Primo Basílio',                1878, 12.50, 'A2')

-- 3 leitores (o 3 fica sem empréstimos), emails diferentes por causa do UNIQUE
INSERT INTO bib.leitor VALUES (1, 'Ana Silva',   'ana.silva@mail.pt')
INSERT INTO bib.leitor VALUES (2, 'Bruno Costa', 'bruno.costa@mail.pt')
INSERT INTO bib.leitor VALUES (3, 'Carla Dias',  'carla.dias@mail.pt')

-- 5 empréstimos, só dos leitores 1 e 2; data_dev NULL = por devolver
INSERT INTO bib.emprestimo VALUES (1, '9780000000001', '2026-10-01', '2026-10-15')
INSERT INTO bib.emprestimo VALUES (1, '9780000000004', '2026-10-10', NULL)
INSERT INTO bib.emprestimo VALUES (2, '9780000000002', '2026-09-20', '2026-10-05')
INSERT INTO bib.emprestimo VALUES (2, '9780000000005', '2026-10-18', NULL)
-- Usa o valor por defeito da data (fica a data de hoje)
INSERT INTO bib.emprestimo VALUES (2, '9780000000003', DEFAULT, NULL)

SELECT * FROM bib.autor
SELECT * FROM bib.livro
SELECT * FROM bib.leitor
SELECT * FROM bib.emprestimo

-- Q6 ------------------------------------------------------------------
-- Viola a FK: o autor A99 não existe
INSERT INTO bib.livro VALUES ('9780000000099', 'Livro Fantasma', 2020, 10.00, 'A99')
-- Erro: The INSERT statement conflicted with the FOREIGN KEY constraint "fk_livro_autor".

-- Viola o CHECK do ano: 2030 > 2026
INSERT INTO bib.livro VALUES ('9780000000098', 'Livro do Futuro', 2030, 10.00, 'A1')
-- Erro: The INSERT statement conflicted with the CHECK constraint "ck_livro_ano".

-- Q7 ------------------------------------------------------------------
-- a) Título de cada livro e nome do autor
SELECT l.titulo, a.nome AS autor
FROM bib.livro l
INNER JOIN bib.autor a ON l.cod_autor = a.cod_autor

-- b) Todos os autores e o nº de livros, incluindo os que têm 0
--    LEFT JOIN para manter o A3; COUNT(l.isbn) e não COUNT(*), senão o A3 contava 1
SELECT a.nome, COUNT(l.isbn) AS num_livros
FROM bib.autor a
LEFT JOIN bib.livro l ON l.cod_autor = a.cod_autor
GROUP BY a.cod_autor, a.nome

-- c) Leitores que nunca fizeram empréstimos
--    Forma 1: LEFT JOIN + IS NULL
SELECT le.num_leitor, le.nome
FROM bib.leitor le
LEFT JOIN bib.emprestimo e ON e.num_leitor = le.num_leitor
WHERE e.num_leitor IS NULL

--    Forma 2: NOT EXISTS
SELECT le.num_leitor, le.nome
FROM bib.leitor le
WHERE NOT EXISTS (SELECT 1 FROM bib.emprestimo e WHERE e.num_leitor = le.num_leitor)

-- d) Empréstimos por devolver, do mais antigo para o mais recente
SELECT le.nome AS leitor, l.titulo, e.data_emp
FROM bib.emprestimo e
INNER JOIN bib.leitor le ON le.num_leitor = e.num_leitor
INNER JOIN bib.livro  l  ON l.isbn = e.isbn
WHERE e.data_dev IS NULL
ORDER BY e.data_emp

-- e) Livros com preço acima da média (subquery)
SELECT l.titulo, l.preco
FROM bib.livro l
WHERE l.preco > (SELECT AVG(preco) FROM bib.livro)

-- Q8 ------------------------------------------------------------------
-- CREATE VIEW tem de ficar sozinho no lote: GO antes e depois
-- Sem ORDER BY dentro da view; ordena-se na consulta
GO
CREATE VIEW bib.emprestimos_ativos AS
SELECT le.nome AS leitor, l.titulo, e.data_emp
FROM bib.emprestimo e
INNER JOIN bib.leitor le ON le.num_leitor = e.num_leitor
INNER JOIN bib.livro  l  ON l.isbn = e.isbn
WHERE e.data_dev IS NULL
GO

SELECT * FROM bib.emprestimos_ativos ORDER BY data_emp

-- Q9 ------------------------------------------------------------------
-- Índice na coluna usada para pesquisar livros por autor (a FK)
CREATE INDEX ix_livro_cod_autor ON bib.livro (cod_autor)

-- EXEC é obrigatório quando o procedimento não é a primeira instrução do lote
EXEC sp_helpindex 'bib.livro'

-- Q10 -----------------------------------------------------------------
-- Ordem: view -> filhas -> pais -> schema (o schema tem de estar vazio)
DROP VIEW  bib.emprestimos_ativos
DROP TABLE bib.emprestimo   -- referencia livro e leitor
DROP TABLE bib.livro        -- referencia autor
DROP TABLE bib.leitor
DROP TABLE bib.autor
GO

DROP SCHEMA bib
GO