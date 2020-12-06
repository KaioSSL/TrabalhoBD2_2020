SELECT PRODUTO.CATEGORIA AS CATEGORIA_PRODUTO,
	   DATA_VENDA.DIA_MES DIA_DO_MES_COMPRA,
	   DATA_VENDA.MES MES_COMPRA,
	   DATA_VENDA.ANO ANO_COMPRA,
	   CLIENTE_LOCAL.CIDADE CIDADE_CLIENTE,
	   CLIENTE_LOCAL.UF ESTADO_CLIENTE,
	   VENDEDOR_LOCAL.CIDADE CIDADE_VENDEDOR,
	   VENDEDOR_LOCAL.UF ESTADO_VENDEDOR,
	   DIM_VENDA.VALOR_VENDA	   
FROM "OLAP".DIM_VENDA LEFT JOIN 
	 "OLAP".DIM_PRODUTO PRODUTO ON (PRODUTO.ID_PRODUTO = DIM_VENDA.ID_PRODUTO) LEFT JOIN
	 "OLAP".DIM_LOCATION CLIENTE_LOCAL ON (CLIENTE_LOCAL.CEP = DIM_VENDA.CEP_CLIENTE) LEFT JOIN
	 "OLAP".DIM_LOCATION VENDEDOR_LOCAL ON (VENDEDOR_LOCAL.CEP = DIM_VENDA.CEP_VENDEDOR) LEFT JOIN
	 "OLAP".DIM_DATA DATA_VENDA ON (DATA_VENDA.ID_DATA = DIM_VENDA.DATA_COMPRA)
ORDER BY CATEGORIA_PRODUTO,
		 ESTADO_CLIENTE