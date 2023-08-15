<h1 align="center"> Capítulo 13 - Apache Spark - SQL - 2</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">
  <img src="https://img.shields.io/badge/Apache_Spark-FFFFFF?style=for-the-badge&logo=apachespark&logoColor=#E35A16">
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white">  
</p>


<h2>Descrição do Capítulo</h2>
<p>Utilização da livraria SQL no Apache Spark, com o padrão ANSI, além de ideias inicias de Docker</p>


<h2>Mini Projeto 4</h2>
<ul>
<li>No projeto, foi utilizado apenas o SPARK</li>
<li>Tabela temporária</li>
- Importante para poder utilizar a sintaxe SQL em uma cópia de DF SPARK
- utiliza spark.sql(query)
<li>Queries SQL x Dot Notation</li>
- SQL é mais 'visual', porém precisa criar tabela temporaria
- Dot Notation não precisa duplicar os dados e já mais otimizado para trabalhar em ambiente distribuido
<li>Funções SQL do Spark SQL</li>
  <ul>
    <li>Método <b>select()</b></li>
    - ideal para retornar colunas
    <li>Método <b>collect()</b></li>
    - não deve ser usado em grandes volumes de dados
    - Retorna uma lista com as linhas do conjunto de dado
    - Slicing de listas normais 
    <li>Método <b>filter()</b></li>
    <li>Método <b>where()</b></li>
    <li>Método <b>map()</b></li>
    <li>Método <b>flatmap()</b></li>    
    <li>Método <b>explode()</b></li>    




  </ul>
</ul>



      
