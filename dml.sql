-- Criando a tabela de clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- Criando a tabela de pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    valor DECIMAL(10, 2),
    data DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id)
);

-- Inserindo dados na tabela clientes
INSERT INTO
    clientes ( nome, cidade)
VALUES ( 'João', 'Paranaguá'),
    ( 'Maria', 'Curitiba'),
    ( 'Carlos', 'Matinhos'),
    ( 'Ana', 'Paranaguá'),
    ( 'Pedro', 'Guaratuba');

-- Inserindo dados na tabela pedidos
INSERT INTO
    pedidos (id, cliente_id, valor, data)
VALUES (1, 1, 150.00, '2023-01-15'),
    (2, 1, 90.00, '2023-02-10'),
    (3, 2, 300.00, '2023-03-05'),
    (4, 3, 50.00, '2023-04-12'),
    (5, 4, 200.00, '2023-05-20'),
    (6, 1, 120.00, '2023-06-01'),
    (7, 5, 80.00, '2023-07-18');

SELECT * from pedidos WHERE valor > 100;

SELECT * FROM clientes WHERE cidade = 'Rio de Janeiro';

SELECT * FROM pedidos WHERE valor BETWEEN 100 AND 200;
SELECT * FROM pedidos WHERE data BETWEEN '2023-01-01' AND '2023-12-31';

SELECT c.nome, p.valor
FROM clientes c
JOIN pedidos p  ON c.id = p.id;
SELECT c.nome, p.valor
FROM clientes c
LEFT JOIN pedidos p  ON c.id = p.id;

SELECT cliente_id, count(*)
AS total_pedidos
FROM pedidos
GROUP BY cliente_id;


SELECT AVG(valor) AS valor_medio
FROM pedidos

SELECT cliente_id, COUNT(*) As total_pedidos
FROM pedidos
GROUP BY cliente_id
HAVING COUNT(*) > 2;


INSERT INTO clientes(id, nome, cidade)
VALUES (6,"Lucas","Antonina");

INSERT INTO pedidos(id, cliente_id, valor,data)
VALUES (7, 6, 100.00, '2023-08-10');

UPDATE clientes
SET nome = 'Lucas Silva'
WHERE id = 6;

UPDATE pedidos
SET valor = valor * 1.10
WHERE valor >= 100;

DELETE FROM pedidos
WHERE valor < 100;

DELETE FROM clientes
WHERE name = 'Carlos';


CREATE TABLE produtos(
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2 )
);

ALTER TABLE clientes
ADD COLUMN email VARCHAR(100);

UPDATE clientes
SET email = 'desconhecido@email.com';


CREATE VIEW vw_total_pedidos AS
SELECT c.id, c.nome, COUNT(p.id)
AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.id, c.nome;
