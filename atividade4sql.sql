-- inserindo doações

INSERT INTO pessoa (nome, cpf, data_nascimento, telefone) VALUES
('Lucas Pereira', '93996236596', '1987-03-15', '11912345678'),
('Fernanda Costa', '66987552596', '1992-11-02', '21987654321'),
('Rafael Lima', '69526566996', '1980-07-25', '31955554444');

INSERT INTO doador (pessoa_id, tipo_sanguineo_id, peso_kg) VALUES
(6, 1, 72.5),  -- Lucas Pereira
(7, 2, 65.0),  -- Fernanda Costa
(8, 3, 85.2);  -- Rafael Lima

INSERT INTO doacao (doador_id, data_coleta, volume_ml, observacoes) VALUES
(6, '2025-01-10 09:30:00', 450, 'Primeira doação de Lucas'),
(6, '2025-03-05 10:00:00', 500, 'Segunda doação de Lucas'),
(7, '2025-02-15 14:20:00', 470, 'Primeira doação de Fernanda'),
(7, '2025-06-01 08:50:00', 480, 'Segunda doação de Fernanda'),
(7, '2025-08-25 11:00:00', 490, 'Terceira doação de Fernanda'),
(8, '2025-04-12 09:10:00', 460, 'Primeira doação de Rafael');



 -- selects
 
SELECT p.nome AS pessoa, COUNT(d.id) AS qtd_doacoes
FROM pessoa p
JOIN doador dr ON p.id = dr.pessoa_id
JOIN doacao d ON dr.id = d.doador_id
GROUP BY p.nome
ORDER BY qtd_doacoes ASC;

SELECT ts.abo, ts.rh, COUNT(d.id) AS qtd_doacoes
FROM tipo_sanguineo ts
JOIN doador dr ON ts.id = dr.tipo_sanguineo_id
JOIN doacao d ON dr.id = d.doador_id
GROUP BY ts.abo, ts.rh
ORDER BY qtd_doacoes ASC;
