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


'''MANIPULANDO AS COLUNAS DO TIPO STRING'''
print(header_string)

# Ajustando o nome da coluna issue_d para facilitar a identificação da coluna
header_string[0] = 'issue_date'
print(header_string)
# print(dados_string)

"""
Pré processamento da variável issue_date com Label Encondig
"""
#Extrai valores unicos da variável
# print(np.unique(dados_string[:,0]))

# Remover o sufixo '-15' e converter em um array de strings
dados_string[:,0] = np.chararray.strip(dados_string[:,0], "-15")

# Novamente extrai os valores unicos após o strip
# print(np.unique(dados_string[:,0]))

# Criando um Array para os meses (incluindo o que está em branco)
meses = np.array(['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])

# Converter nome dos meses em valores numéricos
# Chama-se de Label Econding
for i in range(13):
    dados_string[:,0] = np.where(dados_string[:,0] == meses[i], i, dados_string[:,0])

#Verificando novamente
# print(np.unique(dados_string[:,0]))


"""
Pré processamento da variável loan_status com Binarização
# """
# print(np.unique(dados_string[:,1]))
# print(np.unique(dados_string[:,1]).size)

# Criando array com apenas 3 status
status_bad = np.array(['', 'Charged Off', 'Default', 'Late (31-120 days)'])

# Checando se os valores da coluna estão no array anterior
dados_string[:,1] = np.where(np.isin(dados_string[:,1], status_bad),0,1)

# print(np.unique(dados_string[:,1]))


"""
Pré processamento da variável term com Limpeza de String
"""
#exibir os valores unicos da coluna term
print(np.unique(dados_string[:,2]))

# Strip em "months"
dados_string[:,2] = np.chararray.strip(dados_string[:,2], " months")
print(np.unique(dados_string[:,2]))

# Alterando o valor do titulo da coluna
header_string[2] = "term_months"

# Substituir os valores ausentes pelo maior termo encontrado, no caso, 60

dados_string[:,2] = np.where(dados_string[:,2] == '', '60', dados_string[:,2])
print(np.unique(dados_string[:,2]))

# Mudar tipo do valor, de string para int - '30' para 30


"""
Pré processamento da variável grade e sub_grade com Dicionário (tipo Label Encondig)
"""













