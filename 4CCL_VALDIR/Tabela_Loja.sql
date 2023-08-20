--- criação da tabela de status das parcela ---
create table tb_status (cd_pgmto int primary key, nm_status char (30))

insert into tb_status values (0,'a vencer')
insert into tb_status values (1,'pago')
insert into tb_status values (2,'vencido e não pago')

select * from tb_status

--- criação da tabela clientes ----
create table tb_cliente (cd_cliente int primary key, nm_cliente char (30))

insert into tb_cliente values (1,'cliente 1')
insert into tb_cliente values (2,'cliente 2')
insert into tb_cliente values (3,'cliente 3')
insert into tb_cliente values (4,'cliente 4')
insert into tb_cliente values (5,'cliente 5')

select * from tb_cliente

--- criação da tabela item ---
create table tb_item (cd_item int primary key, nm_item char (30))

insert into   tb_item values (1, 'item 1')
insert into   tb_item values (2, 'item 2')
insert into   tb_item values (3, 'item 3')
insert into   tb_item values (4, 'item 4')
insert into   tb_item values (5, 'item 5')
insert into   tb_item values (6, 'item 6')
insert into   tb_item values (7, 'item 7')
insert into   tb_item values (8, 'item 8')
insert into   tb_item values (9, 'item 9')
insert into   tb_item values (10, 'item 10')

select * from tb_item

--- criação da tabela faturas --
drop table tb_faturas

create table tb_faturas(cd_fatura int primary key, 
                        cd_cliente int foreign key references tb_cliente (cd_cliente),
                        cd_item int foreign key references tb_item(cd_item),
                        vl_fatura money,
                        cd_pagmto int foreign key references tb_status (cd_pgmto))

insert into tb_faturas values (1,1,1,100,0)
insert into tb_faturas values (2,1,2,110,0)
insert into tb_faturas values (3,2,1,121,1)
insert into tb_faturas values (4,1,2,133.10,1)
insert into tb_faturas values (5,2,2,146.41,1)
insert into tb_faturas values (6,2,3,161.05,1)
insert into tb_faturas values (7,2,4,177.16,0)
insert into tb_faturas values (8,3,4,194.87,0)
insert into tb_faturas values (9,3,5,214.36,1)
insert into tb_faturas values (10,1,6,235.79,1)
insert into tb_faturas values (11,4,7,259.37,1)
insert into tb_faturas values (12,4,7,259.37,2)
insert into tb_faturas values (13,2,8,313.84,2)
insert into tb_faturas values (14,2,8,345.23,2)
insert into tb_faturas values (15,1,1,379.75,1)
insert into tb_faturas values (16,4,9,417.72,1)
insert into tb_faturas values (17,4,7,459.50,0)
insert into tb_faturas values (18,3,8,505.45,1)


select * from tb_faturas
select * from tb_item
select * from tb_cliente
select * from tb_status