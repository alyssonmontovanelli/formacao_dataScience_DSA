# REGRESSÃO LOGÍSTICA

# previsão de risco de crédito

# Definindo diretório do trabalho
setwd('C:/formacao_dataScience_DSA/04_machineLearning/Cap05_Regressao_pt2')
getwd()

# Instalando Pacotes 
install.packages("caret") # machine learning
install.packages("ROCR") # Permite criar curva de avaliação do modelo
install.packages("e1071") # FUnções e algoritmos uteis

# Carregando Pacotes
library(caret)
library(ROCR)
library(e1071)

# Carregando o dataset em um dataframe 
credito_dataset <- read.csv("C:/formacao_dataScience_DSA_DADOS/04_machineLearning/Cap05_Regressao_pt2/dados/R/credit_dataset_final.csv",
                            header = TRUE,
                            sep = ',')
head(credito_dataset)
summary(credito_dataset)
str(credito_dataset)
View(credito_dataset)


# Pré Processamento dos DADOS

