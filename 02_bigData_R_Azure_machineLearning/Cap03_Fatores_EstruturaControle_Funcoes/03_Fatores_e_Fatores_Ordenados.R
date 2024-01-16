setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes")
getwd()

vec1 <- c("Macho", "Femea", "Femea", "Macho", "Macho")
vec1

# Criando fator
fac_vec1 <- factor(vec1)
fac_vec1

# Classe
class(vec1)
class(fac_vec1)

# Novo Ezemplo
animais = c("Zebra", "Elefante", "Pantera", "Zebra", "Zebra", "Macaco")
animais
fac_animais <- factor(animais)
fac_animais
class(fac_animais)
levels(fac_animais)


# Variáveis Categoricas Ordinais
# POSSUEM ORDEM NATURAL

grad <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado")
grad

fac_grad <- factor(grad, order= TRUE, levels = c("Doutorado", "Mestrado", "Bacharelado"))
# COM O ACIMA, TEMOS O RANKING, PORÉM AS QUANTIDAS SÓS ERÃO PEGAS COM SUMMARY
fac_grad                   

summary(fac_grad)
summary(grad)


vec2 <- c("M", "M", "F", "F", "F", "M", "M", "F", "M", "M", "F","M")
vec2
fac_vec2 <- factor(vec2)
fac_vec2
levels(fac_vec2) <- c("Femea", "Macho")
fac_vec2
summary(fac_vec2)
summary(vec2)


# Mais Exemplos
data = c(1,2,2,9,3,4,5,6,7,8,8,8,8,8,9,1,2,5,4,6,2,1,8,7,9,4,3,1,2,2,7)
data
fdata = factor(data)
fdata
summary(fdata)


rdata = factor(data, labels = c("Um", "Dois", "Três", "Quatro", "Cinco", "Seis", "Sete", "Oito", "Nove"))


# Fatores Ordenados 
set1 <- c("CC", "B", "CA", "AA", "BA", "CB")
f_set <-factor(set1)
f_set
# Verificando se está ordenado
is.ordered(f_set) # Retorna FALSE

o.set <- factor(set1,
                levels = c("AA", "BA", "B", "CA", "CB", "CC"),
                ordered = TRUE)
o.set


## ---------------------- CARREGANDO ARQUIVO CSV ------------------ ##

df <- fread("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes/03_etnias.csv")
df
View(df)

# Verificando tipos das variaveis do DF
str(df)

# Variável original (antes da transformação)
levels(df$Etnia)
summary(df$Etnia)

# Verificando quantidade das ocorrências com Factor
df$Etnia <- as.factor(df$Etnia)
levels(df$Etnia)
summary(df$Etnia)

# PLOTAGEM
boxplot(df$Idade ~ df$Etnia, xlab = 'Etnia', ylab = "Idade", main = "Idade por Etnia")


# REGRESSÃO 
summary(lm(Idade ~Etnia, data = df))


# Verificando novamente o STR
str(df)
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels = c("Solteiro", "Casado", "Divorciado"))
df
