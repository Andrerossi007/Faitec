
-- Tabela: Usuario (login do sistema)
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL, -- armazenar hash (ex: bcrypt)
    papel ENUM('ADMIN', 'OPERADOR', 'INSPECAO', 'GESTOR') DEFAULT 'OPERADOR',
    ativo BOOLEAN DEFAULT TRUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: Produto (o que está sendo acompanhado)
CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(255) NOT NULL
);

-- Tabela: Etapa (etapas como LA, FE, TE, MN, EM, IF)
CREATE TABLE Etapa (
    id_etapa INT PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(2) NOT NULL UNIQUE, -- Ex: 'LA', 'FE'
    nome VARCHAR(50) NOT NULL          -- Ex: 'Laminação', 'Fechamento'
);

-- Tabela: RegistroEtapa (registro do andamento do produto nas etapas)
CREATE TABLE RegistroEtapa (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_etapa INT NOT NULL,
    id_usuario INT, -- quem fez o registro
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resultado ENUM('APROVADO', 'REPROVADO') NOT NULL,
    responsavel VARCHAR(100),
    descricao TEXT,

    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_etapa) REFERENCES Etapa(id_etapa),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);
