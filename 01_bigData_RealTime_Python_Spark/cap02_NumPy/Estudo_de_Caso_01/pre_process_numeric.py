from utils import *

# #Visualização dos dados
# print(dados_numericos)
# #Nome das colunas
# print(header_numeric)

''' Não há valor ausente, pois preenchemos com valores coringas'''
# Checar se a coluna tem valor coringa
# print(np.isin(dados_numericos[:,0], valorCoringa).sum())

# Criação de array estatístico, para substituição dos valores ausentes
arr_stats = np.array([np.nanmin(dataSet, axis=0), media_semNaN, np.nanmax(dataSet, axis = 0)])
# print(arr_stats)

# Array de estatísticas para colunas numéricas
# print(arr_stats[:, colunas_numericas])


'''PRÉ PROCESSAMENTO'''

''' 
PRÉ PROCESSAMENTO VARIÁVEIS - funded_amnt
'''
# visualiza dados
# print(dados_numericos[:,2])

# Verificando a estatística da variável
# print(arr_stats[0, colunas_numericas[2]])

# Aplico esse valor aos valores coringas
dados_numericos[:,2] = np.where(dados_numericos[:,2] == valorCoringa, 
                                arr_stats[0, colunas_numericas[2]], dados_numericos[:,2])
# print(dados_numericos[:,2])


'''
PRÉ PROCESSAMENTO VARIÁVEIS - loan_amnt / int_rate / installment / total_pymnt
'''
# Loop para substituir o valor ausente (valor coringa) pelos valores do array estatístico
for i in [1,3,4,5]:
    dados_numericos[:,i] = np.where(dados_numericos[:,i] == valorCoringa,
                                    arr_stats[2, colunas_numericas[i]],
                                    dados_numericos[:,i])
  
# print(dados_numericos)