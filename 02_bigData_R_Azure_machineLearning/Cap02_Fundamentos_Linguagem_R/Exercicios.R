setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap02_Fundamentos_Linguagem_R")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros
vetor <- c(1:30)
length(vetor)

# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros
matriz <- matrix(c(1:16), nr = 4, nc = 4)
matriz

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
lista <- list(vetor, matriz)
lista

# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")

# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e imprima um resumo do dataset
iris
dim(iris)
str(iris)

summary(iris)

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
hist(head(iris$Sepal.Length))


# Exercício 8 - Usando a função subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()
novo_DF <- subset(iris, iris$Sepal.Length > 7)
novo_DF

# Exercícios 9 (Desafio) - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()

install.packages("dplyr")
library(dplyr)
novo_iris <- iris
class(slice(novo_iris, 1:15))
slice(novo_iris, 1:15)


# Exercícios 10 - Use a função filter no seu novo dataframe criado no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter


