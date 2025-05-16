-- DML - Inserção de Dados Exemplo

-- Usuários
INSERT INTO usuario (login, senha, papel) VALUES ('admin', 'admin123', 'ADMIN');
INSERT INTO usuario (login, senha, papel) VALUES ('operador1', 'op123', 'OPERADOR');

-- Produtos
INSERT INTO produto (nome, codigo) VALUES ('Produto A', 'PROD-A01');
INSERT INTO produto (nome, codigo) VALUES ('Produto B', 'PROD-B01');

-- Etapas
INSERT INTO etapa (nome, ordem) VALUES ('Recebimento', 1);
INSERT INTO etapa (nome, ordem) VALUES ('Montagem', 2);
INSERT INTO etapa (nome, ordem) VALUES ('Teste', 3);

-- Postos
INSERT INTO posto (nome, descricao) VALUES ('Posto 1', 'Setor de entrada de produtos');
INSERT INTO posto (nome, descricao) VALUES ('Posto 2', 'Montagem dos componentes');

-- Registro de Etapas
INSERT INTO registro_etapa (produto_id, etapa_id, posto_id, usuario_id, observacoes)
VALUES (1, 1, 1, 1, 'Produto recebido com sucesso');