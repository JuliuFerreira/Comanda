create schema comandas default charset utf8;

use comandas;
CREATE TABLE tipo (id int primary key auto_increment not null,
descricao varchar(45));

CREATE TABLE comida (id int primary key auto_increment not null,
id_tipo int not null,
constraint fk_comida_tipo foreign key (id_tipo) references tipo(id),
descricao varchar(45)
);

CREATE TABLE bebida (id int primary key auto_increment not null,
id_tipo int,
constraint fk_bebida_tipo foreign key (id_tipo) references tipo(id),
descricao varchar(45)
);

CREATE TABLE itens (id int primary key auto_increment not null,
id_bebida int,
id_comida int,
constraint fk_itens_comida foreign key (id_comida) references comida(id),
constraint fk_itens_bebida foreign key (id_bebida) references bebida(id)
);

CREATE TABLE comanda (id int primary key not null);

CREATE TABLE comanda_itens (id int primary key auto_increment not null,
id_comanda int not null,
id_itens int,
constraint fk_comanda_itens_comanda foreign key (id_comanda) references comanda(id),
constraint fk_comanda_itens_itens foreign key (id_itens) references itens(id)
);
