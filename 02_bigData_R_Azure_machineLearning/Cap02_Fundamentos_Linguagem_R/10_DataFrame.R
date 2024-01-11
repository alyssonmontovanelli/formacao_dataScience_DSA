# --------------- DATA FRAME --------------------
setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap02_Fundamentos_Linguagem_R")
getwd()


# CRIANDO UM DATAFRAME VAZIO
df <- data.frame()
class(df)
df

# Criando vetores vazios
nomes <- character()
idades <- numeric()
itens <- numeric()
codigos <- integer()

df <- data.frame(c(nomes, idades, itens, codigos))
df

# Criando vetores
pais = c("Portugal", "Inglaterra", "Brasil", "Egito")
nomes <- c("Bruno", "Thiago", "Amanda", "Bianca")
altura = c(1.88, 1.66, 1.87, 1.92)
codigo <- c(5001, 2183, 4702, 7965)

# Criando DF com diversos VETORES
df_vetores <- data.frame(nomes, codigo, altura, pais)
df_vetores


# Adicionando um novo vetor a um dataframe NOVA COLUNA
olhos = c("verde", "Castanho", "Castanho", 'Azul')
df_adicionado = cbind(df_vetores, olhos)
df_adicionado


# -----------------## # #  colhendo informações do DF # ### # --------------#

# INFO sobre o DF
str(df_adicionado)
dim(df_adicionado)
length(df_adicionado)

# OBTENDO COLUNA DO DF
df_adicionado$nomes

# SLICING
df_adicionado[1,3]

# Linhas e COlunas
nrow(df_adicionado)
ncol(df_adicionado)

# Primeiro ELEMENTO  HEAD
head(df_adicionado)
head(mtcars)

# ULTIMOS ELEMENTOS DA PESQUISA
tail(mtcars)
view(mtcars)


# FILTRO EM DATAFRAME
df_adicionado[altura < 1.88,] 
df_adicionado[altura > 1.88, c('olhos', 'pais', 'codigo')]


library(caret)
# ---------- ARQUIVOS CSV -----------# 

# cARREGANDO UM ARQUIVO
?read.csv
pacientes <- data.frame(read.csv(file = 'clientes2.csv', header = TRUE, sep = ','))

View(pacientes)
head(pacientes)
summary(pacientes)


# Chamda das colunas 
pacientes$Nome
pacientes$Idade
mean(pacientes$Idade)


# Representação gráfica
hist(pacientes$Idade)

16%%3

# cOMBINAÇÃo DE DATASET COM MERGE