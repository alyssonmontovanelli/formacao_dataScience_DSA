<h1 align="center"> Capítulo 06 - Pré Processamento dos Dados</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white">
  <img src="https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white">
  <img src="https://img.shields.io/badge/scikit_learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white">
</p>

<h2>Descrição do Capítulo</h2>
<p>Utilização do pacote <b>"preprocessing" do Scikitlearn</b>. Estudo de Caso 05</p>
<p>Modificar os dados para aplicar técnicas de modelagem preditiva (machine learning) ou estatística</p>

<h2>Resumo do Capítulo / Técnicas de Pré Processamento </h2>
<ul>
 <li><b>Label Encoding</b> - Variável categória</li>
  <ul>
      <li>Método de aplicação manual / Py puro</li>
      ➜ Variável categórica ordinal: Quando existe hierarquia entre os dados<br>
      ➜ Variável categórica Nominal: Quando não existe hierarquia, ex: Sexo do cliente<br>
      ➜ Método map para trocar os valores da variável
    </ul><br>
  <li><b>Label Encoder() - Sckit Learn</b></li>
    <ul>
      <li>Aplicação - Modo Automático</li>
      ➜ Criar o objeto do tipo "LabelEncoder" e treinar na variável (dados de treino)<br>
      ➜ Aplicar o objeto encoder  e method transform para transformar os riável
    </ul><br>
  <li><b>One-Hot Encoding - Sckit Learn</b></li>
  odificação one-hot é uma ferramenta bastante poderosa, mas só é aplicável para dados categóricos que possuem um número baixo de valores exclusivos.
    <ul>
      <li><b>Aplicação em variáveis que não possuem hierarquia</b></li>
      ➜ Exemplo: Cores, tipos de armazem<br>
      ➜ get_dummies<br>
    </ul><br>
  <li><b>Feature Scaling</b> - Dimensionamento das variáveis</li>
  ➜ <b>Normalização</b> -> reescalonamento dos recursos para um intervalo de [0,1], o <u>método MinMaxScaler() do sklearn.preprocessing</u> oferece esse procedimento<br>
  ➜ <b>Padronização</b> -> Centralizar as colunas de recursos na média 0, com desvio padrão de 1 para as colunas. Mantém informações úteis sobre valores discrepantes. O <u>método StandardScaler()do pacote sklearn.preprocessing</u> oferece o procedimento<br>

  <li>Que capítulo incrível! 




      
