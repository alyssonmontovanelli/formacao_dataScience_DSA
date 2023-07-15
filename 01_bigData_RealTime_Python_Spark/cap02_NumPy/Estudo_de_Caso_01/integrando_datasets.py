
from pre_process_string import *
from pre_process_numeric import *

'''
Carregando o segundo dataSet - com dados de cotação USD - EURO /
Cada linha do dataset corresponde a taxa de cambio do mês
'''

# Carregando dados do segundo dataset
dataSet_cot = np.genfromtxt("dados/dataset2.csv",
                            delimiter = ',',
                            autostrip = True,
                            skip_header = 1,
                            usecols = 3)

# print(dataSet_cot)
# print(header_string)
# print(dados_string_int)

# Atribuir a coluna de mês à variável chamada exchange_rate 
exchange_rate = dados_string_int[:,0]
# print(exchange_rate)

'''Verificando a taxa de câmbio para cada mês em que o empréstimo foi feito'''
# Loop para preencher a variável exchange_rate com a taxa correspondente ao mês
# Uso dataSet_cot[i - 1] devido a forma como carreguei os meses para comportar o zero
for i in range(1,13):
    exchange_rate = np.where(exchange_rate == i, dataSet_cot[i-1], exchange_rate)

# print(exchange_rate)

# Caso tenhamos o câmbio igual a 0, substituirei pela média
exchange_rate = np.where(exchange_rate == 0, np.mean(dataSet_cot), exchange_rate)
# print(exchange_rate)

# O shpae de exchange tem que bate com o dataset numerico
# print(exchange_rate.shape)
# print(dados_numericos.shape)

exchange_rate = np.reshape(exchange_rate, (10000,1))

# Concatenação de arrays
dados_numericos = np.hstack((dados_numericos, exchange_rate))

# Inclui o nome da coluna no array de nomes de coluna
header_numeric = np.concatenate((header_numeric, np.array(['exchange_rate'])))
# print(header_numeric)


''' APLICANDO exchange_rate nas colunas que utilizam formato de dólar'''
colunas_dollar = np.array([1,2,4,5])

# print(dados_numericos.shape)

for i in colunas_dollar:
    dados_numericos = np.hstack((dados_numericos, np.reshape(dados_numericos[:,i] / dados_numericos[:,6], (10000,1))))

# print(dados_numericos)



'''
EXPANDIR O CABEÇALHO COM AS NOVAS COLUNAS
'''
header_adicional = np.array([column_name + '_EUR' for column_name in header_numeric[colunas_dollar]])
# print(header_adicional)

header_numeric = np.concatenate((header_numeric, header_adicional))
# print(header_numeric)

# Mudando nome das colunas que são em dólar, para estética da coluna
header_numeric[colunas_dollar] = np.array([column_name + '_USD' for column_name in header_numeric[colunas_dollar]])
# print(header_numeric)

# index de colunas
columns_index_order = [0,1,7,2,8,3,4,9,5,10,6]
header_numeric = header_numeric[columns_index_order]

# print(dados_numericos[:,columns_index_order])


'''Pré Processamento da variável int_rate'''
# print(header_numeric)
# print(dados_numericos[:,5])
dados_numericos[:,5] = dados_numericos[:,5]/100
# print(dados_numericos[:,5])



''' Check point 3'''
checkpoint_numeric = checkpoint("dados/Checkpoint-Numeric", header_numeric, dados_numericos)

# print(checkpoint_numeric['header'])