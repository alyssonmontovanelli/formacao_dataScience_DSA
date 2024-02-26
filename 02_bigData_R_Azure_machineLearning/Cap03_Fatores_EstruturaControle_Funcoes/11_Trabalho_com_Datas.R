setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes")
getwd()

# ------------------------ Trabalho com DATAS ------------------------------------#

hoje <- Sys.Date()
hoje
Sys.time()
Sys.timezone()


# Data -  representado por Date
# tIME - rEPRESENNTADO POR POSIXct

# -- FORMATANDO DATA
# %d: dia do mês em 2 digitos (13)
# %m: mês em 2 digitos (01)
#y: ano em 2 digitos (82)
# %Y: ano em 4 digitos (1982)
# %A: dia da semana (Friday)
# %a: dia da semana abreviada (Fri)
# %B: mês (july)
#%b: mês abreviado(jul)

# Formatação de sa[ida]
as.Date('2018-06-28')
as.Date('Jun-28-18', format = "%B-%d-%y")

Sys.Date()
format(Sys.Date(), format = "%d / %m / %y")

# Operações com datas
data_de_hoje <- as.Date("2016-06-25", format = "%Y-%m-%d")
data_de_hoje +1
