-- DDL - Definição das Tabelas

DROP TABLE IF EXISTS registro_etapa;
DROP TABLE IF EXISTS posto;
DROP TABLE IF EXISTS etapa;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    papel VARCHAR(20) NOT NULL
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE etapa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ordem INT NOT NULL
);

CREATE TABLE posto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE registro_etapa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    etapa_id INT NOT NULL,
    posto_id INT NOT NULL,
    usuario_id INT NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observacoes TEXT,
    FOREIGN KEY (produto_id) REFERENCES produto(id),
    FOREIGN KEY (etapa_id) REFERENCES etapa(id),
    FOREIGN KEY (posto_id) REFERENCES posto(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);