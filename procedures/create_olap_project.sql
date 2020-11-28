CREATE OR REPLACE PROCEDURE "OLAP".CREATE_OLAP_PROJECT()
	LANGUAGE PLPGSQL AS
$$
DECLARE
BEGIN
	CALL "OLAP".CREATE_BS_OLAP();
	CALL "OLAP".CREATE_DIM_PRODUTO();
	CALL "OLAP".CREATE_DIM_LOCATION();
	CALL "OLAP".CREATE_DIM_DATA();
	CALL "OLAP".CREATE_DIM_VENDA();
END;$$;