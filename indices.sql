/*INDICE SOBRE O DIA DO ANO */
CREATE INDEX INDEX_DIA_ANO ON "OLAP".DIM_DATA USING BTREE(DIA_ANO);

/*INDICE SOBRE A SEMANA DO ANO */
CREATE INDEX INDEX_SEMANA_ANO ON "OLAP".DIM_DATA USING BTREE(SEMANA_ANO);

/*INDICE SOBRE O CEP*/
CREATE INDEX INDEX_CEP ON "OLAP".DIM_LOCATION USING BTREE(CEP);

/*INDICE SOBRE O CEP DO VENDEDOR*/
CREATE INDEX INDEX_CEP_VENDEDOR ON "OLAP".DIM_VENDA USING BTREE(CEP_VENDEDOR);

/*INDICE SOBRE O CEP DO CLIENTE*/
CREATE INDEX INDEX_CEP_CLIENTE ON "OLAP".DIM_VENDA USING BTREE(CEP_CLIENTE);

/*INDICE SOBRE A CATEGORIA DO PRODUTO*/
CREATE INDEX INDEX_CAT_PRODUTO ON "OLAP".DIM_PRODUTO USING BTREE(CATEGORIA);

DROP INDEX INDEX_DIA_ANO;
DROP INDEX INDEX_SEMANA_ANO
DROP INDEX INDEX_CEP
DROP INDEX INDEX_CEP_VENDEDOR
DROP INDEX INDEX_CEP_CLIENTE
DROP INDEX INDEX_CAT_PRODUTO