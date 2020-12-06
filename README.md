# TrabalhoBD2_2020


# TRABALHO 01 : OlistProject
Trabalho desenvolvido durante a disciplina de BD2
 
# Sumário

### 1	COMPONENTES<br>
Kaio Fabio - 20182BSI0485<br>


### 2	Escolha da base de dados e explicação sobre informações relacionadas <br>
Base escolhida do Site Kaggle.

Este conjunto de dados foi generosamente fornecido pela Olist, a maior loja de departamentos no mercado brasileiro. A Olist conecta pequenas empresas de todo o Brasil a canais sem complicações e com um único contrato. Esses comerciantes podem vender seus produtos através da Olist Store e enviá-los diretamente aos clientes usando os parceiros de logística Olist.
Depois que um cliente compra o produto na Olist Store, um vendedor é notificado para atender a esse pedido. Assim que o cliente recebe o produto, ou a data estimada de entrega está vencida, o cliente recebe por e-mail uma pesquisa de satisfação onde pode dar uma nota sobre a experiência de compra e escrever alguns comentários.

Brazilian E-Commerce Public Dataset by Olist -URL https://www.kaggle.com/olistbr/brazilian-ecommerce<br>

### 3 Fast Imersion Canvas <br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/Fast%20Immersion%20Canvas%20-%20E-commerce%20Brazil.png)<br>
Link: https://docs.google.com/presentation/d/18WK_3QXJ4UdTJVGzuaaDKdUvGlMRrjsr4doKVj6fWzc/edit?usp=sharing<br>

### 4 Fast Modelling Canvas<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/AR_03b%20-%20Fast%20Modelling%20Canvas_AL.png)<br>
Link : https://docs.google.com/presentation/d/1JTXSsGTSYdnxfYHVpME0qgovd8wHGXyNNH1Yf-liFMQ/edit?usp=sharing
### 5 Fast EDA Canvas<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/AR_04%20-%20Fast%20EDA%20Canvas_AL.png)<br>
Colab Link : https://colab.research.google.com/drive/1kNmaxnsgNglEAneO0hCMf0ngMbJORnbG?usp=sharing<br>
### 6 Mapa de ETL<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/AR_0e%20-%20Fast%20ETL%20Canvas_AL.png)<br>
<br>Link da Planilha: https://docs.google.com/spreadsheets/d/1APkSqI-4_jt3F6JlaoGgvXtzEgFFKbVurv4whNugi6Q/edit?usp=sharing<br>
### 7	MODELO CONCEITUAL, LOGICO E FISICO - OLTP<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/OLTP-CONCEITUAL.png)<br>

### 8	MODELO CONCEITUAL, LOGICO E FISICO - OLAP<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/OLAP-CONCEITUAL.png)<br>

### 9 CARGA DE DADOS,ANÁLISE DE METADADOS,ESTATISTICAS, SIZING E INDEXAÇÃO<br>
#### 9.1	CARGA DE DADOS A ANÁLISE DOS RESULTADOS OBTIDOS<br>
<br>
A carga de dados foi feita completamente via PLPGSQL, modularizando os processos com procedures, para que o processo ficasse mais metódico e mais didático.
Inicialmente, o projeto foi dividido em duas partes, A base de dados OLTP, e a base de dados OLAP. Inicialmente, foi realizado alguns cortes da base de dados originais, visando manter somente as tabelas
que realmente seriam utilizadas. Após isso, foi realizada a implementação das tabelas dentro do banco e logo depois é chamada uma procedure responsável por ler todos os arquivos csvs, e alocar em sua determinada tabela.<br>

<br>Segue código da procedure responsável por popular as tabelas do modelo OLTP.<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/READ_CSV_PROCEDURE.PNG)<br>
<br>
--
<br>
Com a base OLTP criada, agora é possível realizar o processo de criação da base OLAP, realizando todos os processos e cortes necessários. Para isso, foi criada uma procedure para cada dimensão.<br>

<br>Segue abaixo, a procedure responsável por popular a tabela fato do sistema.<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/CREATE_DIM_VENDA_PROCEDURE.PNG)<br>
<br>
<br>Link das demais Procedures do Projeto:https://github.com/KaioSSL/TrabalhoBD2_2020/tree/main/procedures<br>
##   MARCO DE ENTREGA PARTE 01 (Até item 9.1)


#### 9.2	,ESTATISTICAS, SIZING<br>
<br>
Utilizando o comando Pg_stats para realizar analise dos dados da base.<br>
<br>

![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/PG_STATS.PNG)<br>
<br>
Sizing da Base OLAP e OLTP<br>


![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/PG_SIZE.PNG)<br>
#### 9.3	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
Os indices foram criados sobre os seguintes atributos da base:<br>
	- Dia do Ano : Para otimizar a busca entre periodos do ano mais precisos.<br>
	- Semana do Ano : Para otimizar a busca entre feriados, eventos atípicos.<br>
	- CEP(DIM_LOCATION) : Para otimizar a busca no momento de Join das tabelas.<br>
	- CEP(Vendedor,Cliente): Auxiliar no momento de análise e busca da localização dos individuos.<br>
	- Categoria Produto: Realizar a distinção mais eficaz das categorias dos produtos.<br>
	Todos indices utilizados são do Tipo BTree, pois são utilizados para intervalos, e este será o case default da maioria das consultas utilizadas.
	
Para realizar o teste de perfomance será utilizado a query com funcionamento idêntico ao grão definido inicialmente no projeto.
<br>Segue abaixo a query:<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/GR%C3%83O.PNG)<br>

<br>Atualmente, sem a aplicação dos índices, a query está levando em média 595,2 ms para ser executa e trazer os resultados obtidos.(Sem Explain)<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/sem_indice.PNG)<br>
<br>
Tempo médio de execução do grão após os indices para 686,8 ms.(Sem Explain)<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/com_indice.PNG)<br>

<br>
Planilha com tempos obtidos nos testes utilizando explain analyse. Link : https://docs.google.com/spreadsheets/d/10YnZnZe-Z0wxUUeddSyPVc6drq_RcvcwP3P-8xsF21U/edit?usp=sharing <br>
<br> Em média, a diferença nos tempos de execução não foi tão expressiva, diferente do tempo de planejamento.
Média Planejamento: Com Indice 1.8432, Sem Indice 1.2581<br>
Média Execução : Com Indice 523.0161, Sem Indice 543.0318<br>
<br>

Segue abaixo exemplo do resultado obtido ao se utilizar o comando Explain Analyse na query grão do sistema.<br>
<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/EXPLAIN_SEM_INDICE.PNG)<br>

Segue abaixo execução do grão, emitindo os gráficos de execução com Explain do PostgreSQL.<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/Explain_Grao_graficos.PNG)<br>

Uma das observações possíveis e pontos á serem discutidos, é que, o uso de indices pode aumentar o tempo de planejamento anterior á execução, pois demanda de maior análise para executar a consulta.
Mas também pode diminuir consideralvemente o tempo de execução da consulta utilizando suas técnicas de intervalos. É interessante pontuar que as diferenças não foram tão expressivas no projeto devido a quantidade registros,
por isso, para bases pequenas, talvez não seja tão necessário o uso de indices.


#### 10 Backup do Banco de Dados<br>
Para realizar o backup do projeto, foi utilizado o comando pg_dump.<br>
Levou cerca de 1 hora para concluir o backup sem utilizar o comando --file nomeArquivo, após utilizar, o backup ocorreu em segundos..<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/BACKUP.PNG)<br>
O arquivo possui aproximadamente 118 mb:<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/ArquivoBackup.PNG)<br>
Após o Backup, realizei o processo de restore da base de dados no banco de backup, o processo não levou mais que segundos, assim como o backup.<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/Restore.PNG)<br>

### 11 MINERAÇÃO DE DADOS
O método de mineração escolhido foi a Regressão Linear, a regressão linear é basicamente uma reta traçada  a partir de uma relação em um digrama de dispersão. A Regressão linear é utilizada
para prever determinado comportamento a partir de outras variaveis e/ou comportamento. Neste projeto, iremos aplicar a a regressão linear para prever qual a categoria de determinado produto baseado nas suas caracteristicas como:<br>
Peso, Altura, Largura e Comprimento.

Basicamente, a regressão linear é uma equação realizada para se estimar o valor/comportamento de uma variavel X dados os valores/comportamentos de outras variaveis.

Segue link do notebook com exemplo de aplicação: https://colab.research.google.com/drive/1lI_XevDuFdE_h7uM8KKmIcWM5EaJ_jKZ?usp=sharing (Não consegui finalizar, pois estava recebendo um erro)
Referência: http://scikit-learn.org/stable/index.html
<br>
Referências adicionais:
Scikit learning Map : http://scikit-learn.org/stable/tutorial/machine_learning_map/index.html
Machine learning in Python with scikit-learn: https://www.youtube.com/playlist?list=PL5-da3qGB5ICeMbQuqbbCOQWcS6OYBr5A


##   MARCO DE ENTREGA PARTE 02 (Até item 11)



### 12 CRIAÇÃO DOS SLIDES E VÍDEO PARA APRESENTAÇAO FINAL <br>

#### a) análises/dashboards e resultados provenientes do banco de dados OLAP desenvolvido (CANVAS + NOTEBOOKS E CONCLUSÕES0
#### a) Modelo (pecha kucha)<br>
#### b) Tempo de apresentação 6:40 
#### OBS: Esta é uma atividade de grande relevância no contexto do trabalho. Mantenha o foco nos principais resultados.


##   MARCO DE ENTREGA PARTE 03 (Até item 12)

### 13  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")



