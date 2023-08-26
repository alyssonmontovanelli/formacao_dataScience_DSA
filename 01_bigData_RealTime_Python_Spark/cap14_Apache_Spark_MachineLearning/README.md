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
➜ Interessante colocar os dados em cache<br>
➜ Trabalho no notebook com dados RDD<br>
➜ Função lambda para recolher cabeçalho<br>
➜ Sempre utilziar multiplas variaveis<br>
<li><b>Limpeza dos Dados</b></li>
➜ RDD não grava Schema dos dados, por isso devemos utilziar lambda para transformar em DF Spark, como feito na primeira celular de Limpeza dos Dados<br>
➜ DF Spark ------> DF Pandas<br>
➜ Verificação de valores nulos/ausentes/sem significao ("?")<br>
➜ Utilização de lambda<br>
➜ Aplicação das mudanças diretamente no RDD com função map<br>
<li><b>Análise Exploratória dos Dados ➜ EDA</b></li>
➜ Correlação / describe do Spark<br>
➜ corr do Spark nao retorna a tabela igual pandas, deve-se utilizar um loop <br>
<li><b>Pré Processamento dos Dados</b></li>
➜ No jupyter de classificação binária tem uma função para label encoding e one-hot enconig<br>
➜ Função para transformação dos dados para representação numérica em ANALISE BINÁRIA<br>
➜ Vetores densos e Vetores espersos<br>
➜ É necessário que o vetor esteja em formato de tupla para alimanetar algoritmo de ML com apache Spark, no formato (target , vector([preditora1, preditora2, preditora3]))
➜ 'label' no MLlib se refere a variável alvo<br>
➜ Aplicação de PCA para diminuir o tamanho do conjunto de dados (binária). <b>É pegar a informação de todas as variáveis e compactar e poucas, NÃO É EXCLUIR VARIÁVEL - Só funciona para aprendizado não supervisionado</b>
<li><b>Machine Learning</b></li>
➜ Nome das variáveis como label e features são obrigatórios
  <ul>
    <li><b>Regressão Linear</b></li>
    ➜ Algorítmo extrai coeficientes para cada var preditora<br>
    ➜ Intercepto: constante
    <li><b>Árvore de Decisão</b></li>
    ➜ Classificador - porém existe tbm esse algorítmo para regressão<br>
    ➜ Quando quero prever uma variável qeu possui mais de duas saídas<br>
    ➜ Função StringIndexer cria o indexador, pegando o valor em string e convertendo para tipo numérico
    <li><b>Árvores de Decisão</b></li>
    <li><b>Classificação Binária - Naive Bayes</b> - Utilizado para Spam </li>
    ➜ Muito utilizado para classificação de spam<br>
    ➜ Não posso utilizar one hot encoding - utilizaremos outros tratamentos para features (Processamento de linguagem natural)<br>
    ➜ Pipeline - linha de operações com estágios
    <li><b>KMeans</b></li>
    ➜ Melhor modelo para clusterização<br>
    ➜ Só teremos variáveis de entrada, sme a coluna 'label'<br>
    ➜ parametro 'K' é o número de grupos que será criados<br>
  </ul>
  <h2>Mini Projeto 5</h2>
    <li>Automatização do processamento dos dados</li>
    ➜ Verificação de valores nulos, outliers, tratamento de variaveis categoricas e padronização/normalização das numericas<br>
    ➜ Utilização do parametro pearson para corr()
    <li><b>AUTO ML</b> - Automated Machine Learning</li>
    ➜ Quando executar a validação cruzada, quantidade de moldes criado será igual a qtde params informados<br>
    ➜ Devo sempre aplicar todos os tratamentos aos novos dados , nesse caso, a variavel age teve outlier  <br>






</ul>



      
