<h1 align="center"> Capítulo 04 - Análise Exploratória de Dados</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white">
  <img src="https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white">
  <img src="https://img.shields.io/badge/Matplotlib-%23ffffff.svg?style=for-the-badge&logo=Matplotlib&logoColor=black">
</p>

<h2>Descrição do Capítulo</h2>
<p>Este capitulo será todo voltado para análise exploratória prática, sem matéria teórica. Optei por utilizar apenas o jupyter e não o VS Code, para uma melhor visualização dos dados.</p>
<p>Objetivo é conhecer e analizar os dados de todos os angulos</p>


<h2>Resumo do Capítulo / Estudo de Caso 03 </h2>
<h3>Resumo parte 1 da EDA (Parte técnica)</h3>
<ul>
 <li>Configuração única/global de todos os gráficos</li>
 <li>Separação variáveis categóricas e numércias / Análise do describe()</li>
 <li>Utilização de "for" para verificação dos totais de multiplas colunas</li>
 <li>Método ".sample" para extrair uma amostra válida do dataSet
 <li>Análise com gráficos utilizando FOR - multiplas variáveis no mesmo plot</li>
  <ul>
    <li><b>Univariada - Variáveis numéricas</b></li>
    ➜ <b>Box Plot</b> <br>
    Formato de candle, separam os quartis de 25%, 50% (mediana) e 75%. Ficar atento com os outliers (objetivo desse tipo é identificar justamente isso) <br>
    ➜ <b>Dist Plot</b> <br>
    Para verificação da distribuição. Apenas os 2 primeiros gráficos possuem. Quando possui formato de "U", não é ideal / Distribuição normal é o ideal para machine learning<br>
    ➜ <b>Violin Plot</b>
    Para verificação da distribuição. Apenas os 2 primeiros gráficos possuem. Quando possui formato de "U", não é ideal / Distribuição normal é o ideal para machine learning<br>
    <li><b>Univariada - Variáveis Categóricas</b></li>
    ➜ <b>Count Plot</b> <br>
    Gráfico de ocorrência - barras<br>
    <li><b>Bivariada</b></li>
    ➜ <b>Mapa de Correlaçãot</b> <br>
    Gráfico de calor, com a correlação de cada variável, de 1 a -1<br>
    ➜ <b>Pair Plot</b> <br>
    mesmo formato da anterior, porém com "mini gráficos" de duas variáveis<br>
    ➜ <b>Catplot</b> <br>
    Utilizar a variável alvo em relação a ocorrência das demasi variáveis<br>
  </ul>
</ul>

<h3>Resumo parte 2 da EDA (Parte de Negócio)</h3>
<p>Mais voltada a responder perguntas de negócio</p>
<p>Utilizando groupby com agregação "nunique" e marge<br>Deve-se usar o total geral por categoria, não apenas da variável alvo</p>
<ul>
 <li>Atrasos na entrega por modal de envio</li>
 ➜ Agrupamento de datasets para melhor verificar os atrasos por modal, com base no percentual de atraso.
 <li>Atrasos na entrega por prioridade de entrega</li>
 ➜ Agrupamento de datasets para melhor verificar os atrasos por modal, com base no percentual de atraso.
</ul>
