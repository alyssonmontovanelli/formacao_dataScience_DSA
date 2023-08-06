<h1 align="center"> Capítulo 11 - Processamento de Dados com Apache Spark</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">
  <img src="https://img.shields.io/badge/Apache_Spark-FFFFFF?style=for-the-badge&logo=apachespark&logoColor=#E35A16">
  <img src="https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white">
  <img src="https://img.shields.io/badge/scikit_learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white">
</p>

<h2>Descrição do Capítulo</h2>
<p>Apache Spark é uma plataforma, com uma série de componentes</p>

<h2>Resumo do Capítulo</h2>
<ul>
 <li>Preparação das vartiáveis de ambiente</li>
 <li>Teste PySpark</li>
 <li>Preparação das vartiáveis de ambiente</li>
</ul>

<h2>Mini Projeto 3</h2>
<p>Previsão em tempo real dos valores futuros do bitcoin, com <b>Apache Spark e Machine Learning</b></p>
<p>Dados coletados de "https://bitcoincharts.com/charts/bitstampUSD#tgSzm1g10zm2g25zv"</p>

<ul>
   <li>SparkContext  é responsável por realizar a conexão entre o cluster de computadores</li>
   <li>Definir contexto, criar sessão com "Builder"</li>
   <li><b>RDD</b> - Resilient Distributed Datasets</li>
   ➜ Coleção de objetos distribuida e imutável, que podem ser computados em diferentes nodes do cluster<br>
   ➜ Spark armazena os resultados intermediários em memória, São gravados em disco apenas quando uma ação é gerada.
   ➜ 2 formas de criar RDD's: Referenciado dataset externo (HDFS, NoSQL) ou paralelizando uma coleção existente (sc.parallelize)
   ➜ RDD suporta 2 tipós de operações: Transformação e Ação


</ul>






      
