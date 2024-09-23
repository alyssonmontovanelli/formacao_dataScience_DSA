getwd()

# continuação do Script anterior - PRÉ PROCESSAMENTO DOS DADOS

library(dplyr)
library(caret)
library(gains) # interpreta o modelo SVM
library(pROC) # Curva ROC
library(ROCR) # metrica 
library(ROSE) # manipulação de dado
library(e1071) # SVM
library(mice) # limpeza de dados

dataset_clientes <- read.csv("C:/formacao_dataScience_DSA_DADOS/04_machineLearning/Cap11_SVM/dados/cartoes_clientes.csv")
dataset_clientes <- dataset_clientes[-1]
View(dataset_clientes)

# Pré Processamento dos dados
# Função para Fatorização de variáveis categóricas
to.factors <- function(df, variables){
  for(variable in variables){
    df[[variable]] <- as.factor(paste(df[[variable]]))
  }
  return(df)
}

# lista de variáveis categoricas
str(dataset_clientes)
categorical.vars <- c("townsize", "jobcat", "retire", "hometype", "addresscat",
                      "cartype", "carvalue", "carbought", "card2", "card2type", "card2benefit",
                      "bfast", "internet", "Customer_cat")

# Fatorização das variaveis
dataset_clientes2 <- to.factors(df = dataset_clientes, variables = categorical.vars)
str(dataset_clientes2)
View(dataset_clientes2)


###### APLICANDO IMPUTAÇÃO NOS VALORES MISSING ######
# Checando os valores missing novamente
sapply(dataset_clientes2, function(x)sum(is.na(x)))
sum(is.na(dataset_clientes2))

# Aplicando Imputação em Valores Missing Usando Método PMM (Predictive Mean Matching) - Correspondencia Média Preditiva

# A correspondência média preditiva (PMM) é uma maneira atraente de fazer imputação múltipla para dados 
# ausentes, especialmente para imputar variáveis quantitativas que não são normalmente distribuídas. 

# Variável dummy
# Variável sexo = 0 ou 1
# sexo_M = 1
# sexo_F = 0

# Comparado com métodos padrão baseados em regressão linear e distribuição normal, o PMM produz valores 
# imputados que são muito mais parecidos com valores reais. Se a variável original estiver inclinada, os 
# valores imputados também serão inclinados. Se a variável original estiver delimitada por 0 e 100, os 
# valores imputados também serão delimitados por 0 e 100. E se os valores reais forem discretos 
# (como número de filhos), os valores imputados também serão discretos. 

# Descobrindo os números das colunas das variáveis fatores, para excluí-las da imputação
