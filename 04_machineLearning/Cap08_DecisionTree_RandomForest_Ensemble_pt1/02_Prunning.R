getwd()
setwd('C:/formacao_dataScience_DSA/04_machineLearning/Cap08_DecisionTree_RandomForest_Ensemble_pt1')

# Gerando o dataset
data(Titanic, package = "datasets")

View(Titanic)

# Criando o dataframe
dataset <- as.data.frame(Titanic)

# Carregando o pacote 
library(rpart)

# Criando o modelo
?rpart
titanic_case <- rpart(Survived ~ Class + Sex + Age,
                      data = dataset,
                      weights = Freq, # COLUNA FREQUENCIA COMO PESO PARA OS NÓS DA ARVORE
                      method = "class",
                      parms = list(split = "information"),
                      control = rpart.control(minsplit = 5))

titanic_case

# Plotando
?rpart.plot
library(rpart.plot)

prp(titanic_case, type = 0, extra = 1, under = TRUE, compress = TRUE)

####### APLICANDO PRUNNING (PODA) NA ÁRVORE DE DECISÃO 
pruned_titanic_tree <- prune(titanic_case, cp = 0.02) # c.p É O custo/complexidade, limita o numero de nós folha
pruned_titanic_tree

# IMPRIMINDO ÁRVORE ANTES E DEPOIS DO PRUNE

# Antes do Prunning
prp(titanic_case, type = 0, extra = 1, under = TRUE, compress = TRUE)

# Depois do Prunning
prp(pruned_titanic_tree, type = 0, extra = 1, under = TRUE, compress = TRUE)

# Isso tudo reduz um pouco a previsão do modelo, principalemnte
# quando ele está sofrendo de overfiting