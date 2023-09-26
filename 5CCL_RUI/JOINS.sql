
--1--
SELECT Imovel.cd_Imovel, Vendedor.cd_Vendedor, Vendedor.nm_Vendedor, Imovel.sg_Estado 
FROM Imovel as Imovel, Vendedor as Vendedor 
WHERE Vendedor.cd_Vendedor = Imovel.cd_Vendedor;

--2--
SELECT Comprador.cd_Comprador, nm_Comprador, Imovel.cd_Imovel, vl_Oferta 
FROM Comprador, Imovel, Oferta
WHERE Comprador.cd_Comprador = Oferta.cd_Comprador
AND Imovel.cd_Imovel = Oferta.cd_Imovel;

--3--
SELECT cd_Imovel, vl_Preco, nm_Bairro
FROM Imovel as Imovel, Bairro as Bairro
WHERE Bairro.cd_Bairro = Imovel.cd_Bairro 
AND Imovel.cd_Vendedor = 3;

--4--
SELECT * 
FROM Imovel as Imovel
INNER JOIN  Oferta as Oferta 
ON Imovel.cd_Imovel = Oferta.cd_Imovel;

--5--
SELECT * 
FROM Imovel as Imovel
LEFT JOIN  Oferta as Oferta
ON Imovel.cd_Imovel = Oferta.cd_Imovel;

--6--
SELECT * 
FROM Comprador as Comprador
INNER JOIN Oferta as Oferta
ON Comprador.cd_Comprador = Oferta.cd_Comprador;

--7--
SELECT * 
FROM Comprador as Comprador
LEFT JOIN Oferta as Oferta
ON Comprador.cd_Comprador = Oferta.cd_Comprador;

--8--
SELECT Imovel.ds_endereco, Bairro.nm_bairro, Faixa.nm_faixa 
FROM Imovel as Imovel, Bairro as Bairro, Faixa_Imovel as Faixa


--9--
SELECT Vendedor.nm_Vendedor, COUNT(Imovel.cd_Vendedor) AS total 
FROM Imovel AS Imovel 
INNER JOIN Vendedor AS Vendedor 
ON Imovel.cd_Vendedor = Vendedor.cd_Vendedor 
GROUP BY Vendedor.nm_Vendedor ORDER BY total;

--10--
SELECT MAX(vl_preco) AS Maior, 
MIN(vl_preco) as Menor, 
(MAX(vl_preco) - MIN(vl_preco)) AS Diferenca 
FROM Imovel;

--11--
SELECT Imovel.cd_Vendedor, MIN(Imovel.vl_Preco) as Menor
FROM  Imovel as Imovel 
WHERE vl_Preco > 10000 
GROUP BY cd_Vendedor;

--12--
SELECT Comprador.cd_Comprador, nm_Comprador, AVG(vl_Oferta) as Media,COUNT(Oferta.cd_Comprador) as Quantidade 
FROM Comprador AS Comprador
INNER JOIN Oferta AS Oferta
ON Comprador.cd_Comprador = Oferta.cd_Comprador
GROUP BY Comprador.cd_Comprador, Comprador.nm_Comprador;
