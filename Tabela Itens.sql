SELECT it.id, be.descricao as Bebida, co.descricao as Comida
from itens as it

inner join bebida as be on it.id_bebida = be.id
inner join comida as co on it.id_comida = co.id;

insert into itens (id_bebida, id_comida) values (11, 1);
insert into itens (id_bebida, id_comida) values (17, 3);
insert into itens (id_bebida, id_comida) values (17, 3);
insert into itens (id_bebida, id_comida) values (13, 4);
insert into itens (id_bebida, id_comida) values (14, 6);
insert into itens (id_bebida, id_comida) values (19, 4);
insert into itens (id_bebida, id_comida) values (14, 4);


