create table tb_estoque (cd_item int primary key, nm_item char (40), qt_min int, qt_estoque int)

create table tb_fornecedor (cd_fornecedor int primary key, nm_fornecedor char (40))

create table tb_compras (cd_compra int, dt_compra date, cd_item int, cd_fornecedor int, qt_compra int, vl_unit money, vl_total money,
primary key (cd_compra),
foreign key (cd_item) references tb_estoque (cd_item), foreign key (cd_fornecedor) references tb_fornecedor (cd_fornecedor))

insert into tb_estoque values (1,'item 1',10,15)
insert into tb_estoque values (2,'item 2',15,10)
insert into tb_estoque values (3,'item 3',20,20)
insert into tb_estoque values (4,'item 4',14,20)
insert into tb_estoque values (5,'item 5',11,9)
insert into tb_estoque values (6,'item 6',100,90)
insert into tb_estoque values (7,'item 7',10,15)
insert into tb_estoque values (8,'item 8',11,11)
insert into tb_estoque values (9,'item 9',90,100)
insert into tb_estoque values (10,'item 10',100,50)

insert into tb_fornecedor values (1,'fornecedor 1')
insert into tb_fornecedor values (2,'fornecedor 2')
insert into tb_fornecedor values (3,'fornecedor 3')
insert into tb_fornecedor values (4,'fornecedor 4')
insert into tb_fornecedor values (5,'fornecedor 5')

insert into tb_compras values (1,'11/02/2023',1,1,10,1,10)
insert into tb_compras values (2,'21/02/2023',2,1,1,10,10)
insert into tb_compras values (3,'28/02/2023',3,2,10,20,20)
insert into tb_compras values (4,'11/03/2023',4,3,10,20,200)
insert into tb_compras values (5,'13/02/2023',5,4,6,1,6)
insert into tb_compras values (6,'11/03/2023',6,5,50,2,100)
insert into tb_compras values (7,'11/03/2023',7,2,10,2,20)
insert into tb_compras values (8,'11/04/2023',8,2,11,44,484)
insert into tb_compras values (9,'11/04/2023',9,4,50,12,600)
insert into tb_compras values (10,'21/04/2023',10,4,25,14,350)
insert into tb_compras values (11,'20/04/2023',1,1,4,2,8)
insert into tb_compras values (12,'01/05/2023',6,1,40,2,80)
insert into tb_compras values (13,'02/05/2023',1,1,4,2,8)
insert into tb_compras values (14,'03/05/2023',6,1,40,2,80)
insert into tb_compras values (15,'04/05/2023',5,5,3,1,3)
insert into tb_compras values (16,'04/05/2023',10,1,25,13,325)
insert into tb_compras values (17,'05/05/2023',9,1,30,12,360)
insert into tb_compras values (18,'05/05/2023',4,1,2,33,66)
insert into tb_compras values (19,'05/05/2023',7,1,5,2,10)
insert into tb_compras values (20,'05/05/2023',9,5,10,12,120)


select * from tb_estoque
select * from tb_fornecedor
select * from tb_compras

