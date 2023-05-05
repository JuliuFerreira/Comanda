SELECT ci.id AS pedido, co.id AS comanda, ca.descricao AS Comida, be.descricao AS Bebida
FROM comanda_itens ci

LEFT JOIN comanda co ON ci.id_comanda = co.id
LEFT JOIN itens i ON ci.id_itens = i.id
LEFT JOIN comida ca ON i.id_comida = ca.id
LEFT JOIN bebida be ON i.id_bebida = be.id; 

insert into comanda_itens (id_comanda, id_itens) values (1, 2);
insert into comanda_itens (id_comanda, id_itens) values (2, 3);
insert into comanda_itens (id_comanda, id_itens) values (3, 4);
insert into comanda_itens (id_comanda, id_itens) values (4, 5);
insert into comanda_itens (id_comanda, id_itens) values (1, 3);
insert into comanda_itens (id_comanda, id_itens) values (2, 4);

delete FROM comanda_itens WHERE id = 1;
delete FROM comanda_itens WHERE id = 2;
delete FROM comanda_itens WHERE id = 3;
delete FROM comanda_itens WHERE id = 4;
delete FROM comanda_itens WHERE id = 5;

SELECT c.id AS Comanda, i.id AS Itens, b.descricao AS bebida, co.descricao AS comida
FROM comanda_itens c_i
JOIN comanda c ON c_i.id_comanda = c.id
JOIN itens i ON c_i.id_itens = i.id
LEFT JOIN bebida b ON i.id_bebida = b.id
LEFT JOIN comida co ON i.id_comida = co.id
WHERE c.id = 2;

