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
 <li><b>Tipos de Dados</b></li>
  <ul>
      <li><b>Qualitativo (Categórico)</b></li>
      ➜ Nominais: Profissão / Sexo / Religião<br>
      ➜ Ordinais: Escolaridade/ fila/ Classe Social (rankeamento)<br>
      <li><b>Quantitativos (Números)</b></li>
      ➜ Discretos: Número de filhos / de carros / acessos<br>
      ➜ Contínuos: Altura / Peso / Salário<br>
  </ul><br>
  <li><b>3 Áreas da Estatística</b></li>
    <ul>
      <li><b>Descritiva</b></li>
      ➜ Utilizada para descrever as principais caracetíristicas dos dados<br>
      ➜ Média, dispersão dos dados (desvio padrão), natureza ou distribuição, gráficos descritivos
      <li><b>Probabilística</b></li>
      ➜ Criar o objeto do tipo "LabelEncoder" e treinar na variável (dados de treino)<br>
      ➜ Aplicar o objeto encoder  e method transform para transformar os riável
      <li><b>Inferencial</b></li>
      ➜ Criar o objeto do tipo "LabelEncoder" e treinar na variável (dados de treino)<br>
      ➜ Aplicar o objeto encoder  e method transform para transformar os riável
    </ul><br>
  <li><b>Probabilidade</b></li>
    <ul>
      <li><b>Aplicação em variáveis que não possuem hierarquia</b></li>
      ➜ Exemplo: Cores, tipos de armazem<br>
      ➜ get_dummies<br>
    </ul><br>
  <li><b>Inferencial</b> - Dimensionamento das variáveis</li>
  ➜ <b>Normalização</b> -> reescalonamento dos recursos para um intervalo de [0,1], o <u>método MinMaxScaler() do sklearn.preprocessing</u> oferece esse procedimento<br>
  ➜ <b>Padronização</b> -> Centralizar as colunas de recursos na média 0, com desvio padrão de 1 para as colunas. Mantém informações úteis sobre valores discrepantes. O <u>método StandardScaler()do pacote sklearn.preprocessing</u> oferece o procedimento<br>

  <li>Que capítulo incrível! 




      
