setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes")
getwd()


# ---------------- FAMÍLIA APPLY ------------------------------------ #

# apply() - arrays e matrizes
# tapply() - os vetores podem ser divididos em diferentes subsets
# sapply() - vetores e listas
# vapply() - similar a sapply, com valor de retorno modificado
# rapply() - similar a lapply()
# eapply() - gera uma lista
# mapply() - Similar ao sapply, multivariada
# by

# ------------------------------------------------------------------# 

# Se estiver trabalhando com objetos:

# List, numeric, character (list/vecor) => sapply ou lapply
# matrix, data.frame (agregação por coluna) => by / tapply
# Operações por linha ou operações especificas => apply

# ----------------------------------------------------------------# 


# Usando um loop
lista1 <- list(a = (1:20), b = (35:67))
lista1


# Comparando com loop for
soma_a = 0
soma_b = 0

for(n in lista1$a){
  soma_a = soma_a + n
}

for(n in lista1$b){
  soma_b = soma_b + n
}
soma_a
soma_b

# Agora fazendo a mesma operação com apply
?sapply

sapply(lista1, sum) # retorna a soma de cada elemento

sapply(lista1, mean)

# ------------------------- APPLY() ------------------------------ #
?apply
x <- matrix(c(10,13,65,10,45,12,10,49,82), nr = 3, byrow = T)
x

apply(x, mean)
apply(x, 1, mean) # MÉDIA DAS LINHAS
apply(x, 2, mean) # MÉDIA DAS COLUNAS
apply(x, 2, sum)
apply(x, 1, plot)

result_apply <- apply(x,1,mean)
result_apply
typeof(result_apply)


# ----------------------- aplicnaod APPLY() em DATA.FRAME ---------------#

escola <- data.frame(Aluno = c("Bob", "Júlia", "Marta"),
                     Fisica = c(91, 100, 58),
                     Matematica = c(99, 87, 79),
                     Quimica = c(77,88,99))
escola
escola$Matematica

# Calculando Média por aluno 
escola$Media = NA
escola$Media = apply(escola[, c(2, 3, 4)], 1, mean) # Preenchendo nova coluna com os dados 
escola$Media = round(escola$Media)
escola


#---------------------- TAPPLY() -------------------------------------#
?gl

# Criando DF com dados aleatorios
tabela_basquete <-
  data.frame(equipe = gl(5,5, labels = paste("Equipe", LETTERS[1:5])),
             jogador = sample(letters, 25),
             num_cestas = floor(runif(25, min=0, max=50)))

tabela_basquete

# TAPPLY() VS SQLDF
install.packages('sqldf')
library(sqldf)


sqldf(" select equipe, sum(num_cestas) from tabela_basquete group by equipe")

tapply( tabela_basquete$num_cestas, tabela_basquete$equipe, sum) #tapply e´como se fosse o group by
tapply( tabela_basquete$num_cestas, tabela_basquete$equipe, mean)
# Primeira coluna farei a operação, já a segunda é a coluna de agrupamento



# ----------------------------  trabalhando com o BY() ---------------------- #
?by

dat <- data.frame(species = c(rep(c(1,2,3), each = 5)), petal.length = c(rnorm(5,4.5,1), rnorm(5,4.5,1), rnorm(5,5.5,1)),
                  petal.width = c(rnorm(5,2.5,1), rnorm(5,2.5,1), rnorm(5,4,1)))
dat
str(dat)
summary(dat)

dat$species <- factor(dat$species)
str(dat)

# APLICANDO BY - TEM QUE SER EM FATORES
by(dat, dat$species, function(x){
  # CALCULA O COMPRIMENTO MÉDIO DA PTALA PARA CADA SPECIE
  mean.p1 <- mean(x$petal.length)
})



# ------------------------------------ LAPPLY()---------------- 

lista2 <- list(a = (1:10), b = (45:77))
lista2
lapply(lista2, sum)
sapply(lista2, sum)


# --------------------------------------- VAPPLY()

vapply(lista2, fivenum, c(Min. = 0, "1stQu." = 0, Median = 0, "3rd Qu." = 0, Max = 0)) # Como se fosse o agg() no Python


# ---------------- REPLICATE
?replicate

replicate(7, runif(10))


mapply(rep, 1:4, 4:3)
