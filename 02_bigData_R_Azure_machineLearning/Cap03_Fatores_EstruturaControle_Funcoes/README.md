<h1>Cap 03 - Fatores, Estruturas e Funcoes</h1>

-

<h2>Descrição do Capítulo</h2>
<p>Utilização da livraria SQL no Apache Spark, com o padrão ANSI, além de ideias inicias de Docker</p>


<h2>Resumo do Capítulo</h2>

<ul>
  <li>Fatores</li>
  ➜ Variáveis categóricas para armazenar valores de caracteres
  ➜ Otimiza performance, registrando apenas o valor unitario dos valores que se repetem
  ➜ "levels()" são os niveis do fator, ou seja, os termos unicos
  ➜ ÓTIMO para contabilizar os fatores de uma variável
  ➜ factor() 
  <li>Condicionais</li>
  ➜ ifelse para verificar de forma rapida
  ➜ Função rep() é incrivel
  <li>Funções</li>
  ➜ function(...) para criar funções sem parametros
  <li>Família APPLY()L</li>
  ➜ SCRIPT 07 está bem explicativo
  ➜ Função "gl" cria os niveis de fatores 
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
<li><b>UDF - User Defined Function
</b></li>
➜ Funções criadas para "extender" a funcionalidade do framework





</ul>
