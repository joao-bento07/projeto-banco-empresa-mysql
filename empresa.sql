-- ==========================================
-- PROJETO: BANCO DE DADOS EMPRESA
-- EXERCICIO: FUNCIONARIOS E SALARIOS
-- ==========================================

-- 1. CRIACAO DO BANCO DE DADOS

CREATE DATABASE IF NOT EXISTS Empresa;

USE Empresa;


-- 2. CRIACAO DA TABELA FUNCIONARIOS

CREATE TABLE Funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);


-- 3. CRIACAO DA TABELA SALARIOS

CREATE TABLE Salarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,

    CONSTRAINT fk_funcionario
    FOREIGN KEY (funcionario_id)
    REFERENCES Funcionarios(id)
);


-- ==========================================
-- 4. INSERCAO DE FUNCIONARIOS
-- ==========================================

INSERT INTO Funcionarios (nome, cargo)
VALUES
('Joao Silva', 'Desenvolvedor Java'),
('Maria Oliveira', 'Analista de Sistemas'),
('Pedro Santos', 'Desenvolvedor Java'),
('Ana Costa', 'Gerente de Projetos'),
('Lucas Pereira', 'Analista de Sistemas');


-- ==========================================
-- 5. INSERCAO DOS SALARIOS
-- ==========================================

INSERT INTO Salarios (funcionario_id, salario, data_pagamento)
VALUES
(1, 5500.00, '2026-11-01'),
(2, 4800.00, '2026-11-01'),
(3, 6000.00, '2026-11-01'),
(4, 7500.00, '2026-11-01'),
(5, 5000.00, '2026-11-01');


-- ==========================================
-- 6. CONSULTA DE TODOS OS FUNCIONARIOS
-- COM SEUS RESPECTIVOS SALARIOS
-- ==========================================

SELECT
    f.id,
    f.nome,
    f.cargo,
    s.salario,
    s.data_pagamento
FROM Funcionarios f
INNER JOIN Salarios s
ON f.id = s.funcionario_id;


-- ==========================================
-- 7. ATUALIZACAO DO SALARIO
-- ==========================================

UPDATE Salarios
SET salario = 6500.00
WHERE funcionario_id = 1;


-- ==========================================
-- 8. EXCLUSAO DE UM FUNCIONARIO
-- E SEU RESPECTIVO SALARIO
-- ==========================================

-- Primeiro exclui o salario para respeitar
-- a chave estrangeira.

DELETE FROM Salarios
WHERE funcionario_id = 5;

-- Depois exclui o funcionario.

DELETE FROM Funcionarios
WHERE id = 5;


-- ==========================================
-- 9. CONSULTA DO SALARIO MEDIO POR CARGO
-- GROUP BY E AVG
-- ==========================================

SELECT
    f.cargo,
    AVG(s.salario) AS salario_medio
FROM Funcionarios f
INNER JOIN Salarios s
ON f.id = s.funcionario_id
GROUP BY f.cargo;


-- ==========================================
-- 10. CONSULTA UTILIZANDO INNER JOIN
-- NOME, SALARIO E CARGO
-- ==========================================

SELECT
    f.nome,
    s.salario,
    f.cargo
FROM Funcionarios f
INNER JOIN Salarios s
ON f.id = s.funcionario_id;


-- ==========================================
-- FIM DO EXERCICIO
-- ==========================================
