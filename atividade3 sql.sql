CREATE TABLE doencas (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT,
  impede_doacao BOOLEAN NOT NULL
);

CREATE TABLE doador_doenca (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  doador_id INT UNSIGNED NOT NULL,
  doenca_id INT UNSIGNED NOT NULL,
  CONSTRAINT fk_dd_doador FOREIGN KEY (doador_id) REFERENCES doador(id),
  CONSTRAINT fk_dd_doenca FOREIGN KEY (doenca_id) REFERENCES doencas(id),
  UNIQUE KEY uk_doador_doenca (doador_id, doenca_id)
);

INSERT INTO doencas (nome, descricao, impede_doacao) VALUES
('HIV', 'Infecção pelo vírus da imunodeficiência humana.', TRUE),
('Hepatite B', 'Doença viral que afeta o fígado.', TRUE),
('Hepatite C', 'Infecção viral crônica do fígado.', TRUE),
('Sífilis', 'Doença sexualmente transmissível causada por bactéria.', TRUE),
('Doença de Chagas', 'Infecção parasitária crônica.', TRUE),
('Diabetes', 'Distúrbio metabólico que afeta a produção de insulina.', FALSE),
('Hipertensão', 'Pressão arterial elevada.', FALSE),
('Câncer', 'Condição de proliferação anormal de células.', TRUE),
('Tuberculose', 'Infecção bacteriana que afeta principalmente os pulmões.', TRUE),
('Malária', 'Infecção parasitária transmitida por mosquitos.', TRUE);


INSERT INTO pessoa (nome, cpf, data_nascimento, telefone) VALUES
('João Silva', '11111111111', '1985-05-10', '11988887777'),
('Maria Oliveira', '22222222222', '1990-08-22', '11999996666'),
('Carlos Santos', '33333333333', '1978-02-14', '21988885555'),
('Ana Souza', '44444444444', '1995-12-01', '31977776666'),
('Pedro Lima', '55555555555', '1982-07-30', '41966665555');

INSERT INTO doador (pessoa_id, tipo_sanguineo_id, peso_kg) VALUES
(1, 1, 75.50),
(2, 2, 62.30),  
(3, 3, 80.10),  
(4, 4, 68.20), 
(5, 1, 90.00);  

INSERT INTO doador_doenca (doador_id, doenca_id) VALUES
(1, 1),  -- João Silva tem HIV
(2, 2),  -- Maria Oliveira tem Hepatite B
(3, 3),  -- Carlos Santos tem Diabetes
(4, 4),  -- Ana Souza tem Hipertensão
(5, 5);  -- Pedro Lima tem Sífilis

SELECT p.nome AS pessoa, d.nome AS doenca
FROM pessoa p
JOIN doador dr ON p.id = dr.pessoa_id
JOIN doador_doenca dd ON dr.id = dd.doador_id
JOIN doencas d ON dd.doenca_id = d.id;

