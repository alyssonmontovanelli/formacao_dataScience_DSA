from integrando_datasets import *

'''CONSTRUINDO DATASET FINAL'''

print(checkpoint_numeric['data'].shape)
print(checkpoint_strings['data'].shape)


# Concatenar os arrays
df_final = np.hstack((checkpoint_numeric['data'], checkpoint_strings['data']))

print(df_final)

# Verificando novamente se existe valor ausente
print(np.isnan(df_final).sum())

# Concatenar os arrays de nomes das colunas
header_full = np.concatenate((checkpoint_numeric['header'], checkpoint_strings['header']))


# Ordenando DATASET por ID
df_final = df_final[np.argsort(df_final[:,0])]
print(df_final)



''' GRAVANDO DATASET FINAL LIMPO E ORDENADO EM DISCO '''
# Concatena o array de nomes de colunas com array de dados
df_final = np.vstack((header_full, df_final))

# Salva em disco
np.savetxt("dados/datasetFINAL_limpo_processado.csv",
           df_final,
           fmt = '%s',
           delimiter= ',')
