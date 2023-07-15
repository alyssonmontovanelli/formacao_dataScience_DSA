from utils import *

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

# Como grade e sub_grade representam a mesma informação praticamente, utilizarei a 
# variável sub_grade, por conter mais detalhes

# Loop para ajuste de variável sub_grade
for i in np.unique(dados_string[:,3])[1:]:
    dados_string[:,4] = np.where((dados_string[:,4] == '') & (dados_string[:,3] == i), i + '5', dados_string[:,4])

# print(np.unique(dados_string[:,4], return_counts = True))

# Substituir valor ausente
dados_string[:,4] = np.where(dados_string[:,4] == '', 'H1', dados_string[:,4])
# print(np.unique(dados_string[:,4]))

# Deletando a variável 'grade'
dados_string = np.delete(dados_string, 3, axis=1)
header_string = np.delete(header_string, 3)

# Sub grade passou para indice 3
# print(header_string[3])

# Conversão do sub_grade para variável numérica
# DICIONÁRIO
keys = list(np.unique(dados_string[:,3]))
# print(keys[0])

valores = list(range(1, np.unique(dados_string[:,3]).shape[0] + 1))
# print(valores[0])

# Criando o dicionário
dict_sub_grade = dict(zip(keys, valores))
# print(dict_sub_grade)

# Loop para substituir as strings pelos valores correspondentes do tipo int
for i in np.unique(dados_string[:,3]):
    dados_string[:,3] = np.where(dados_string[:,3] == i, dict_sub_grade[i], dados_string[:,3])

# print(np.unique(dados_string[:,3]))



"""
Pré processamento da variável verification_status com Binarização
"""

# print(np.unique(dados_string[:,4]))

status_binario = {
    '': 0,
    'Not Verified': 0,
    'Source Verified': 1,
    'Verified': 1
}

for i in np.unique(dados_string[:,4]):
    dados_string[:,4] = np.where(dados_string[:,4] == i,
                                 status_binario[i], dados_string[:,4])

# print(np.unique(dados_string[:,4]))



"""
Pré processamento da variável url com extração do ID no final
"""

# Tirando o inicio da URL, para pegar somente o ID 
dados_string[:,5] = np.chararray.strip(dados_string[:,5], 'https://www.lendingclub.com/browse/loanDetail.action?loan_id=')

# deixando os dados com o tipo inteiro
dados_string[:,5].astype(dtype= np.int32)
# print(dados_string[:,5])

# Como a variável url possui os IDS que são os mesmos da coluna ID, vou excluir essa variável 
# e ficar apenas com a variável ID
dados_string = np.delete(dados_string, 5, axis = 1)
header_string = np.delete(header_string, 5 )


"""
Pré processamento da variável addr_state / SEPARANDO POR ESTADO - CATEGORIZAÇÃO
"""
# print(np.unique(dados_string[:,5]))

# Renomear a variavel
header_string[5] = "state_address"

#Expressão abaixo retorna dois dados, o nome da variavel e a ocorrência dela
states_name, states_count = np.unique(dados_string[:,5], return_counts=True)
# print(states_name, states_count)

# Ordenar de forma decrescente com o numero de ocorrências
state_counts_sorted = np.argsort(-states_count)

# Resultado 
# print(states_name[state_counts_sorted], states_count[state_counts_sorted])

# Substituir valores ausentes por 0
dados_string[:,5] = np.where(dados_string[:,5] == '', 0, dados_string[:,5])

# Separando cada estado por região do país
states_west = np.array(['WA', 'OR', 'CA', 'NV', 'ID', 'MT', 'WY', 'UT', 'CO', 'AZ', 'NM', 'HI', 'AK'])
states_south = np.array(['TX', 'OK', 'AR', 'LA', 'MS', 'AL', 'TN', 'KY', 'FL', 'GA', 'SC', 'NC', 'VA', 'WV', 'MD', 'DE', 'DC'])
states_midwest = np.array(['ND', 'SD', 'KS', 'NE', 'MN', 'IA', 'MO', 'WI', 'IL', 'IN', 'MI', 'OH'])
states_east = np.array(['PA', 'NY', 'NJ', 'CT', 'MA', 'VT', 'NH', 'ME', 'RI'])

# Substituindo cada estado por valor referente à região do país
dados_string[:,5] = np.where(np.isin(dados_string[:,5], states_west), 1, dados_string[:,5])
dados_string[:,5] = np.where(np.isin(dados_string[:,5], states_south), 2, dados_string[:,5])
dados_string[:,5] = np.where(np.isin(dados_string[:,5], states_midwest), 3, dados_string[:,5])
dados_string[:,5] = np.where(np.isin(dados_string[:,5], states_east), 4, dados_string[:,5])

# print(np.unique(dados_string[:,5]))


""" CONVERTENDO DADOS_STRING"""

print(dados_string)

#convertendo para ter apenas valores do tipo int
dados_string = dados_string.astype(int)
dados_string_int = dados_string.copy()
# print(dados_string.dtype)

'''CHECKPONIT 2'''
checkpoint_strings = checkpoint("dados/Checkpoint-String", header_string, dados_string)
np.array_equal(checkpoint_strings['data'], dados_string)







