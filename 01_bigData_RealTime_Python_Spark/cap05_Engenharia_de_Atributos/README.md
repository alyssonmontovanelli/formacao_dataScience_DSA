<h1 align="center"> Capítulo 05 - Engenharia de Atributos</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">
  <img src="https://img.shields.io/badge/Pandas-2C2D72?style=for-the-badge&logo=pandas&logoColor=white">
  <img src="https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white">
  <img src="https://img.shields.io/badge/Matplotlib-%23ffffff.svg?style=for-the-badge&logo=Matplotlib&logoColor=black">
  <img src="https://img.shields.io/badge/SciPy-654FF0?style=for-the-badge&logo=SciPy&logoColor=white">
</p>

<h2>Descrição do Capítulo</h2>
<p>Continuação do cap anterior. Estudo de Caso 04</p>
<p>Processo de usar o conhecimento da área de negócio, para remover, selecionar e transformar os dados, mantendo os atributos relevantes e criar outros</p>

<h2>Resumo do Capítulo / Estudo de Caso 04 </h2>
<ul>
 <li>Limpeza e Tratamentos</li>
  <ul>
      <li>Dados NA / Duplicados</li>
      <li>Valores Outliers e <b>Z-Score</b></li>
      ➜ Limite inferior e Superior - Fórmula <br>
      ➜ <b>Z-SCORE</b> <br>
      Método de stats, do pacote scipy, para encontrar outliers
      <li>Desbalanceamento de Classes:</li>
      Para Machine Learning, os dados não podem ser muito desbalanceados.
    </ul><br>
  <li>Engenharia de Atributos</li>
    <ul>
      <li><b>Feature Selection</b></li>
      ➜ Seleção das Variáveis que serão realmente úteis / Utilizar corr() para numéricas e barras para categóricas
      <li><b>Feature Extration</b></li>
      ➜ Redução de dimensionalidade e/ou criação de novas<br>
      ➜ Criação de nova variável a ser preenchida por valo NA(np.na) para após preencher com dados, utilizando np.where<br>
      ➜ Utilização de <b>NP.WHERE</b> aninhado<br>
      ➜ Método 'pivot' - linha em coluna e coluna em linha
      ➜ Método "replace(np.nan, 0)" para substituir valor ausente pro 0 direto na variável
    </ul><br>
  <li>Exercício</li>
    



      
