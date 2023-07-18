import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


# O dataset contém registros de corridas de táxi
df = pd.read_csv('dados/dataframe.csv', parse_dates = ['Data'], usecols = list(range(0,6)))

# Análise Exploratória
print(df.head())
print(df.isna().sum())
print(df.shape)
print(df.columns)



""" EXERCÍCIOS """

'''
Exercício 01 - Qual o valor máximo da coluna Minutos?
'''
minutos_max = df['Minutos'].max()
print(f"\n01 - Valor máximo da coluna minutos: {round(minutos_max,2)} minutos\n")


'''
Exercício 02 - Qual o valor mínimo de distância acima de 2.0?
'''
distancia_min = df[df['Distancia'] > 2].agg({'Distancia':'min'})
print(f"\n02 - {round(distancia_min,2)}\n")


'''
Exercício 03 - Crie um plot com a frequência acumulada da coluna Distancia.
'''
