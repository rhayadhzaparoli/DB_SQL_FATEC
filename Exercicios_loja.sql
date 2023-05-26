-- listar o nome do cliente,código da fatura e valor de todas as faturas vencidas e não pagas
                
    select nm_cliente, cd_fatura, vl_fatura from tb_cliente, tb_faturas
           where tb_cliente.cd_cliente = tb_faturas.cd_cliente
           and   cd_pagmto = 2

-- listar o nome do cliente e valor da fatura com o maior valor de fatura ?
     
     select nm_cliente, vl_fatura from tb_cliente, tb_faturas
            where tb_cliente.cd_cliente = tb_faturas.cd_cliente
            and    vl_fatura = (select max(vl_fatura) from tb_faturas)

--- listar os valores da base de fatura agrupados por nome do cliente

     select nm_cliente, sum(vl_fatura) from tb_cliente, tb_faturas
            where tb_cliente.cd_cliente = tb_faturas.cd_cliente
            group by nm_cliente

---- idem acima somente para as faturas pagas
 select nm_cliente, sum(vl_fatura) from tb_cliente, tb_faturas
            where tb_cliente.cd_cliente = tb_faturas.cd_cliente
            and cd_pagmto = 0
            group by nm_cliente


--- Qual o valor da maior fatura, menor fatura, média dos valores e somatória dos valores

select max(vl_fatura), min(vl_fatura), avg(vl_fatura),sum(vl_fatura) from tb_faturas

-- idem acima identificando os campos de resultados

select max(vl_fatura) as maior, min(vl_fatura) as menor, 
       avg(vl_fatura) as média,sum(vl_fatura) as somatória from tb_faturas

-- Qual o código e nome do item que não consta na base de fatura?

select tb_item.cd_item, nm_item from tb_item 
where tb_item.cd_item not in 
(select tb_item.cd_item tb_faturas from tb_item,tb_faturas 
 where tb_item.cd_item = tb_faturas.cd_item