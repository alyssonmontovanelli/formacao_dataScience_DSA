<h1 align="center"> Capítulo 14 - Spark Machine Leanr - MLlib</h1>

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
<li><b>Gerais</b></li>
- Interessante colocar os dados em cache
- Trabalho no notebook com dados RDD
- Função lambda para recolher cabeçalho
<li><b>Limpeza dos Dados</b></li>
- RDD não grava Schema dos dados, por isso devemos utilziar lambda para transformar em DF Spark, como feito na primeira celular de Limpeza dos Dados
- DF Spark ------> DF Pandas
- Verificação de valores nulos/ausentes/sem significao ("?")
- Utilização de lambda
- Aplicação das mudanças diretamente no RDD com função map
<li><b>Análise Exploratória dos Dados - EDA</b></li>
- Correlação / describe do Spark
- corr do Spark nao retorna a tabela igual pandas, deve-se utilizar um loop 
<li><b>Pré Processamento dos Dados</b></li>
- Vetores densos e Vetores espersos
- É necessário que o vetor esteja em formato de tupla para alimanetar algoritmo de ML com apache Spark, no formato (target , vector([preditora1, preditora2, preditora3]))
- 'label' no MLlib se refere a variável alvo
<li><b>Machine Learning</b></li>
- Nome das variáveis como label e features são obrigatórios
  <ul>
    <li><b>Regressão Linear</b></li>
    - Algorítmo extrai coeficientes para cada var preditora
    - Intercepto: constante
    <li><b>Árvores de Decisão</b></li>
    - Classificador - porém existe tbm esse algorítmo para regressão
    - Quando quero prever uma variável qeu possui mais de duas saídas
    - Função StringIndexer cria o indexador, pegando o valor em string e convertendo para tipo numérico
    -

   
  </ul>




</ul>



      
