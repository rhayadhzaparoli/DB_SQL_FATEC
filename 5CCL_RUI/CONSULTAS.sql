
SELECT cd_Comprador, nm_Comprador, ds_Email FROM Comprador;


SELECT cd_Vendedor, nm_Vendedor, ds_Email FROM Vendedor ORDER BY  nm_Vendedor DESC;


SELECT cd_Imovel, cd_Vendedor, vl_Preco FROM Imovel where cd_Vendedor = 2;


SELECT cd_Imovel, cd_Vendedor, vl_Preco, sg_Estado FROM Imovel WHERE vl_Preco < 150000 AND sg_Estado = 'RJ';


SELECT cd_Imovel, cd_Vendedor, vl_Preco, sg_Estado FROM Imovel WHERE vl_Preco < 150000 AND cd_Vendedor != 2;


SELECT  cd_Comprador, nm_Comprador, ds_Endereco, sg_Estado FROM Comprador WHERE sg_Estado IS NULL;


SELECT * FROM Oferta WHERE vl_Oferta BETWEEN 100000 AND 150000;


SELECT * FROM Oferta WHERE dt_Oferta BETWEEN '01/01/2009' AND '01/03/2009';


SELECT nm_Vendedor FROM Vendedor WHERE nm_Vendedor LIKE 'M%';


SELECT nm_Vendedor FROM Vendedor WHERE nm_Vendedor LIKE '_A%';


SELECT nm_Comprador FROM Comprador WHERE nm_Comprador LIKE '%U%';


SELECT * FROM Imovel WHERE cd_Imovel = 2 OR cd_Imovel = 3 ORDER BY ds_Endereco ASC;


SELECT * FROM Oferta WHERE cd_Imovel = 2 OR cd_Imovel = 3 AND vl_Oferta > 140000 ORDER BY dt_Oferta DESC;


SELECT * FROM Imovel WHERE (vl_Preco >=110000 AND vl_Preco <=200000) OR cd_Vendedor = 4 ORDER BY qt_AreaUtil ASC;


SELECT MAX(vl_Oferta) AS 'VL MAX', MIN(vl_Oferta) AS 'VL MIN', AVG(vl_Oferta) AS 'VL MEDIO' from Oferta;


SELECT MAX(vl_Preco) AS 'MAIOR', MIN(vl_Preco) AS 'MENOR', COUNT(vl_Preco) AS 'TOTAL', AVG(vl_Preco) AS 'MEDIA' from Imovel;


SELECT SUM(vl_Oferta) AS 'TOTAL DE OFERTAS' from Oferta WHERE year(dt_Oferta) BETWEEN 2008 AND 2010; 