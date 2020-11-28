# TrabalhoBD2_2020


# TRABALHO 01 : OlistProject
Trabalho desenvolvido durante a disciplina de BD2
 
# Sumário

### 1	COMPONENTES<br>
Kaio Fabio - 20182BSI0485<br>


### 2	Escolha da base de dados e explicação sobre informações relacionadas <br>
Base escolhida do Site Kaggle.
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
Segue código da procedure responsável por popular as tabelas do modelo OLTP.<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/READ_CSV_PROCEDURE.PNG)<br>
<br>
--
<br>
Com a base OLTP criada, agora é possível realizar o processo de criação da base OLAP, realizando todos os processos e cortes necessários. Para isso, foi criada uma procedure para cada dimensão.<br>
Segue abaixo, a procedure responsável por popular a tabela fato do sistema.<br>
![texto](https://github.com/KaioSSL/TrabalhoBD2_2020/blob/main/Imagens/CREATE_DIM_VENDA_PROCEDURE.PNG)<br>

<br>


<br>Link das demais Procedures do Projeto:https://github.com/KaioSSL/TrabalhoBD2_2020/tree/main/procedures<br>
##   MARCO DE ENTREGA PARTE 01 (Até item 9.1)


#### 9.2	,ESTATISTICAS, SIZING<br>
<br>
Inclusão de análise das estatísticas e Sizing
<br>
<br>

#### 9.3	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
    a) Lista de índices, tipos de índices com explicação de porque foram implementados nas consultas 
    b) Performance esperada VS Resultados obtidos
    c) Tabela de resultados comparando velocidades antes e depois da aplicação dos índices (constando velocidade esperada com planejamento, sem indice e com índice Vs velocidade de execucao real com índice e sem índice).
    d) Escolher as consultas mais complexas para serem analisadas (consultas com menos de 2 joins não serão aceitas)
    e) As imagens do Explain devem ser inclusas no trabalho, bem como explicações sobre os resultados obtidos.
    f) Inclusão de tabela mostrando as 10 execuções, excluindo-se o maior e menor tempos para cada consulta e 
    obtendo-se a media dos outros valores como resultado médio final.
<br>

#### 10 Backup do Banco de Dados<br>
        Detalhamento do backup.
        a) Tempo
        b) Tamanho
        c) Teste de restauração (backup)
        d) Tempo para restauração
        e) Teste de restauração (script sql)
        f) Tempo para restauração (script sql)
<br>


### 11 MINERAÇÃO DE DADOS

* Explicação/Fundamentação teórica sobre o método, objetivos e restrições! (formato doc/odt ou PDF)
* Onde/quando aplicar 
> ##### Estudar e explicar artigo que aplique o método de mineração de dados/machine learning escolhido
* exemplo de uso/aplicação 
> ##### a) Implementar algoritmo de básico de exemplo obtido na literatura (enviar código executável junto do trabalho com detalhamento de explicação para uso passo a passo)

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



