# PREVISÃO DE UP OU DOWN DA BOLSA DE VALORES AMERCIANA (NASDAQ)

getwd()
setwd('C:/formacao_dataScience_DSA/04_machineLearning/Cap06_KNN_Classificador_K-Nearest-Neighbours')


# instalando pacotes 
install.packages('ISLR')
install.packages('caret')
install.packages('e1071')


# Carregando pacotes
library(ISLR)
library(caret)
library(e1071)

# Definindo o seed
set.seed(300)

# Carregando o dataset e explorando
summary(Smarket)
str(Smarket)
head(Smarket)


# SPLIT do dataset em treino e teste
indxTrain <- createDataPartition(y = Smarket$Direction, p= 0.75, list = FALSE)
View(indxTrain)
dados_treino <- Smarket[indxTrain,]
dados_teste <- Smarket[-indxTrain,]


# Verificando a distribuição dos dados originais e das partições (mostrando que os dados estão bem divididos)
prop.table(table(Smarket$Direction)) * 100
prop.table(table(dados_treino$Direction)) * 100


# Correlação entre as variáveis preditoras
descrCor <- cor(dados_treino[,names(dados_treino) != "Direction"])
descrCor
# Se antes da linha está vazio, eu quero todas as linhas


#### --------------------------
# NORMALIZAÇÃO DOS DADOS 


# A transformação de "scale" calcula o desvio padrão para um atributo e divide 
# cada valor por esse desvio padrão.

# A transformação "center" calcula a média de um atributo e a subtrai de cada valor.

# Função de Normalização
scale.features <- function(df, variables){
  for (variable in variables){
    df[[variable]] <- scale(df[[variable]], center = T, scale = T)
  }
  return(df)
}



# REMOVENDO A VARIÁVEL TARGET DOS DADOS DE TREINO E TESTE
numeric.vars_treino <- colnames(treinoX <- dados_treino[,names(dados_treino) != "Direction"])
numeric.vars_teste <- colnames(treinoX <- dados_teste[,names(dados_teste) != "Direction"])

# Aplicando normalização às variáveis preditoras de treino e teste
dados_treino_scaled <- scale.features(dados_treino, numeric.vars_treino)
dados_teste_scaled <- scale.features(dados_teste, numeric.vars_teste)
View(dados_treino_scaled)
View(dados_teste_scaled)


############## ------------------------------------
# Classificação KNN em R - Construção e Treinamento do Modelo
set.seed(400)
?trainControl # parametros de controle para o treinamento
?train


# Arquivo de CONTROLE
ctrl <- trainControl(method = "repeatedcv", repeats = 5)

# --------------------- CRIAÇÃO DO MODELO -------------------------#
knn_v1 <- train(Direction ~ .,
                data = dados_treino_scaled,
                method = "knn",
                trControl = ctrl,
                # preProcess = c("center","scale"), # Isso é a normalização 
                tuneLength = 20)

# MODELO KNN
knn_v1


# PLOTAGEM 
plot(knn_v1)

# COM R, O PROPRIO TREINAMENTO JÁ PEGA O MELHOR VALOR DE K E UTILIZA.. INCRIVEL

# Fazendo previsões
knnPredict <- predict(knn_v1, newdata = dados_teste_scaled)
knnPredict


# Criando MATRIX DE CONFUSÃO 
confusionMatrix(knnPredict, dados_teste$Direction)
# Com isso, chegamos a acc de 88%


########### ---------------------------------------------- ##############

# CLassificação KNN em R - APLICANDO OUTRAS MÉTRICAS para tentar melhorar o modelo 

# Arquivo de controle
ctrl <- trainControl(method = "repeatedcv",
                     repeats = 5,
                     classProbs = TRUE,
                     summaryFunction = twoClassSummary)

# Treinamento do modelo
knn_v2 <- train(Direction ~ .,
                data = dados_treino_scaled,
                method = 'knn',
                trControl = ctrl,
                metric = "ROC", # essa é a mudança, nao usaremos apenas acuracia
                tuneLength = 20)

# MODELO KNN
knn_v2


# Numero de vizinhos x Aacurácia
plot(knn_v2, print.thres = 0.5, type = "S")
# k = 41

# Criando confusion Matrix
confusionMatrix(knnPredict, dados_teste$Direction)

# NO exemplo do professor, acc subiu para 90%, mas no meu manteve 88%, porem é uma
# forma diferente de testar e avaliar o modelo


#### ---------------------------------------------------------------------------------------------

# Previsões com novos dados

# Preparando dados de entrada
Year = c(2006, 2007, 2008)
Lag1 = c(1.30, 0.09, -0.654)
Lag2 = c(1.483, -0.198, 0.589)
Lag3 = c(-0.345, 0.029, 0.690)
Lag4 = c(1.398, 0.104, 1.483)
Lag5 = c(0.214, 0.105, 0.589)
Volume = c(1.36890, 1.09876, 1.231233)
Today = c(0.289, -0.497, 1.649)

novos_dados = data.frame(Year, Lag1, Lag2, Lag3, Lag4, Lag5, Volume, Today)
novos_dados
str(novos_dados)
class(novos_dados)

# Normalizando os dados

# Extraindo os nomes das variáveis
nomes_variaveis <- colnames(novos_dados)
nomes_variaveis

# Aplicando a função
novos_dados_scaled <- scale.features(novos_dados, nomes_variaveis)
novos_dados_scaled
str(novos_dados_scaled)
class(novos_dados_scaled)

# Fazendo previsões
knnPredict <- predict(knn_v2, newdata = novos_dados_scaled)
cat(sprintf("\n Previsão de \"%s\" é \"%s\"\n", novos_dados$Year, knnPredict))
