import numpy as np
import pandas as pd

# Carregando dataset escola
dados_escolas = pd.read_csv("C:\/formacao_dataScience_DSA\/01_bigData_RealTime_Python_Spark\cap03_Pandas\dados\dataset_escolas.csv")

# Carregando dataset estudantes
dados_estudantes = pd.read_csv("C:\/formacao_dataScience_DSA\/01_bigData_RealTime_Python_Spark\cap03_Pandas\dados\dataset_estudantes.csv")

print(dados_escolas.head())
print(dados_estudantes.head())

# Unindo os dois datasets 
dados_full = pd.merge(dados_estudantes, dados_escolas, how = "left", on = ["Nome_Escola", "Nome_Escola"])
print(dados_full.columns)


"""
DESAFIO PROPOSTO PELA DSA

"""


'''01 - Temos dados de quantas escolas?'''
escolasUnicas = len(pd.unique(dados_full['Nome_Escola']))
print(f"\n01 - Quantidade de escolas: {escolasUnicas} unidades\n")



'''02- Qual o total de registros de estudantes na base de dados?'''
total_deAlunos = dados_estudantes['ID_Estudante'].count()
print(f"02 - Total de alunos: {total_deAlunos}\n")



'''03 - Qual o orçamento total considerando todas as escolas?'''
orcamento_total = dados_escolas['Orcamento_Anual'].sum()
print(f"03 - Orçamento total das escolas é de $ {orcamento_total}\n")

orcamento_porEscola = dados_escolas.groupby('Nome_Escola')['Orcamento_Anual'].sum()



'''04 - Qual a média da nota dos alunos em Redação?'''
mediaRedacao = dados_estudantes['Nota_Redacao'].mean()
print(f"04 - Nota média da prova de redação: {round(mediaRedacao, 2)} pontos\n")



'''05 - Qual a média da nota dos alunos em Matemática?'''
mediaMatematica = dados_estudantes['Nota_Matematica'].mean()
print(f"05 - Nota média da prova de redação: {round(mediaMatematica, 2)} pontos\n")



'''06 - Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Redação? (Entregue o resultado em valor absoluto e percentual)'''
# Qtde absoluta
aprov_redacaoABS = dados_estudantes[(dados_estudantes['Nota_Redacao'] >= 70)].count()['Nota_Redacao']

#Qtd porcentagem
aprov_redacaoPCT = (aprov_redacaoABS / dados_estudantes['Nota_Redacao'].count()) * 100

print(f"06 - Quantidade absoluta de aprovados: {aprov_redacaoABS}\
      \nPorcentagem dos alunos aprovados em Redação: {round(aprov_redacaoPCT,2)}%\n")



'''07 - Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Matemática? (Entregue o resultado em valor absoluto e percentual)'''
# Qtde absoluta
aprov_MatematicaABS = dados_estudantes[(dados_estudantes['Nota_Matematica'] >= 70)].count()['Nota_Matematica']

#Qtd porcentagem
aprov_MatematicaPCT = (aprov_MatematicaABS / dados_estudantes['Nota_Matematica'].count()) * 100

print(f"07 - Quantidade absoluta de aprovados: {aprov_MatematicaABS}\
      \nPorcentagem dos alunos aprovados em Redação: {round(aprov_MatematicaPCT,2)}%\n")



'''08 - Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Matemática e Redação? (Entregue o resultado em valor absoluto e percentual)'''

# Criando nova coluna, para aprovados nas duas disciplinas
dados_estudantes['Aprov_red_mat'] = np.where((dados_estudantes['Nota_Matematica'] >= 70)\
                                              & (dados_estudantes['Nota_Redacao'] >= 70), 1,0)

# Filtrando os valores '1' no df, correspondentes aos aprovados - Valor absoluto
aprovados_red_mat_ABS = dados_estudantes[(dados_estudantes['Aprov_red_mat'] == 1)].count()['Aprov_red_mat']

# Valor percentual
aprovados_red_mat_PCT = (aprovados_red_mat_ABS / dados_estudantes['Aprov_red_mat'].count()) * 100

print(f"08 - Quantidade absoluta de aprovados em redação e matemática: {aprovados_red_mat_ABS}\
      \nPercentual de aprovados: {round(aprovados_red_mat_PCT,2)}%\n")

'''09 - Crie um dataframe com os resultados das questões de 1 a 8 que você calculou acima. (Dica: crie um dicionário e depois converta em dataframe do Pandas)'''

dicionario_respostas = {
    'Total_Escolas': [escolasUnicas],
    'Total_Alunos': [total_deAlunos],
    'Total_Orçamento': [orcamento_total],
    'Nota_Média_Redação': [round(mediaRedacao, 2)],
    'Nota_Média_Matemática': [round(mediaMatematica, 2)],
    'Aprov Redação (%)': [round(aprov_redacaoPCT,2)],
    'Aprov Matemática (%)': [round(aprov_MatematicaPCT,2)],
    'Aprov Total (%)': [round(aprovados_red_mat_PCT,2)]
}

df_performanceEscolar = pd.DataFrame(dicionario_respostas)
print('09 - DF com todas as respostas: ')
print(df_performanceEscolar)
print(' \n')



'''10 - Formate as colunas "Total de Estudantes" e "Total Orçamento" ajustando as casas decimais.'''
df_performanceEscolar['Total_Alunos'] = df_performanceEscolar['Total_Alunos'].map("{:,}".format)
df_performanceEscolar['Total_Orçamento'] = df_performanceEscolar['Total_Orçamento'].map("{:,.2f}".format)
print('10 - DF Formatado: ')
print(df_performanceEscolar)
print(' \n')

print('EOQ')


print("\n\t Maiores dificuldades \n\n")
""" -----------------------------------------------      DESAFIOS DE MAIOR DIFICULDADE  ----------------------------------------------- """

'''
11- Entre os alunos aprovados em Redação, qual gênero obteve maior número de aprovações?
'''

print(dados_estudantes.columns)
aprov_red_sexo = dados_full[dados_full['Nota_Redacao'] >= 70]\
                 ['Genero'].value_counts()
print(aprov_red_sexo)
# print(aprov_red_sexo)
print(f"11 - Gênero com maior aprovação foi o Feminino, com {aprov_red_sexo[0]} alunas aprovadas.\n")



'''
12- Entre os alunos aprovados em Matemática, qual gênero obteve maior número de aprovações?
'''
aprov_mat_sexo = dados_estudantes[dados_estudantes['Nota_Matematica'] >= 70]\
                 .groupby('Genero')['Nome_Estudante'].count()

print(f"12 - Gênero com maior aprovação foi em Matemática foi o Feminino, como podemos ver abaixo:\
      \n{aprov_mat_sexo}\
      \n")



'''
13 - Quais os tipos de todas as escolas em nossa base de dados?
'''
tipos_escola = dados_escolas.set_index(["Nome_Escola"])["Tipo_Escola"].sort_values()
print(f"13 - Os tipos de escola são {tipos_escola}\n")



'''
14 - Qual o total de estudantes por escola?
'''
# Duas formas de resolver o mesmo problema:

# 1ª forma abaixo
# total_deAlunos_porEscola = dados_escolas.groupby('Nome_Escola')['Numero_Alunos'].sum()
# print(total_deAlunos_porEscola)

# 2ª forma abaixo:
total_deAlunos_porEscola = dados_estudantes.groupby('Nome_Escola')['ID_Estudante'].count()
print(f"14 - Quantidade de alunos por escola:\
      \n{total_deAlunos_porEscola}\
      \n")



'''
15 - Qual o total de orçamento de cada escola per capita (por estudante)?
'''
# Vou criar uma coluna com no DF "dados-escola", com a divisão do orçamento pela quantidade de alunos
dados_escolas['Orc_Per_Capta'] = dados_escolas['Orcamento_Anual'] / dados_escolas['Numero_Alunos']

filtro_renda_perCapta = dados_escolas.set_index(["Nome_Escola"])["Orc_Per_Capta"].sort_values()

print(f"15 - Renda per capta por escola:\
      \n{filtro_renda_perCapta}\
      \n")



'''
16 - Qual a nota média dos alunos em Redação para cada escola?
'''
print(dados_estudantes.columns)
mediaRedacao_porEscola = dados_estudantes.groupby('Nome_Escola')['Nota_Redacao'].mean().reset_index().round(2)
print(f"16 - Média de notas das redações por escola:\
      \n{mediaRedacao_porEscola}\
      \n")

# % de Aprovados por escola em Redação
aprovados_red = dados_full[(dados_full['Nota_Redacao'] >= 70)]

aprovados_red_PCT_escola = (aprovados_red.groupby(["Nome_Escola"]).count()['Nome_Estudante']\
                            / total_deAlunos_porEscola * 100).round(2)
print(aprovados_red_PCT_escola)


'''
17- Qual a nota média dos alunos em Matemática para cada escola?
'''
mediaMatematica_porEscola = dados_estudantes.groupby('Nome_Escola')['Nota_Matematica'].mean().round(2)
print(f"17 - Média de notas de Matemática por escola:\
      \n{mediaMatematica_porEscola}\
      \n")

# % de Aprovados por escola em Redação
aprovados_Mat = dados_full[(dados_full['Nota_Matematica'] >= 70)]

aprovados_MAT_PCT_escola = (aprovados_Mat.groupby(["Nome_Escola"]).count()['Nome_Estudante']\
                            / total_deAlunos_porEscola * 100).round(2)
print(aprovados_MAT_PCT_escola)


'''
18- Considerando somente os alunos aprovados em Redação, qual a média de alunos aprovados por escola?
'''
media_aprovadosRedacao_escola = dados_estudantes[dados_estudantes['Nota_Redacao'] >= 70]\
                                .groupby('Nome_Escola')['Nota_Redacao'].mean().round(2)
print(f"18 - Média de notas das redações dos aprovados, por escola:\
      \n{media_aprovadosRedacao_escola}\
      \n")

# % de aprovados em redacação



'''
19 - Considerando somente os alunos aprovados em Matemática, qual a média de alunos aprovados por escola?
'''
media_aprovadosMatematica_escola = dados_estudantes[dados_estudantes['Nota_Matematica'] >= 70]\
                                .groupby('Nome_Escola')['Nota_Matematica'].mean().reset_index().round(2)
print(f"19 - Média de notas de Matemática dos aprovados, por escola:\
      \n{media_aprovadosMatematica_escola}\
      \n")


'''
20- Considerando alunos aprovados em Matemática e Redação, qual foi a média de alunos aprovados por escola?
'''
aprovados_geral_porEscola = dados_estudantes[dados_estudantes['Aprov_red_mat'] == 1]\
                          .groupby('Nome_Escola')[['Nota_Matematica', 'Nota_Redacao']]\
                          .mean().reset_index().round(2)
print(f"20 - Média de notas de Matemática/Redação dos aprovados, por escola:\
      \n{aprovados_geral_porEscola}\
      \n")


'''
21 - % De alunos aprovados em MAT e RED por Escolas 
'''
aprovados_geral = dados_full[(dados_full['Nota_Redacao'] >= 70) & (dados_full['Nota_Matematica'] >= 70)]
aprovados_geral_PCT_escola = (aprovados_geral.groupby(["Nome_Escola"]).count()['Nome_Estudante']\
                            / total_deAlunos_porEscola * 100).round(2)
print(aprovados_geral_PCT_escola)



'''

Criando novo DataFrame com resumo de todos os dados obtido até então, para posterios salvamento em formato xls

'''

dataFrame_final_performanceEscolar = pd.DataFrame({
    "Tipo Escola": tipos_escola,
    "Total Estudantes": total_deAlunos_porEscola,
    "Total Orçamento": orcamento_porEscola,
    "Orç Por Estudante": filtro_renda_perCapta,
    "Nota Média Aprov MAT": mediaMatematica_porEscola,
    "% Aprovados MAT": aprovados_MAT_PCT_escola,
    "Nota Média Aprov RED": media_aprovadosRedacao_escola,
    "% Aprovados RED": aprovados_red_PCT_escola,
    "% Aprovados GERAL": aprovados_geral_PCT_escola

})
print(dataFrame_final_performanceEscolar)


""" CRIAÇÃO DE PLANILHA COM OS DADOS DE PERFORMANCE ESCOLAR """
dataFrame_final_performanceEscolar.to_excel('Relatório_Final_Performance_Escolar.xlsx')