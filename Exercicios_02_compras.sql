-- 1)  Qual o valor total de todas as compras realizadas com o fornecedor 1?

select sum(vl_total) from tb_compras where cd_fornecedor = 1


-- 2) Quantas compras foram realizadas com o fornecedor 4?

select count (*) from tb_compras where cd_fornecedor = 4


-- 3) Qual o valor da compra de menor valor?

select vl_total from tb_compras where vl_total = (select min(vl_total) from tb_compras)



-- 4) Qual o nome do fornecedor com quem foi realizada a compra de maior valor?

select nm_fornecedor from tb_fornecedor,tb_compras
where vl_total = (select max(vl_total) from tb_compras)
and tb_fornecedor.cd_fornecedor = tb_compras.cd_fornecedor


-- 5) Listar  o nome do item, nome do fornecedor, código da compra, data da compra,
--    Valor da compra para todas as compras realizadas.

select nm_item, nm_fornecedor, cd_compra, dt_compra, vl_total 
from tb_compras, tb_estoque, tb_fornecedor 
where tb_compras.cd_fornecedor = tb_fornecedor.cd_fornecedor 
and tb_compras.cd_item = tb_estoque.cd_item



-- 6) Idem acima somente para quem tem o valor da compra acima da média  
--    de todas as compras.

select distinct nm_fornecedor from tb_fornecedor,tb_compras
where vl_total > (select avg(vl_total) from tb_compras)
and tb_fornecedor.cd_fornecedor = tb_compras.cd_fornecedor


select nm_item, nm_fornecedor, cd_compra, dt_compra, vl_total 
from tb_compras, tb_estoque, tb_fornecedor 
where vl_total > (select avg(vl_total) from tb_compras) 



-- 7) Qual o menor valor, o maior valor e o valor médio das compras?

select min(vl_total) as menor, max(vl_total) as maior, avg(vl_total) as media from tb_compras



-- 8) Listar o código do item , nome do item, qtd mínima e qtd em estoque de todos
--    os itens cujo estoque esteja abaixo do estoque mínimo.

select cd_item, nm_item, qt_min, qt_estoque
from tb_estoque 
where qt_estoque < qt_min



-- 9) Liste a somatória dos valores das compras agrupadas por código de fornecedor.

select sum(vl_total), cd_fornecedor from tb_compras group by cd_fornecedor



-- 10) Listar todas as informações da tabela tb_compras em ordem descendente de valor total.

select * from tb_compras order by vl_total desc


