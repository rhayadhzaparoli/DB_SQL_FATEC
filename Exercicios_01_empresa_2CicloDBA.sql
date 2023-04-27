-- Listar o nome do gerente 001 do Diretor 001 
--com os nomes de seus respectivos funcion�rios;

select nm_gerent, nm_funcionario 
from tb_gerentes, tb_funcionarios
where tb_gerentes.cd_diretor = tb_funcionarios.cd_diretor and
tb_gerentes.cd_diretor = tb_funcionarios.cd_diretor and
tb_gerentes.cd_gerente = tb_funcionarios.cd_gerente and
tb_gerentes.cd_gerente = 1 and
tb_gerentes.cd_diretor = 1



-- Idem acima, para os gerentes 2 e 3 do diretor 001;

select nm_gerent, nm_funcionario 
from tb_gerentes, tb_funcionarios
where tb_gerentes.cd_diretor = tb_funcionarios.cd_diretor and
tb_gerentes.cd_diretor = tb_funcionarios.cd_diretor and
tb_gerentes.cd_gerente = tb_funcionarios.cd_gerente and
tb_gerentes.cd_gerente in (2, 3) and
tb_gerentes.cd_diretor = 1



-- Quantos funcion�rios o gerente 001 do diretor 001 tem sob sua responsabilidade?

select count (*) 
from tb_funcionarios
where tb_funcionarios.cd_diretor = 1 and tb_funcionarios.cd_gerente = 1



-- Alterar o nome do funcion�rio 1 do gerente 1 do diretor 1, 
-- de: �funcion�rio 1 do gerente 1 do diretor 1�, p/ �nome do funcion�rio 1 alterado�;

update tb_funcionarios
set nm_funcionario = 'nome do funcion�rio 1 alterado'
where cd_diretor = 1 and cd_gerente = 1 and cd_funcionario = 1

select * from tb_funcionarios
where cd_diretor = 1 and cd_gerente = 1 and cd_funcionario = 1



-- Excluir o funcion�rio 1 do gerente 1 do diretor 1;

delete from tb_funcionarios
where cd_diretor = 1 and cd_gerente = 1 and cd_funcionario = 1


-- Incluir novamente este registro deletado acima, com os dados originais;
insert into tb_funcionarios
values (1,1,1,1, 'funcionario 1 do gerente 1 do diretor 1')



-- Listar a c�digo do gerente e respectiva quantidade 
-- de funcion�rios de cada gerente do diretor igual a 1. 
-- Obs: ser�o usados Count(*) e group by.

select cd_gerente, count (*) from tb_funcionarios
group by cd_gerente



--- Idem acima listando o resultado em ordem descrescente de qtde de funcion�rios.
select cd_gerente, count (*) from tb_funcionarios
group by cd_gerente
order by count(*) desc



-- Idem acima somente para quem tem qtde de funcion�rio maior que 2. 
-- Obs: ser�o usados Count(*) , group by e having
select cd_gerente, count (*)  RESULTADO from tb_funcionarios
group by cd_gerente
having count(*) > 2

