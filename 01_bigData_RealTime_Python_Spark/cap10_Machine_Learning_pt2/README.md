<h1 align="center"> Capítulo 10 - Machine Learning - Pt 2</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white">
  <img src="https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white">
  <img src="https://img.shields.io/badge/scikit_learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white">
</p>

<h2>Descrição do Capítulo</h2>
<p>Prática de algorítmos de regressão  com o Mini Projeto 2</p>

<h2>Resumo do Capítulo</h2>
<ul>
 <li>Preparação dos Dados</li>
 ➜ Pré requsito os dados estarem com distribuição normal<br>
 ➜ Em regressão, procuramos sempre uma boa correlação das variaveis preditoras com a variável alvo
 <li>Pré Processamento dos dados</li>
 ➜ Utilização da classe StandardScaler para criar o padronizador<br><br>
 <li>Construção, Treinamento e Avaliação dos Modelos de Machine Learning</li>
  <ul>
    <li>Modelo 1 - <b>Regressão Linear (Benchmark)</b></li>
      ➜ y = b0 + b1 * X (Regressão linear simples)<br>
      ➜ y = b0 + b1*X1 + b2*x2 + b3*x3 (Regressão linear Múltipla)<br>
      ➜ Os coeficientes "b" são visualizados com o atributo ".coef_"<br>
      ➜ Taxa de erro => ei = Yi (valor histórico) - Yi (valor previsto)<br>
      ➜ Plot com valores reais e previstos para avaliar o modelo e cálculo de Métricas para avaliação<br>
      ➜ MAE / MSE / RMSE / Coeficiente R2 e Variancia Explicada são métricas de avaliação<br>
      ➜ Importante sempre verificar o gráfico de residuos, que devem seguir a distribuição normal, para melhor validar o modelo<br>
    <li>Modelo 2 - <b>Regressão RIDGE</b></li>
    ➜ Acrescente elemento matemático para regularizar o resultado<br>
    ➜ Esse elemento é o <b>alpha</b><br>
    ➜ Utiliza todas as métricas anteriores, inclusive resíduo 
    <li>Modelo 3 - <b>Regressão LASSO</b></li>
    ➜ Utiliza elemento matemático também e todas as outras métricas de avaliação  
  </ul>
  <li>Modelo escolhido foi o <b>Modelo 1</b></li>
  ➜ Quando houver empate técnico entre modelos, deve-se escolher o mais simples<br>
  ➜ Possibilita verificar e chegar a conclusões e insights com base na relação das variáveis de entrada
  <li><b>Conclusão</b></li>
  ➜ Para o projeto, não foi realziado o deploy em produção<br>
  ➜ Enfoque da conclusão na relação dos coeficientes das variáveis preditoras. <b>Insano demais!!</b>






      
