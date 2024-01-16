setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes")
getwd()


# CRIANDO VETORES
vec1 <- c(1001, 1002, 1003, 1004, 1005)
vec2 <- c(0,1,1,0,2)
vec3 <- c('Verde', 'Laranja', 'Azul', 'Laranja', 'Verde')

# UNINDO VETORES EM DF
df <- data.frame(vec1, vec2, vec3)
df
View(df)

# Verificando com o R categorizou a variável
str(df)

# Verificando Niveis
levels(df$vec3)

# CRIANDO NOVA COLUNA E ATRIBUINDO LABELS
df$cat1 <- factor(df$vec3,
                  labels = c("cor2", "cor1", "cor3"))
df
str(df)

df$vec3 <- factor(df$vec3)
str(df)


# CRIANDO NOVA COLUNA E ATRIBUNDO VEC2
df$cat2 <- factor(df$vec2,
                  labels = c("Divorciado", "Solteiro", "Casado"))
df
str(df)
levels(df$cat2)
levels(df$cat1)
