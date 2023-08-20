-- CRIACAO DA TABELA RELACIONAL (TB_HOTEL PARA TB_QUARTOS PARA TB_HOSPEDAGEM PARA TB_HOSPEDES)
drop table tb_relacional
create table tb_relacional (cd_hotel int, cd_quarto int, cd_hospede int, cd_hospedagem int primary key (cd_hospede,cd_hotel, cd_quarto, cd_hospedagem),
�foreign key (cd_hospede) references tb_hospedes (cd_hospede),
�foreign key (cd_hotel) references tb_hotel (cd_hotel),
�foreign key (cd_hotel,cd_quarto) references tb_quartos (cd_hotel, cd_quarto))

select * from tb_relacional

-- 1- Quais os nomes do hoteis , os quartos e valores da di�ria cujo valor de di�ria seja o mais elevado da base ?

select nm_hotel, nm_quarto, vl_diaria from tb_hotel, tb_quartos 
where vl_diaria = (select max(vl_diaria) from tb_quartos) 
and tb_hotel.cd_hotel = tb_quartos.cd_hotel


�-- 2- Quais os nomes �hoteis, quartos e valores das di�rias cujas di�rias estejam acima da m�dia das di�rias da base ?

select nm_hotel, nm_quarto, vl_diaria from tb_hotel, tb_quartos
where vl_diaria > (select avg(vl_diaria) from tb_quartos)
and tb_hotel.cd_hotel = tb_quartos.cd_hotel


�-- 3- Quais os nomes dos h�spedes, em qual hoteis e quartos est�o hospedados cuja qtde de di�rias esteja abaixo da m�dia dos registros de hospedagem ?

�select nm_hospede, nm_hotel, qt_diarias from tb_hotel, tb_hospedes, tb_hospedagem�
�where qt_diarias < �(select avg(qt_diarias) from tb_hospedagem)
�and tb_hotel.cd_hotel = tb_hospedagem.cd_hotel
�and tb_hospedes.cd_hospede = tb_hospedagem.cd_hospede


�-- 4- Quais os nomes dos hot�is, hospedes e quartos, qtde de di�ria e valor total da hospedagem contidos na base de hospedagem ?

�select nm_hotel, nm_hospede, nm_quarto, vl_diaria,qt_diarias, (vl_diaria * qt_diarias) as valor_total from tb_hotel, tb_quartos, tb_hospedes, tb_hospedagem
�where tb_hotel.cd_hotel = tb_hospedagem.cd_hotel
�and � tb_hospedes.cd_hospede = tb_hospedagem.cd_hospede
�and � tb_quartos.cd_quarto = tb_hospedagem.cd_quarto

� -- 5- Qtos h�spedes est�o contidos na base de hospedagem?

select count (*) from tb_hospedes


�-- 6- Quais nos nomes dos hot�is, quartos �e h�spedes contidos na base de hospedagem, organizados em ordem descendente de qtde de di�rias ?

�select nm_hotel, nm_quarto, nm_hospede, qt_diarias from tb_hotel, tb_quartos, tb_hospedes, tb_hospedagem
�where �tb_hotel.cd_hotel = tb_hospedagem.cd_hotel
�and � tb_hospedes.cd_hospede = tb_hospedagem.cd_hospede
�and � tb_quartos.cd_quarto = tb_hospedagem.cd_quarto
�order by qt_diarias desc

�-- 7- Qual o valor total das hospedagens, agrupados por nome de hotel ?

select tb_hospedagem.cd_hotel, sum (vl_diaria * qt_diarias) as total from �tb_hotel, tb_hospedagem , tb_quartos, tb_hospedes
where tb_hotel.cd_hotel = tb_quartos.cd_hotel
and tb_quartos.cd_quarto = tb_hospedagem.cd_quarto
and tb_hospedagem.cd_hospede = tb_hospedes.cd_hospede
group by tb_hospedagem.cd_hotel

� --8- Quais os hoteis e quartos que est�o na base de hospedagem ?

select nm_hotel, nm_quarto � from tb_hotel, tb_quartos, tb_hospedagem
where �tb_hotel.cd_hotel = tb_hospedagem.cd_hotel
and � tb_quartos.cd_quarto = tb_hospedagem.cd_quarto

� --9- Quais os hoteis e quartos que est�o dispon�veis para ocupa��o, ou seja, existem na base de quartos mas n�o existe na base de hospedagem ?

select nm_hotel, nm_quarto � from tb_hotel, tb_quartos�
�where � �tb_hotel.cd_hotel = tb_quartos.cd_hotel
� and tb_quartos.cd_quarto � not in �(select tb_quartos.cd_quarto from tb_quartos, tb_hospedagem,tb_hotel �where�
tb_quartos.cd_quarto = tb_hospedagem.cd_quarto
and tb_hotel.cd_hotel = tb_hospedagem.cd_hotel)