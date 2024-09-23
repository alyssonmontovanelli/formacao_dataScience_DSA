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
categorical.vars <- c("townsize", "gender", "birthmonth", "jobcat", "retire", "hometype", "addresscat",
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
fac_col <- as.integer(0)
fac_names <- names(Filter(is.factor,dataset_clientes2)) # variaves com tipo fator
k = 1
fac_names

# Método para pegar a localização de cada cada coluna do tipo fator
for(i in fac_names){
  while (k <= 16){
    grep(i, colnames(dataset_clientes2)) # Buscar o nome da coluna dentro do conjunto de dados
    fac_col[k] <- grep(i, colnames(dataset_clientes2))
    k = k + 1
    break
  }
}

# Colunas que são do tipo fator
fac_col

# Imputação

# Fatiamento do dataset
View(dataset_clientes2)
View(dataset_clientes2[,-c(fac_col)]) # Removendo todas as do tipo fator

####### Definindo regra de imputação com PMM ######
?mice
regra_imputacao <- mice((dataset_clientes2[,-c(fac_col)]),
                         m = 1, # processamento
                         maxit = 50, #maximo de interaçãoes
                         meth = "pmm", #"PMM"
                         seed = 500)

# aPLICANDO A REGRA DE IMPUTAÇÃO 
?mice::complete
total_data <- complete(regra_imputacao, 1)
View(total_data)
#Verificando os valorers missisng dps da imputação
sapply(total_data, function(x)sum(is.na(x)))

#### Unindo novamente as variaveis categóricas ####
dataset_clientes_final <- cbind(total_data, dataset_clientes2[,c(fac_col)])
View(dataset_clientes_final)

# Dimensções
dim(dataset_clientes_final)

# tipos de dados
str(dataset_clientes_final)
str(dataset_clientes_final$Customer_cat)


#### DIVIDINDO OS DADOS EM TREINO E TESTE ####
# Motivo: Os dados estão desbalanceados - Devemos balancear os dados de TREINO 

set.seed(100)

# índice de divisão dos dados
indice_divide_dados <- sample(x = nrow(dataset_clientes_final),
                              size = 0.8 * nrow(dataset_clientes_final),
                              replace = FALSE) # Amostragem sem subsitutição no df original
View(indice_divide_dados)

# Aplicando o índice
dados_treino = dataset_clientes_final[indice_divide_dados,]
dadps_teste = dataset_clientes_final[-indice_divide_dados,]

# Checando o balanceamento de classe da variável target
prop.table(table(dados_treino$Customer_cat)) * 100

# Podemos ver que os dados apresentam um desequilíbrio alto com:
# 2% high_spend_cust, 30% low_spend_cust enquanto a maioria de 68% é medium_spent_cust
# Vamos balancear a classe usando Oversampling com SMOTE.

# Balanceamento de Classe com SMOTE
# Oversampling x Undersampling

# Seed
set.seed(301)

# Pacote
# Pacote
install.packages("DMwR")
library(DMwR)

# SMOTE - Synthetic Minority Oversampling Technique
?SMOTE
dados_treino_balanceados <- SMOTE(Customer_cat ~ ., dados_treino, perc.over = 3000, perc.under = 200)
dados_treino_balanceados <- SMOTE(dados_treino, 
                                  Customer_cat ~ .)
# Checando o balanceamento de classe da variável target
prop.table(table(dados_treino_balanceados$Customer_cat)) * 100

# Salvando os datasets após o pré-processamento
class(dados_treino_balanceados)
class(dados_teste)
