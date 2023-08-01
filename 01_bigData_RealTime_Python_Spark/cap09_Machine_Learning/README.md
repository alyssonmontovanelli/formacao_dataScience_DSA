<h1 align="center"> Capítulo 09 - Machine Learning</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white">
  <img src="https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white">
  <img src="https://img.shields.io/badge/scikit_learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white">
</p>

<h2>Descrição do Capítulo</h2>
<p>Utilização do pacote <b>"preprocessing" do Scikitlearn</b>. Estudo de Caso 05</p>
<p>Modificar os dados para aplicar técnicas de modelagem preditiva (machine learning) ou estatística</p>

<h2>Resumo do Capítulo</h2>
<ul>
 <li><b>Três Principais algorítmos de Machine Learning</b></li>
 ➜ Aprendizagem Supervisionada<br>
 ➜ Aprendizagem não supervisionada <br>
 ➜ Aprendizagem por reforço<br>

  <li><b>Aprendizagem Supervisionada</b></li>
    <ul>
      <li>Dados de treino ➜ Algorítmo de ML ➜ Modelo Preditivo para receebr novos dados de entrada e apresentar as previsões com saída dos dados</li>
      <li>Principais Algorítmos:</li>
      ➜ Regressão: Previsão de valor numérico<br>
      ➜ Classificação: Previsão de classe categórica<br>
    </ul>
  <li><b>Aprendizagem NÃO Supervisionada</b></li>
    <ul>
      <li>Dados de treino ➜ Algorítmo de ML ➜ Receebr novos dados de entrada e encontrar padrões e realziar a clusterização com base em dados históricos, sem indicar a saída dos dados
    </ul>
  <li><b>Aprendizagem Por Reforço</b></li>
    <ul>
      <li>Tentativa e Erro com "recompensas" a cada tarefa bem concluida</li>
    </ul>
  
<h2>Mini Projeto - Aprendizado Supervisionado - CLASSIFICAÇÃO</h2>
<ul>
 <li><b>Carregamento de dataset</b></li>
 <li><b>EDA e Limpeza dos Dados</b></li>
 ➜ Verificação do tipo das variáveis / valores nulos / ausentes / Duplicados<br>
 ➜ Label encoding em variáveis do tipo object <br>
 ➜ Plotagem para melhor verificação / corr / hist / FacetGrid com var Target<br>
 ➜ Limpar Outliers (Verificar se realmente são)/ Duplicados / 
 <li><b>Pré Processamento</b></li>
 ➜ Drop de variáveis com multicolinearidade<br>
 ➜ Divisão de dados em Treino e Teste<br>
 ➜ Balanceamento de Classe - para não tendencionar o modelo de ML - criar dados sinteticos para a classe minoritária com SMOTE<br>
 ➜ Padronização dos Dados (Normalmente é a ultima atividade dentro do pré-processamento) 
 <ul>
      <li>Normalização (Valores de 0 a 1) x Padronização (Valores de -1 a 1, considerando outliers)</li>
      <li>No Mini projeto, utilizamos a Padronização</li>
      <li>Aplicada na variável de entrada, não na alvo</li> 
  </ul>
  ➜ <u>Toda e qualquer transformação aplicada em treino, deve ser aplicada em teste e nos novos dados</u>
  <br>  <br>
 <li><b>Construção do Modelo ML/ Treinamento / Avaliação</b></li>
  ➜ Após a confecção do modelo e teste, devemos sempre mensurar as métricas para ver o desempenho final.<br>
  ➜ Foi criado um DF que recebe as métricas de cada modelo
 <ul>
      <li><b>Regressão Logística (Benchmark)</b> boa opção para regressão:</li>
      ➜ Definição de hiperparâmetros com GridSearchCV<br>
      - Criação de varios modelos de regressão, com diferentes hiperparams, para então escolher o melhor, utilizando (best_estimator)<br>
      ➜ Previsões utilizando "predict(x_teste)"<br>
      ➜ É possível tirar a probabilidade de cada ocorrência com "predict_proba(x_teste)"<br>
      ➜ Matriz de confusão para verificar erros e acertos do modelo<br>
    <li><b>Random Forest</b></li>
  </ul>




      
