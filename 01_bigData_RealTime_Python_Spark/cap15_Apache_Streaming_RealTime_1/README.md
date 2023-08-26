<h1 align="center"> Capítulo 15 - Real-Time Analytics - Spark Streaming</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">
  <img src="https://img.shields.io/badge/Apache_Spark-FFFFFF?style=for-the-badge&logo=apachespark&logoColor=#E35A16">
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white">  
</p>


<h2>Descrição do Capítulo</h2>
<p>Utilização da livraria MLlib no apashe Spark, para construção de modelos de machine Learn voltados a ambientes distribuidos. Capitulo com Lab 05 e Mini projeto 05</p>
<p>RDD é excelente para realizar processamento / DF é ideal para explorar dados</p>


<h2>Lab 05</h2>
<ul>
  <li>Streaming Estruturado(Structured Streaming)</li>
  <li>Utilizando Net Cat - Gerador de dados em tempo real - instalação do mobaxterm</li>
  <li>Mesma sintaxe para trabalhar com dados em Batch e Streaming</li>
  - spark.readStream.format("socket").option("host", "localhost").option("port", 9999).load()
  <li><b>DStreams</b> - Base do Spark Streaming, cada DStreams são formados por sequeências de RDD's coletados em cada unidade de tempo </li>
  - Oferecem 2 tipos de operações:
  - Transformações = gerando outro DStream
  - Outpu(ações) = Gravando o dados em uma fonte externa ou armazenamento
  <li><b>Conceito WINDOW</b></li>



</ul>



      
