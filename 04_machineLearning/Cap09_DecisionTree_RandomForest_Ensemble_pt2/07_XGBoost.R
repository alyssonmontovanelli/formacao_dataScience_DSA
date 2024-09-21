getwd()

pitoria <- c(1,2,3,4,5,6,7,8,9,10)


## PROBLEMA DE NEGÓCIO
# Neste exemplo, iremos prever se um cogumelo pode ser comido ou não

# Pacotes
install.packages("xgboost")
install.packages("Ckmeans.1d.dp")
install.packages("DiagrammeR")
library("xgboost")
library("Ckmeans.1d.dp")
library("DiagrammeR")

# Datasets
?agaricus.train

data(agaricus.train, package = "xgboost")
data(agaricus.test, package = "xgboost")

# Coletando subsets de treino e test
dados_treino <- agaricus.train
dados_teste <- agaricus.test

# Resumo dos dados 
str(dados_treino)

# Visualizando as dimensões 
dim(dados_treino$data)
dim(dados_teste$data)

# Classes a serem previstas 
class(dados_treino$data)[1]
class(dados_treino$label)

# View
View(dados_treino) # Dados já estão no formato de matriz esparsa
View(dados_teste)

# Construindo o modelo 
?xgboost

modelo_v1 <- xgboost(data = dados_treino$data,
                     label = dados_treino$label,
                     max.depth = 2,
                     eta = 1, # asasociado a taxa de aprendizado (learning_rate)
                     nthread = 2, # 2 thread para processar em paraleleo
                     nround = 2,
                     objective = "binary:logistic")


# Imprimindo o modelo
modelo_v1

# CONVERTENDO PARA MATRIZ DENSA 
dtrain <- xgb.DMatrix(data = dados_treino$data, label = dados_treino$label)
dtrain

# modelo baseado em matriz densa
modelo_v2 <- xgboost(data = dtrain,
                     max.depth = 2,
                     eta = 1, # asasociado a taxa de aprendizado (learning_rate)
                     nthread = 2, # 2 thread para processar em paraleleo
                     nround = 2,
                     objective = "binary:logistic")

# Imprimendo o modelo
modelo_v2


# Criando um modelo e imprimindo as etapas realizadas
modelo_v3 <- xgboost(data = dtrain,
                     max.depth = 2,
                     eta = 1, # asasociado a taxa de aprendizado (learning_rate)
                     nthread = 2, # 2 thread para processar em paraleleo
                     nround = 2,
                     objective = "binary:logistic",
                     verbose = 2)

modelo_v3

# Previsões
pred <- predict(modelo_v3, dados_teste$data)

# Previsões
print(head(pred))
pred

# Tamanho do vetor de previsões
print(length(pred))

# Transformando as previsões em classificações
predictions <- as.numeric(pred > 0.5)
print(head(predictions))

# Erros
err <- mean(as.numeric(pred > 0.5) != dados_teste$label) # Comparando as previsões com os dados observados
print(paste("test-error = ", err))

# Criando 2 matrizes
dtrain <- xgb.DMatrix(data = dados_treino$data, label = dados_treino$label)
dtest <- xgb.DMatrix(data = dados_teste$data, label = dados_teste$label)


# Criando uma watchlist
watlist <-list(train = dtrain, test = dtest)
watlist # Conjunto de dados para validação


# Criando novo modelo 
modelo_v4 <- xgb.train(data = dtrain,
                       max.depth = 2,
                       eta = 1, # asasociado a taxa de aprendizado (learning_rate)
                       nthread = 2, # 2 thread para processar em paraleleo
                       nround = 2,
                       watchlist = watlist,
                       objective = "binary:logistic")

# Obtendo o label
label = getinfo(dtest, 'label')

# Fazendo previsões 
pred <- predict(modelo_v4, dtest)

# Erros Novamente
err <- as.numeric(sum(as.integer(pred > 0.5) != label))/length(label) # Comparando as previsões com os dados observados
print(paste("test-error = ", err))

# Criando a Matriz de Importância de Atributos
importance_matrix <- xgb.importance(model = modelo_v4)
importance_matrix

