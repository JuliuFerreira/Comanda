SELECT co.id, ti.descricao as Tipo_de_Comida, co.descricao as Comida

from comida as co

inner join tipo as ti on co.id_tipo = ti.id;

insert into comida (id_tipo, descricao) values (7,'Hamburger');
insert into comida (id_tipo, descricao) values (7,'Misto quente');
insert into comida (id_tipo, descricao) values (8, 'Camarão à milanesa');
insert into comida (id_tipo, descricao) values (8, 'Mista');
insert into comida (id_tipo, descricao) values (9, 'Batata frita');
insert into comida (id_tipo, descricao) values (9, 'Polenta frita');
insert into comida (id_tipo, descricao) values (9, 'aipim frito');


insert into comida (id_tipo, descricao) values (9, 'aipim frito');

select * FROM comida WHERE id_tipo = 7;
select * FROM comida WHERE id_tipo = 8;

DELIMITER $$
CREATE TRIGGER tr_comida_insert
BEFORE INSERT ON comida
FOR EACH ROW
BEGIN
  IF EXISTS(SELECT * FROM comida WHERE descricao = NEW.descricao) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ESTA COMIDA JÁ EXISTE EM NOSSO REGISTRO';
  END IF;
END$$
DELIMITER ;
