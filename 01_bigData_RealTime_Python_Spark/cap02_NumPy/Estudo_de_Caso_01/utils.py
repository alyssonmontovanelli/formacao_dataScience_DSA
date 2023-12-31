import numpy as np

''' Configurando as saídas do NumPy '''
np.set_printoptions(suppress = True, linewidth= 200, precision = 2)


# Carregando dados

dataSet = np.genfromtxt("dados/dataset1.csv",
                        delimiter =';',
                        skip_header = 1,
                        autostrip = True,
                        encoding = 'cp1252')

'''Verificação dos dados'''
# print(dataSet.view())
# print(dataSet.shape)
# print(np.isnan(dataSet).sum())

'''Separando o dataSet em dois conjuntos de dados - um Numérico e outro de String'''

valorCoringa = np.nanmax(dataSet) + 1
# print(valorCoringa)

# Utilizar valor coringa para para preencher os valores NaN das colunas numéricas
media_semNaN = np.nanmean(dataSet, axis= 0)
# print(media_semNaN)

# Colunas do tipo string com valores ausentes
colunas_string = np.argwhere(np.isnan(media_semNaN)).squeeze()
# print(colunas_string)

# Colunas do tipo numérico
colunas_numericas = np.argwhere(np.isnan(media_semNaN) == False).squeeze()
# print(colunas_numericas)

'''
Carregando apenas colunas do tipo String no dataSet
'''

dados_string = np.genfromtxt("dados/dataset1.csv",
                        delimiter =';',
                        skip_header = 1,
                        autostrip = True,
                        usecols = colunas_string,
                        dtype= str,
                        encoding = 'cp1252')
# print(dados_string)

dados_numericos = np.genfromtxt("dados/dataset1.csv",
                        delimiter =';',
                        skip_header = 1,
                        autostrip = True,
                        usecols = colunas_numericas,
                        filling_values  = valorCoringa, #preencher valores ausentes com os coringas
                        encoding = 'cp1252')

# print(dados_numericos)

'''Filtrando nomes das colunas e colocando em cada coluna'''
array_nome_coluna = np.genfromtxt("dados/dataset1.csv",
                                  delimiter =';',
                                  autostrip = True,
                                  skip_footer = dataSet.shape[0],
                                  dtype = str,
                                  encoding = 'cp1252')

# print(array_nome_coluna)

#Separa cabeçalho de colunas String e numercias
header_string, header_numeric = array_nome_coluna[colunas_string], array_nome_coluna[colunas_numericas]

# print(header_numeric)
# print(header_string)

''' Priumeiro Checkpoint'''
# Para salar os resultados intermediários

def checkpoint(file_name, checkpoint_header, checkpoint_data):
    np.savez(file_name, header=checkpoint_header, data = checkpoint_data)
    checkpoint_variable = np.load(file_name + ".npz")
    return(checkpoint_variable)

checkpoint_incial = checkpoint("dados/Checkpoint-Inicial", header_string, dados_string)
# print(checkpoint_incial['data'])

'''Comparar
'''# print(np.array_equal(checkpoint_incial['data'], dados_string))

