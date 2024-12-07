setwd('C:/formacao_dataScience_DSA/04_machineLearning/Cap08_DecisionTree_RandomForest_Ensemble_pt1')
getwd()

# Calculando a ENTROPIA de duas classes
-0.60 * log2(0.60) - 0.40 * log2(0.40)
-0.50 * log2(0.50) - 0.50 * log2(0.50)

# estudo de caso n2
# ANALISAR O RISCOPARA CONCESSÃO DE CRÉDITOS AOS CLIENTES DE UM BANCO

# Dados
credit <- read.csv("C:/formacao_dataScience_DSA_DADOS/04_machineLearning/Cap08_DecisionTree_RandomForest_Ensemble/credito.csv")
View(credit) # Verificando variaveis
str(credit)

#### ANÁLISE EXPLORATÓRIA DOS DADOS

# Verificando 2 atributos do cliente (talbe para var cat)
table(credit$checking_balance) # saldo c/c
table(credit$savings_balance) # saldo poupança

# Verificando as caracterisiticas do crédito
summary(credit$months_loan_duration)
summary(credit$amount)

# Variável target
table(credit$default)


# DIVIDINDO DADOS DE TREINO E TESTE - utilizando sample
set.seed(123)
train_sample <- sample(1000, 900)

# Split dos dataframes
credit_train <- credit[train_sample, ]
credit_test <- credit[-train_sample, ]

# Verificando proporção dos dados de treino e teste
prop.table(table(credit_train$default))
prop.table(table(credit_test$default))


###############################################
# CONSTRUINDO O MODELO

install.packages("C50")
library(C50)
?C5.0

# Criando e visualizando o modelo
credit_train$default <- as.factor(credit_train$default)

credit_model <- C5.0(credit_train[-17], credit_train$default)
credit_model


# Informações detalhadas sobre a árvore 
summary(credit_model) # Mostrando as variáveis mais relevantes

# Avaliando a performance do modelo
credit_predict <- predict(credit_model, credit_test)

# Confusion Matrix
library(gmodels)
?CrossTable
CrossTable(credit_test$default,
           credit_predict,
           prop.chisq = FALSE,
           prop.c = FALSE,
           prop.r = FALSE,
           dnn = c("Observado", "Previsto"))

# resultado ficou 55/10
#                 20/15 .. não foi bom

##########################################################################################
#
#  MELHORANDO A PERFORMANCE DO MODELO


# Aumentando a precisão com 10 tentativas
credit_boost10 <- C5.0(credit_train[-17], credit_train$default, trials = 10) #treina 10x
credit_boost10
summary(credit_boost10) # para verificar a pct de erros nas passagens e matrix de confusao

# Esse novo modelo criu menos nós, ou seja, o modelo por ter girado 10x, aprendeu mais com menos nós

# Score do modelo
credit_boost_pred10 <- predict(credit_boost10, credit_test)

# Confusion matrix
CrossTable(credit_test$default,
           credit_boost_pred10,
           prop.chisq = FALSE,
           prop.c = FALSE,
           prop.r = FALSE,
           dnn = c("Observado", "Previsto"))


############################################################
# Outra forma de tentar otimizar a árvore de decisão
# Utilizando pesos aos erros

# Criando uma matriz de dimensões de custo
matrix_dimensions <- list(c("no", "yes"), c("no", "yes"))
names(matrix_dimensions) <- c("Previsto", "Observado")
matrix_dimensions

# Construindo a matriz
error_cost <- matrix(c(0,1,4,0), nrow = 2, dimnames = matrix_dimensions)
error_cost

# Aplicando a matrix a árvore
credit_cost <- C5.0(credit_train[-17], credit_train$default, costs = error_cost)

#Score do Modelo
credit_cost_pred <- predict(credit_cost, credit_test)
credit_cost

# Confusion MMatrix
CrossTable(credit_test$default,
           credit_cost_pred,
           prop.chisq = FALSE,
           prop.c = FALSE,
           prop.r = FALSE,
           dnn = c("Observado", "Previsto"))
