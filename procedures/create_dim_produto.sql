CREATE OR REPLACE PROCEDURE "OLAP".CREATE_DIM_PRODUTO()
	LANGUAGE PLPGSQL AS
$$
DECLARE
	CPRODUTO RECORD;
	CUR_PRODUTO CURSOR FOR
		SELECT PRODUTO.ID_PROD AS ID_PRODUTO,
			   PRODUTO.CATEGORIA AS CATEGORIA,
			   PRODUTO.PESO AS PESO,
			   PRODUTO.COMPRIMENTO AS COMPRIMENTO,
			   PRODUTO.ALTURA AS ALTURA,
			   PRODUTO.LARGURA AS LARGURA
		FROM "OLTP".PRODUTO;
BEGIN
	DELETE FROM "OLAP".DIM_PRODUTO;
	OPEN CUR_PRODUTO;
	LOOP
		FETCH CUR_PRODUTO INTO CPRODUTO;
		EXIT WHEN NOT FOUND;
		
		INSERT INTO "OLAP".DIM_PRODUTO(ID_PRODUTO,
								CATEGORIA,
								PESO,
								COMPRIMENTO,
								ALTURA,
								LARGURA)						  						  
					VALUES(CPRODUTO.ID_PRODUTO,
						   CPRODUTO.CATEGORIA,
						   CPRODUTO.PESO,
						   CPRODUTO.COMPRIMENTO,
						   CPRODUTO.ALTURA,
						   CPRODUTO.LARGURA);
	END LOOP;
	CLOSE CUR_PRODUTO;
END;$$;