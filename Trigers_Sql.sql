ALTER TABLE doador
ADD COLUMN data_ultima_doacao DATE NULL;


DELIMITER $$

CREATE TRIGGER trg_atualiza_data_ultima_doacao
AFTER INSERT ON doacao
FOR EACH ROW
BEGIN
  UPDATE doador
  SET data_ultima_doacao = NEW.data_coleta
  WHERE id = NEW.doador_id;
END $$

DELIMITER ;
