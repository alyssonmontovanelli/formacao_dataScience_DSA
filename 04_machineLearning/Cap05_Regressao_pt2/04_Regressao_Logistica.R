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


###### Pré Processamento dos DADOS #######

# Converter variaveis para o tipo fator (Fatores) - categorização
to.factors <-function(df, variables){
  for (variable in variables){
    df[[variable]] <- as.factor(df[[variable]])
  }
  return(df)
}

# Normalização 
scale.features <- function(df, variables){
  for (variable in variables){
    df[[variable]] <- scale(df[[variable]], center = T, scale = T) # Função scale() para mudar escala da variavel
  }
  return(df)
}


# Normalizando as variaveis
numeric.vars <- c("credit.duration.months", "age", "credit.amount")
credito_dataset_scaled <- scale.features(credito_dataset, numeric.vars)

# Variáveis do tipo fator (Categoricas)
categorical.vars <- c('credit.rating', 'account.balance', 'previous.credit.payment.status', 'credit.purpose',
                      'savings', 'employment.duration', 'installment.rate', 'marital.status', 'guarantor',
                      'residence.duration', 'current.assets', 'other.credits', 'apartment.type', 'bank.credits',
                      'occupation','dependents', 'telephone', 'foreign.worker')

# Aplicando as conversões no dataset
credito_dataset_final <- to.factors(df = credito_dataset_scaled, variables = categorical.vars)
str(credito_dataset_final)
View(credito_dataset_final)


# Preparando dados de treino e teste
indexes <- sample(1:nrow(credito_dataset_final), size = 0.6 * nrow(credito_dataset_final)) # Fatiando 60% dos dados
train.data <- credito_dataset_final[indexes,] # todas as linhas que tiverem o mesmo indice de indexes serão usadas para treino
test.data <- credito_dataset_final[-indexes,] # as demais, para testes
class(train.data)
class(test.data)


# Separando atributos e as classes 
test.feature.vars <-test.data [,-1] # features - preditoras
test.class.var <- test.data[,1] # variavel resposta
class(test.feature.vars)
class(test.class.var)


#################################################################
### CONSTRUINDO O MODELO DE REGRESSÃO LOGÍSTICA ###
formula.init <- "credit.rating ~ ." # ao lado esquerdo do '~' fica a resposta, do direito, as preditoras
formula.init <- as.formula(formula.init) # convertendo a string para objeto tipo "formula"
help(glm)
# Modelando abaixo
modelo_v1 <- glm(formula = formula.init, data = train.data, family = "binomial") # "binomial" representa regressão logistica

# Visualizando detalhes do modelo
summary(modelo_v1)


# Fazendo Previsões e analisando resultados 
View(test.data)
previsoes <- predict(modelo_v1, test.data, type = "response") # retorna a previsao em %
previsoes <-round(previsoes) # retorna valor arredondado 0 e 1
View(previsoes)


# Confusion Matrix - Verificar desempenho do modelo
confusionMatrix(table(data = previsoes, reference = test.class.var), positive = '1')
