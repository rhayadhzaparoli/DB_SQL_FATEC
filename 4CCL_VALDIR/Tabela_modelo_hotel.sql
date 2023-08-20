-- tabela hotel --
create table tb_hotel  (cd_hotel int primary key, nm_hotel char (40))

insert into tb_hotel values ('1', 'hotel 1')
insert into tb_hotel values ('2', 'hotel 2')

-- tabela quartos do hotel --
create table tb_quartos (cd_hotel int, cd_quarto int, nm_quarto char (40), vl_diaria money, primary key (cd_hotel,cd_quarto),
 foreign key (cd_hotel) references tb_hotel (cd_hotel))

insert into tb_quartos values (1,100,'quarto 100 do hotel 1',300)
insert into tb_quartos values (1,200,'quarto 200 do hotel 1',250)
insert into tb_quartos values (1,300,'quarto 300 do hotel 1',600)
insert into tb_quartos values (1,400,'quarto 400 do hotel 1',150)
insert into tb_quartos values (1,500,'quarto 500 do hotel 1',300)
insert into tb_quartos values (2,10,'quarto 10 do hotel 2',400)
insert into tb_quartos values (2,20,'quarto 20 do hotel 2',300)
insert into tb_quartos values (2,30,'quarto 30 do hotel 2',490)
insert into tb_quartos values (2,40,'quarto 40 do hotel 2',600)
insert into tb_quartos values (2,50,'quarto 50 do hotel 2',200)

-- tabela hospedes --
create table tb_hospedes (cd_hospede int primary key, nm_hospede char (40))
insert into tb_hospedes values (1,'hospede 1')
insert into tb_hospedes values (2,'hospede 2')
insert into tb_hospedes values (3,'hospede 3')
insert into tb_hospedes values (4,'hospede 4')
insert into tb_hospedes values (5,'hospede 5')

-- tabela hóspedagem --

create table tb_hospedagem (cd_hospede int, cd_hotel int, cd_quarto int, dt_entrada date, dt_saida date, qt_diarias int, primary key (cd_hospede,cd_hotel, cd_quarto),
 foreign key (cd_hospede) references tb_hospedes (cd_hospede),
 foreign key (cd_hotel) references tb_hotel (cd_hotel),
 foreign key (cd_hotel,cd_quarto) references tb_quartos (cd_hotel, cd_quarto))

 insert into tb_hospedagem values (1,1,100,'20/04/2023','25/04/2023',4)
 insert into tb_hospedagem values (2,1,200,'21/04/2023','25/04/2023',3)
 insert into tb_hospedagem values (3,1,300,'23/04/2023','25/04/2023',2)
 insert into tb_hospedagem values (4,2,10,'10/04/2023','25/04/2023',15)
 insert into tb_hospedagem values (5,2,20,'1/04/2023','25/04/2023',25)

 select * from tb_hotel
 select * from tb_quartos
 select * from tb_hospedes
 select * from tb_hospedagem

