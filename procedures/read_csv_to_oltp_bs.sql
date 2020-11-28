CREATE OR REPLACE PROCEDURE "OLTP".READ_CSV_TO_OLTP_BS()
	LANGUAGE PLPGSQL AS
$$
DECLARE
BEGIN
	DELETE FROM "OLTP".GEOLOCATION;
	COPY "OLTP".Geolocation FROM 'C:\Users\kaiof\Desktop\2020_IFES\BD2\Trabalho\Base OLIST\olist_geolocation_dataset.csv' USING DELIMITERS ',' CSV HEADER;
	DELETE FROM "OLTP".CLIENTE;
	COPY "OLTP".Cliente FROM 'C:\Users\kaiof\Desktop\2020_IFES\BD2\Trabalho\Base OLIST\olist_customers_dataset.csv' USING DELIMITERS ',' CSV HEADER;
	DELETE FROM "OLTP".PEDIDO;
	COPY "OLTP".Pedido FROM 'C:\Users\kaiof\Desktop\2020_IFES\BD2\Trabalho\Base OLIST\olist_orders_dataset.csv' USING DELIMITERS ',' CSV HEADER;
	DELETE FROM "OLTP".PAGAMENTO;
	COPY "OLTP".Pagamento FROM 'C:\Users\kaiof\Desktop\2020_IFES\BD2\Trabalho\Base OLIST\olist_order_payments_dataset.csv' USING DELIMITERS ',' CSV HEADER;
	DELETE FROM "OLTP".PRODUTO;
	COPY "OLTP".Produto FROM 'C:\Users\kaiof\Desktop\2020_IFES\BD2\Trabalho\Base OLIST\olist_products_dataset.csv' USING DELIMITERS ',' CSV HEADER;
	DELETE FROM "OLTP".VENDEDOR;
	COPY "OLTP".Vendedor FROM 'C:\Users\kaiof\Desktop\2020_IFES\BD2\Trabalho\Base OLIST\olist_sellers_dataset.csv' USING DELIMITERS ',' CSV HEADER;
	DELETE FROM "OLTP".ITEM_PRODUTO;
	COPY "OLTP".Item_produto FROM 'C:\Users\kaiof\Desktop\2020_IFES\BD2\Trabalho\Base OLIST\olist_order_items_dataset.csv' USING DELIMITERS ',' CSV HEADER;
END;$$;