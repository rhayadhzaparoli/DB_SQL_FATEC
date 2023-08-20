CREATE DATABASE EX001;
USE EX001;

------------------------------------------------------------------------------
--	PROGRAM-ID. TR001
--	AUTHOR. RHAYADH ZAPAROLI
--  DATE-WRITTEN. 08/19/2023
------------------------------------------------------------------------------
--  PROF. RUI SILVESTRIN
------------------------------------------------------------------------------


CREATE TABLE Vendedor(
cd_Vendedor INTEGER NOT NULL CHECK (cd_Vendedor > 0),
nm_Vendedor VARCHAR(40) NOT NULL,
ds_Endereco VARCHAR(40) NOT NULL,
cd_CPF DECIMAL(11) UNIQUE NOT NULL,
nm_Cidade VARCHAR(20) NOT NULL, 
nm_Bairro VARCHAR(20) NOT NULL,
sg_Estado CHAR(2) NOT NULL,
cd_Telefone VARCHAR(20) NOT NULL, 
ds_Email VARCHAR(80) )


CREATE TABLE Comprador(
cd_Comprador INTEGER NOT NULL CHECK (cd_Comprador > 0),	
nm_Comprador VARCHAR(40) NOT NULL, 
ds_Endereco VARCHAR(40) NOT NULL, 
cd_CPF DECIMAL(11) UNIQUE NOT NULL, 
nm_Cidade VARCHAR(20) NOT NULL, 
nm_Bairro VARCHAR(20) NOT NULL, 
sg_Estado VARCHAR(2) NOT NULL, 
cd_Telefone VARCHAR(20) NOT NULL, 
ds_Email VARCHAR(80)  )


CREATE TABLE Imovel(
cd_Imovel INTEGER  NOT NULL CHECK (cd_Imovel > 0),
cd_Vendedor INTEGER  NOT NULL CHECK (cd_Vendedor > 0), 
cd_Bairro INTEGER NOT NULL, 
cd_Cidade INTEGER NOT NULL,
sg_Estado CHAR(2) NOT NULL,  
ds_Endereco VARCHAR(40) NOT NULL,
qt_AreaUtil DECIMAL(10,2), 
qt_AreaTotal DECIMAL(10,2), 
ds_Imovel VARCHAR(300) NOT NULL,
vl_preco MONEY NOT NULL,  
qt_Ofertas INTEGER, 
ic_Vendido CHAR(1), 
dt_Lancto DATE, 
qt_ImovelIndicado INTEGER)


CREATE TABLE Oferta(
cd_Comprador INTEGER  NOT NULL CHECK (cd_Comprador > 0),
cd_Imovel INTEGER  NOT NULL CHECK (cd_Imovel > 0),
vl_Oferta MONEY,
dt_Oferta DATE)



CREATE TABLE Estado(
sg_Estado CHAR(2) NOT NULL, 
nm_Estado varchar(20) NOT NULL)


CREATE TABLE Cidade(
cd_Cidade INTEGER  NOT NULL, 
sg_Estado CHAR(2)  NOT NULL,
nm_Cidade VARCHAR(20) NOT NULL)



CREATE TABLE Bairro(
cd_Bairro INTEGER  NOT NULL,
cd_Cidade INTEGER  NOT NULL,
sg_Estado CHAR(2)  NOT NULL,
nm_Bairro VARCHAR(20) NOT NULL)


CREATE TABLE Faixa_Imovel(
cd_Faixa INTEGER  NOT NULL,
nm_Faixa VARCHAR(30), 
vl_Maximo MONEY, 
vl_Minimo MONEY NOT NULL CHECK (vl_Minimo > 0 ))

--------------------------------------------------------
---------------- DROP TABLES -------------------

DROP TABLE Faixa_Imovel
DROP TABLE Bairro
DROP TABLE Cidade
DROP TABLE Estado
DROP TABLE Oferta
DROP TABLE Imovel
DROP TABLE Comprador
DROP TABLE Vendedor

-----------------------------------------------------------------
---------------- ALTER TABLES E ADD PKs E FKs -------------------


ALTER TABLE Vendedor
ADD PRIMARY KEY (cd_Vendedor);

ALTER TABLE Comprador
ADD PRIMARY KEY (cd_Comprador);

ALTER TABLE Imovel
ADD PRIMARY KEY (cd_Imovel);

ALTER TABLE Oferta
ADD FOREIGN KEY (cd_Imovel) REFERENCES Imovel(cd_Imovel);
ALTER TABLE Oferta
ADD FOREIGN KEY (cd_Comprador) REFERENCES Comprador(cd_Comprador);

ALTER TABLE Estado
ADD PRIMARY KEY (sg_Estado);

ALTER TABLE Cidade
ADD PRIMARY KEY (cd_Cidade);
ALTER TABLE Cidade
ADD FOREIGN KEY (sg_Estado) REFERENCES Estado(sg_Estado);

ALTER TABLE Bairro
ADD PRIMARY KEY (cd_Bairro);
ALTER TABLE Bairro
ADD FOREIGN KEY (cd_Cidade) REFERENCES Cidade(cd_Cidade);
ALTER TABLE Bairro
ADD FOREIGN KEY (sg_Estado) REFERENCES Estado(sg_Estado);

ALTER TABLE Faixa_Imovel
ADD PRIMARY KEY (cd_Faixa);
--------------------------------------------------------
---------------- CONSULTA DE TABELAS -------------------

SELECT * FROM Vendedor 
SELECT * FROM Comprador 
SELECT * FROM Imovel
SELECT * FROM Oferta 
SELECT * FROM Estado 
SELECT * FROM Cidade 
SELECT * FROM Bairro 
SELECT * FROM Faixa_Imovel


----------------------------------------------------------------------------
---------------------------- CONSULTA DE PKs E FKs -------------------------

SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'PRIMARY KEY' AND table_name  = 'Vendedor';

SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'PRIMARY KEY' AND table_name  = 'Comprador';

SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'PRIMARY KEY' AND table_name  = 'Imovel';

SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY' AND table_name  = 'Oferta';

SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'PRIMARY KEY' AND table_name  = 'Estado';

SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'PRIMARY KEY' AND table_name  = 'Cidade';
SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY' AND table_name  = 'Cidade';

SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'PRIMARY KEY' AND table_name  = 'Bairro';
SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'FOREIGN KEY' AND table_name  = 'Bairro';

SELECT *
FROM information_schema.table_constraints
WHERE constraint_type = 'PRIMARY KEY' AND table_name  = 'Faixa_Imovel';

