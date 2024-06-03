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


##### FEATURE SELECTION - VERIFICANDO IMPORTÂNCIA DAS VARIÁVEIS
formula <- "credit.rating ~ ."
formula <- as.formula(formula)
control <- trainControl(method = "repeatedcv", number = 10, repeats = 2) # caret - repete o processo varias vezes
model <-train(formula, data = train.data, method = 'glm', trControl = control)
importance <- varImp(model, scale = FALSE)

## PLOT 
plot(importance)


##### ---------------------------------------------------------------
# CONSTRUINDO NOVO MODELO COM AS VARIÁVEIS SELECIONADAS
# UTILIZAREI AS MAIS IMPORTANTES DA VIDA 
formula.new <- "credit.rating ~ account.balance + credit.purpose + previous.credit.payment.status + savings + credit.duration.months"
formula.new <- as.formula(formula.new)
modelo_v2 <- glm(formula = formula.new, data = train.data, family = 'binomial')


# Prevendo e avaliando o modelo
previous_new <- predict(modelo_v2, test.data, type = 'response')
previous_new <- round(previous_new)

# Confusion Matrix
confusionMatrix(table(data = previous_new, reference = test.class.var), positive = '1')

#### ---------------------------------------------------
# Avaliando a performance do modelo
modelo_final <- modelo_v2
previsoes <- predict(modelo_final, test.feature.vars, type = 'response')
avaliacao <- prediction(previsoes, test.class.var)

# Função para Plot ROC
plot.roc.curve <- function(predictions, title.tex){
  perf <- performance(avaliacao, "tpr","fpr")
  plot(perf, col = 'black', lty = 1, lwd = 2,
       main = title.text, cex.main = 0.6, cex.lab = 0.8, xaxs = 'i', yaxs = 'i')
  abline(0,1, col = 'red')
  auc <- performance(avaliacao, 'auc')
  auc <- unlist(slot(auc, 'y.values'))
  auc <- round(auc,2)
  legend(0.4,0.4,legend = c(paste0("AUC: ",auc )), cex = 0.6, bty = 'n', box.col = 'white')
  
}

# PLot
par(mfrow = c(1,2))
plot.roc.curve(avaliacao, title.text = "Curva ROC")

##### ---------------------------------------------------------
# Fazendo previsões em novos dados

# Novos dados
account.balance <- c(1,3,3,2)
credit.purpose <- c(4,2,3,2)
previous.credit.payment.status <- c(3,3,2,2)
savings <- c(2,3,2,3)
credit.duration.months <- c(15,12,8,6)

# Criando novo dataframe 
novo_datatset<- data.frame(account.balance,
                           credit.purpose,
                           previous.credit.payment.status,
                           savings,
                           credit.duration.months)
class(novo_datatset)
View(novo_datatset)


# Separa variáveis exploratórias numericas e categoricas
new.numeric.vars <- c("credit.duration.months")
new.categorical.vars <- c("account.balance", "credit.purpose", "previous.credit.payment.status", "savings")

# Aplicando as transformações
novo_dataset_final <- to.factors(df = novo_datatset, variables = new.categorical.vars)
str(novo_dataset_final)

novo_dataset_final <- scale.features(novo_dataset_final, new.numeric.vars)
str(novo_dataset_final)

View(novo_dataset_final)



# PREVISÕES
previsoes_novo_cliente <- predict(modelo_final, newdata = novo_dataset_final, type = "response")
round(previsoes_novo_cliente)
