getwd()

# Criando um dataframe
clima <- expand.grid(Tempo = c("Ensolarado", "Nublado", "Chuvoso"),
                     Temperatura = c("Quente", "Ameno", "Frio"),
                     Humidade = c("Alta", "Normal"),
                     Vento = c("Fraco", "Forte"))

# Visualizando 
View(clima)

# Variável target
response <- c(1, 19, 4, 31, 16, 2, 11, 23, 35, 6, 24, 15, 18, 36)

# Gerando um vetor do tipo fator
play <- as.factor(c("Não Jogar", "Não Jogar", "Não Jogar", "Jogar", "Jogar", "Jogar",
                    "Não Jogar", "Não Jogar", "Não Jogar", "Jogar", "Jogar", "Jogar",
                    "Não Jogar", "Não Jogar"))
# Data frame Final
tennis <- data.frame(clima[response,],play)
View(tennis)

#--------------------------
# Carregando o pacote 
install.packages('rpart')
library(rpart)

# Criando o modelo 
?rpart
?rpart.control
tennis_tree <- rpart(play ~ .,
                     data = tennis,
                     method = "class",
                     parms = list(split = "information"), # Ganho de Informação 
                     control = rpart.control(minsplit = 2)) # Partições d


# Visualizando o ganho de informção (Entropia) de cada atributo
tennis_tree

# Para melhor visualização
install.packages("rpart.plot")
library(rpart.plot)

# PLOTAGEM
?prp
prp(tennis_tree, type = 0, extra = 1, under = TRUE, compress = TRUE)


# ------------------------------------------------------
# Fazendo PREVISÕES COM NOVOS DADOS
clima2 <- expand.grid(Tempo = c("Ensolarado", "Nublado", "Chuvoso"),
                     Temperatura = c("Quente", "Ameno", "Frio"),
                     Humidade = c("Alta", "Normal"),
                     Vento = c("Fraco", "Forte"))

# Variável targets
response2 <- c(2, 20, 3, 33, 17, 4,5)


# novos dados 
novos_dados <- data.frame(clima[response2,])
View(novos_dados)

# PREVISÕES
predict(tennis_tree, novos_dados)
# PICA!! as previsões seguem direitinho a plotagem da arvore
