CREATE OR REPLACE PROCEDURE "OLTP".CREATE_BS_OLTP()
	LANGUAGE PLPGSQL AS
$$
DECLARE
BEGIN
	DROP TABLE IF EXISTS "OLTP".GEOLOCATION;
	CREATE TABLE  "OLTP".Geolocation (
		CEP VARCHAR(45) ,
		LAT VARCHAR(200) ,
		LONG VARCHAR(200) ,
		CITY VARCHAR(45) ,
		UF VARCHAR(45)
	);
	DROP TABLE "OLTP".CLIENTE;
	CREATE TABLE  "OLTP".Cliente (
		ID_CLIENTE VARCHAR(200) ,
		ID_CLIENTE_UNICO VARCHAR(200),
		CEP varchar(45),
		CITY VARCHAR(45) ,
		UF VARCHAR(45)
	);

	DROP TABLE IF EXISTS "OLTP".PEDIDO;
	CREATE TABLE  "OLTP".Pedido (
		ID_PEDIDO VARCHAR(200) ,
		ID_CLIENTE VARCHAR(200),
		STATUS varchar(100),
		DAT_PEDIDO timestamp ,
		DAT_APROV timestamp ,
		DAT_ENVIO timestamp ,
		DAT_CHEGADA timestamp ,
		DATA_ESTIMADA timestamp
	);
  
	DROP TABLE IF EXISTS "OLTP".PAGAMENTO;
	CREATE TABLE  "OLTP".Pagamento (
		ID_PEDIDO VARCHAR(200) ,
		PAY_SEQ INT,
		PAY_TIP VARCHAR(45),
		PAY_INSTALLMENTS INT,
		PAY_VALUE FLOAT
	);
 
	DROP TABLE IF EXISTS "OLTP".PRODUTO;
	CREATE TABLE  "OLTP".PRODUTO (
		ID_PROD VARCHAR(200),
		CATEGORIA VARCHAR(90),
		PROD_LEN_NOME INT ,
		PROD_LEN_DESC INT ,
		PROD_QTD_FT INT,
		PESO INT,
		COMPRIMENTO INT,
		ALTURA INT,
		LARGURA INT
	);
  
	DROP TABLE IF EXISTS "OLTP".VENDEDOR;
	CREATE TABLE  "OLTP".Vendedor (
		ID_VENDEDOR VARCHAR(200),
		CEP VARCHAR(45),
		CITY VARCHAR(45) ,
		UF VARCHAR(45)
	);
  
	DROP TABLE IF EXISTS "OLTP".ITEM_PRODUTO;
	CREATE TABLE  "OLTP".Item_Produto (
		ID_PEDIDO VARCHAR(200),
		ID_ITEM_PRODUTO VARCHAR(200),
		ID_PRODUTO VARCHAR(200),
		ID_VENDEDOR VARCHAR(200),
		DATA_LIMIT TIMESTAMP,
		PRICE FLOAT,
		FRETE FLOAT
	);
END;$$;