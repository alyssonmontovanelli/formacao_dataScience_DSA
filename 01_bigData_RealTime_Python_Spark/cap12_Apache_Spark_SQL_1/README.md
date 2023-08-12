<h1 align="center"> Capítulo 12 - Apache Spark - SQL - 1</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">
  <img src="https://img.shields.io/badge/Apache_Spark-FFFFFF?style=for-the-badge&logo=apachespark&logoColor=#E35A16">
  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white">
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white">  
  <img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white">
</p>


<h2>Descrição do Capítulo</h2>
<p>Utilização da livraria SQL no Apache Spark, com o padrão ANSI, além de ideias inicias de Docker</p>


<h2>Resumo do Capítulo</h2>
<p>Instruções SQL se dividem em 5 tipos </p>
➜ <b>Data Manipulation Language - DML</b><br>
➜ <b>Data Definition Language - DDL</b><br>
➜ <b>Data Control Language - DCL</b><br>
➜ <b>Data Query Language - DQL</b><br>
➜ <b>Data Transaction Language - DTL</b><br><br>

<ul>
  <li>Instruções DML</li>
  ➜ Insert / Update / Delete
  <li>Instruções DDL</li>
  ➜ Create Table / Alter Table / Drop Table
  <li>Instruções DCL</li>
  ➜ Grant - Autoriza o usuário do SGBD
  ➜ Revoke - Remove autorização do usuário 
  <li>Instruções DQL</li>
  ➜ Select  - ex: select id, nome from tb_cliente where id= 100 and nome = 'Bob' 
  <li>Instruções DTL</li>
  ➜ Commit / Begin Transaction / Rollback 
</ul>

<h2>Lab 04 - SparkSQL / PandaSQL / SQLAlchemy / PostgreSQL / Docker</h2>
<p><b>CRONOLOGIA </b>➜ Importação de dados CSV para Pandas / Transferência dos dadso para PostgreSQL utilizando a biblioteca SQLAlchemy / SQLAlchemy utilizando pandaSQL para 'puxar' os dados para DF pandas / utilização de SparkSQL</p>

<ul>
<li><b>DOCKER</b></li>
➜ Container é uma maquina virtual com SO<br>
➜ Criar o container faz o mapeamento de portas<br>
➜ Images = template do container (toda a config que quero)<br>
➜ execução de container 'getting-started' via cmd na porta 80:80 (servidor web)<br>
➜ Criação de container utilizando imagem baixada do PosgreSQL: 
<u>docker run --name dsa -ePOSTGRES_PASSOWRD=dsa123 -p 5432:5432 -d postgres</u><br><br>

<li><b>Instalação de Pacotes para comunicação entre ferramentas</b></li>
<li><b>SGBD =/= Banco de dados</b></li>
➜ SGBD é o software que armazena bancos de dados
<li><b>SQLAlchemy</b></li>
➜ Devemos criar o o rotor de conexão com 'create_engine'
➜ Criação de tabela SQL com apenas 1 linha de código
➜ Execução de querys utilizando a engine
<li><b>pgAdmin</b></li>
➜ Software para administrar e trabalhar de forma mais otimizada com o banco de dados
➜
<li><b>SQLDF</b></li>
➜ Forma de utilizar a sintaxe SQL em dataframe do Pandas
<li><b>Carregar dados SQL para Spark</b></li>
➜ Transformar em df pandas, depois transformar df pandas em df Spark
<li><b>Manipulação de dados de DF SPark</b></li>
➜ Sintaxe parecida com a do pandas / SQL
➜ Utilizado: Filtros / agg / groupBy
<li><b>UDF - User Defined Function</b></li>





</ul>



      
