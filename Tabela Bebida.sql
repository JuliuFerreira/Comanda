SELECT be.id, ti.descricao as Tipo_de_bebida, be.descricao as Bebida
from bebida as be

inner join tipo as ti on be.id_tipo = ti.id;

INSERT INTO bebida (id_tipo, descricao) value (1,'Coca-Cola');
INSERT INTO bebida (id_tipo, descricao) value (1,'Fanta');
INSERT INTO bebida (id_tipo, descricao) value (1,'Guaraná');
INSERT INTO bebida (id_tipo, descricao) value (6,'Água com gás');
INSERT INTO bebida (id_tipo, descricao) value (5,'Suco de laranja');
INSERT INTO bebida (id_tipo, descricao) value (3,'Cerveja Brahma');
INSERT INTO bebida (id_tipo, descricao) value (3,'Cerveja Heineken');
INSERT INTO bebida (id_tipo, descricao) value (3, 'Cerveja Heineken zero');
INSERT INTO bebida (id_tipo, descricao) value (4, 'Mojito');
INSERT INTO bebida (id_tipo, descricao) value (4,'caipirinha de vinho');

UPDATE bebida SET descricao = 'Coca Cola' WHERE id = 11;
UPDATE bebida SET descricao = 'Bohemia' WHERE id = 18;
UPDATE bebida SET descricao = 'Brahma' WHERE id = 16;
UPDATE bebida SET descricao = 'Heineken' WHERE id = 17;
UPDATE bebida SET descricao = 'Soda Limonada' WHERE id = 21;

UPDATE bebida SET descricao = 'Caipirinha de Vodka' WHERE id = 19;

DELIMITER //

CREATE PROCEDURE insert_bebida(
  IN descricao VARCHAR(45),
  IN id_tipo INT
)
BEGIN
  INSERT INTO bebida(descricao, id_tipo)
  VALUES(descricao, id_tipo);
END //

DELIMITER ;

CALL insert_bebida('Soda limonada', 1);


CALL insert_bebida('Brahma', 1);


DELIMITER $$
CREATE TRIGGER tr_bebida_insert
BEFORE INSERT ON bebida
FOR EACH ROW
BEGIN
  IF EXISTS(SELECT * FROM bebida WHERE descricao = NEW.descricao) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ESSA BEBIDA JA EXISTE EM NOSSO REGISTRO';
  END IF;
END$$
DELIMITER ;
