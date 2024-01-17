setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes")
getwd()

## ----- UNLIST  ---------------- CALL ----------------- STRSPLIT ----------------------------- ###

# Unlist()
# Produz um vetor com os elementos da lista

lista1 <- list(6, "b", 15)
lista1
class(lista1)

unlist(lista1)
vec1 <- unlist(lista1)
class(vec1)
vec1

lista2 <- list(v1 = 6, v2 = list(3381, 2190), v3 = c(30,17)) # Transforma a lista em um vetor unico
lista2
unlist(lista2)
mean(unlist(lista2))


# ------------------------- FUNÇÃO DO.CALL() ----------------------------- #
#Função do.call aplica uma função em toda familia de objeto

?do.call

data <- list()
N <- 100

for (n in 1:N){
  data[[n]] = data.frame(index = n, char = sample(letters, 1), z = rnorm(1))
}

head(data)
do.call(rbind, data)
class(do.call(rbind, data))


# DIFERENÇA ENTRE LAPPLY() E DO.CALL()

y <- list(1:3, 4:6, 7:9)
y

lapply(y, sum)
do.call(sum, y)



# --------------- STRSPLIT -------------------------------# 

# Divide a string em diferente partes

texto <- "Testando Botafogo contra Madureira"
strsplit(texto, " ")
strsplit(texto, "")


dates <- c("1998-05-23", "2008-12-30", "2009-11-29")
temp <- strsplit(dates, "-")
temp

# split com dataframe
antes = data.frame(attr = c(1,30,4,6), tipo = c("pao_e_agua", "pao_e_agua_2"))
antes

strsplit(as.character(antes$tipo), '_e_')

# Utilizando do.call para unir os elementos da lista
do.call(rbind, strsplit(as.character(antes$tipo), '_e_')) # Virou matriz


# ------------------------ USANDO PACOTE DPLYR E TIDYR
library(dplyr)
install.packages("tidyr")
library(tidyr)

antes <- data.frame(
  attr = c(1,30,4,6),
  tipo = c("pao_e_agua", "pao_e_agua_2")
)
antes

antes%>% # CARACTER PARA SEPARAÇÃO DO DIPLYR
  separate(tipo, c('pao', 'agua'), '_e_')

class(antes)
